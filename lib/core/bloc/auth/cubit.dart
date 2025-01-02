import 'package:bloc/bloc.dart';
import 'package:lakshmi_setu/core/bloc/auth/states.dart';
import 'package:lakshmi_setu/data/apis/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthInitial());

  Future<void> signUp(String phoneNumber) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _authRepository.signUpWithPhoneNumber(phoneNumber);
      final user = _authRepository.getCurrentUser();
      emit(state.copyWith(isLoading: false, user: user, errorMessage: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> verifyOTP(String otp) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final user = await _authRepository.verifyPhoneNumberWithOTP(otp);
      emit(state.copyWith(isLoading: false, user: user, errorMessage: null));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(isLoading: true));
    await _authRepository.signOut();
    emit(const AuthInitial());
    emit(state.copyWith(isLoading: false));
  }
}
