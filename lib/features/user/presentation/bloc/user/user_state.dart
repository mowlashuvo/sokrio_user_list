part of 'user_bloc.dart';

enum UserStatus { initial, loading, success, error }

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserStatus.initial) UserStatus status,
    @Default([]) List<UserDataEntity> data,
    @Default(false) bool hasReachedMax,
    @Default(false) bool isLoadingMore,
    String? error,
    String? message,
  }) = _UserState;
}
