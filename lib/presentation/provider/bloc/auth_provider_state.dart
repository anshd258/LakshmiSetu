part of 'auth_provider_bloc.dart';

@freezed
class AuthProviderState with _$AuthProviderState {
  const factory AuthProviderState.initial() = _Initial;
  const factory AuthProviderState.loading() = _Loading;
}
