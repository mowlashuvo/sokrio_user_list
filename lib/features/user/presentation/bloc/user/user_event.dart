part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.load() = UserLoadEvent;
  const factory UserEvent.refresh() = UserRefreshEvent;
  const factory UserEvent.search({String? query}) = UserSearchEvent;
}
