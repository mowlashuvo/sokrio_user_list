import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/util/constant.dart';
import '../../../domain/usecases/user_usecase.dart';
import '../../../domain/entities/user_entity.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase _useCase;
  final SharedPreferences _prefs;
  final NetworkInfo _networkInfo;

  int currentPage = 1;
  bool hasReachedMax = false;
  bool isLoading = false;
  List<UserDataEntity> userList = [];

  UserBloc({
    required UserUseCase useCase,
    required SharedPreferences prefs,
    required NetworkInfo networkInfo,
  })  : _useCase = useCase,
        _prefs = prefs,
        _networkInfo = networkInfo,
        super(const UserState()) {
    on<UserLoadEvent>(_onLoadUser);
    on<UserRefreshEvent>(_onRefresh);
    on<UserSearchEvent>(_onUserSearch);
  }

  String getPageCacheKey(int page) => 'user_list_page_$page';
  String cachedPageTimestampKey = 'user_list_page_timestamp';

  Future<void> _onLoadUser(UserLoadEvent event, Emitter<UserState> emit) async {
    if (hasReachedMax || isLoading) return;
    isLoading = true;

    emit(state.copyWith(status: UserStatus.loading, isLoadingMore: currentPage != 1));

    // Check connectivity via NetworkInfo
    if (!await _networkInfo.isConnected) {
      emit(state.copyWith(
        status: UserStatus.error,
        error: 'No Internet Connection',
        data: List.from(userList),
      ));
      isLoading = false;
      return;
    }

    // Check cached page
    final cachedPageJson = _prefs.getStringList(getPageCacheKey(currentPage));
    final cachedPageTimestampStr = _prefs.getString('$cachedPageTimestampKey$currentPage');

    if (cachedPageJson != null && cachedPageTimestampStr != null) {
      final cachedTimestamp = DateTime.parse(cachedPageTimestampStr);
      if (DateTime.now().difference(cachedTimestamp) < Constant.userCacheDuration) {
        final cachedPageList = cachedPageJson
            .map((e) => UserDataEntity.fromJson(jsonDecode(e) as Map<String, dynamic>))
            .toList();
        userList.addAll(cachedPageList);
        currentPage++;

        emit(state.copyWith(
          status: UserStatus.success,
          data: List.from(userList),
          hasReachedMax: false,
          isLoadingMore: false,
        ));
        isLoading = false;
        return;
      }
    }

    // Fetch from API
    final result = await _useCase.getUser(page: currentPage, limit: Constant.userPageLimit);
    result.fold((failure) {
      emit(state.copyWith(
        status: UserStatus.error,
        error: failure.message,
        data: List.from(userList),
      ));
      isLoading = false;
    }, (data) {
      final pageData = data.data;
      if ((data.totalPages ?? 0) <= currentPage) hasReachedMax = true;
      userList.addAll(pageData);

      emit(state.copyWith(
        status: UserStatus.success,
        data: List.from(userList),
        hasReachedMax: hasReachedMax,
        isLoadingMore: false,
      ));

      // Cache page
      final encodedList = pageData.map((e) => jsonEncode(e.toJson())).toList();
      _prefs.setStringList(getPageCacheKey(currentPage), encodedList);
      _prefs.setString('$cachedPageTimestampKey$currentPage', DateTime.now().toIso8601String());

      currentPage++;
      isLoading = false;
    });
  }

  Future<void> _onRefresh(UserRefreshEvent event, Emitter<UserState> emit) async {
    currentPage = 1;
    hasReachedMax = false;
    isLoading = true;
    userList.clear();

    if (!await _networkInfo.isConnected) {
      emit(state.copyWith(
        status: UserStatus.error,
        error: 'No Internet Connection',
        data: [],
      ));
      isLoading = false;
      return;
    }

    final result = await _useCase.getUser(page: 1, limit: Constant.userPageLimit);
    result.fold((failure) {
      emit(state.copyWith(status: UserStatus.error, error: failure.message));
      isLoading = false;
    }, (data) {
      // Clear old cache
      final totalPages = data.totalPages ?? 1;
      for (int i = 1; i <= totalPages; i++) {
        _prefs.remove(getPageCacheKey(i));
        _prefs.remove('$cachedPageTimestampKey$i');
      }

      final pageData = data.data;
      userList.addAll(pageData);
      hasReachedMax = (data.totalPages ?? 0) <= currentPage;

      emit(state.copyWith(
        status: UserStatus.success,
        data: List.from(userList),
        hasReachedMax: hasReachedMax,
        message: 'User list updated',
      ));

      // Cache refreshed page
      final encodedList = pageData.map((e) => jsonEncode(e.toJson())).toList();
      _prefs.setStringList(getPageCacheKey(1), encodedList);
      _prefs.setString('${cachedPageTimestampKey}1', DateTime.now().toIso8601String());

      currentPage++;
      isLoading = false;
    });
  }

  Future<void> _onUserSearch(UserSearchEvent event, Emitter<UserState> emit) async {
    final query = event.query?.trim().replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
    if (query == null || query.isEmpty) {
      emit(state.copyWith(data: List.from(userList)));
      return;
    }

    final filtered = userList.where((user) {
      return (user.firstName?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (user.lastName?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();

    emit(state.copyWith(data: filtered));
  }
}