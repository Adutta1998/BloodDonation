// Cubit:
import 'package:bloc/bloc.dart';
import 'package:blood_donation/repositories/authentication_repository.dart';
import 'package:blood_donation/utils/common_utils.dart';
import 'package:equatable/equatable.dart';

class SignInCubit extends Cubit<SignInState> {
  AuthenticationRepository authRepository;
  SignInCubit({required this.authRepository}) : super(SignInState());

  void updateEmail(String s) {
    if (s != "" && isValidEmail(s)) {
      emit(state.copyWith(email: s));
    } else {}
  }

  void updatePassword(String s) {
    emit(state.copyWith(password: s));
  }

  login() {
    authRepository.signin(state.email, state.password);
  }
}

// State:

class SignInState {
  final String? email;
  final String? password;
  final bool loaded;
  final bool loading;
  final bool error;
  final String errorMsg;

  const SignInState({
    this.email,
    this.password,
    this.error = false,
    this.errorMsg = "",
    this.loaded = false,
    this.loading = false,
  });

  SignInState copyWith(
      {String? email,
      String? password,
      bool? loading,
      bool? loaded,
      bool? error,
      String? errorMsg}) {
    return SignInState(
        email: email ?? this.email,
        password: password ?? this.password,
        loaded: loaded ?? this.loaded,
        loading: loading ?? this.loading,
        error: error ?? this.error,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  String toString() {
    return "SignInState{email:$email,password:$password,loaded:$loaded,loading:$loading,error:$error,errorMsg:$errorMsg}";
  }
}

class SignInInitial extends SignInState {}
