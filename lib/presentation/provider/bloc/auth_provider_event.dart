part of 'auth_provider_bloc.dart';

@freezed
class AuthProviderEvent with _$AuthProviderEvent {
  const factory AuthProviderEvent.started() = _Started;
  const factory AuthProviderEvent.loggedIn() = _LoggedIn;
}