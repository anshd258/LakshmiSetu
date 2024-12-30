import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_provider_event.dart';
part 'auth_provider_state.dart';
part 'auth_provider_bloc.freezed.dart';

class AuthProviderBloc extends Bloc<AuthProviderEvent, AuthProviderState> {
  AuthProviderBloc() : super(_Initial()) {
    on<_Started>((event, emit) {

    });

    on<_LoggedIn>((event, emit) {});
  }
}
