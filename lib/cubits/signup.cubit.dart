// Cubit:
import 'package:bloc/bloc.dart';
import 'package:blood_donation/repositories/authentication_repository.dart';
import 'package:blood_donation/utils/common_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase/supabase.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepository authRepository;
  SignUpCubit({required this.authRepository}) : super(SignUpState());

  void changeEmail(String s) {
    if (s != "" && isValidEmail(s)) {
      emit(state.copyWith(email: s));
    } else {}
  }

  void changePassword(String s) {
    emit(state.copyWith(password: s));
  }

  void signup() async {
    //print(authRepository == null);
    emit(state.copyWith(loading: true));
    User user = await authRepository.signup(state.email, state.password);
    if (user.email != null) {
      emit(state.copyWith(loading: false, loaded: true));
    }
  }
}

// State:

class SignUpState {
  final String? email;
  final String? password;
  final bool loaded;
  final bool loading;
  final bool error;
  final String errorMsg;

  const SignUpState({
    this.email,
    this.password,
    this.loading = false,
    this.loaded = false,
    this.error = false,
    this.errorMsg = "",
  });

  SignUpState copyWith(
      {String? email,
      String? password,
      bool? loading,
      bool? loaded,
      bool? error,
      String? errorMsg}) {
    return SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        loaded: loaded ?? this.loaded,
        loading: loading ?? this.loading,
        error: error ?? this.error,
        errorMsg: errorMsg ?? this.errorMsg);
  }

  @override
  String toString() {
    return "SignupState{email:$email,password:$password,loaded:$loaded,loading:$loading,error:$error,errorMsg:$errorMsg}";
  }
}

class SignUpInitial extends SignUpState {}
