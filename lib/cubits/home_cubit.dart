// Cubit:
import 'package:bloc/bloc.dart';
import 'package:blood_donation/models/Home.model.dart';
import 'package:blood_donation/models/profile.model.dart';
import 'package:blood_donation/repositories/users_repository.dart';
import 'package:equatable/equatable.dart';

class HomeCubit extends Cubit<HomeState> {
  UsersRepository repository;
  HomeCubit({required this.repository}) : super(HomeState());

  void loadHomeResponse() async {
    var userProfile = await repository.getUser();
    var homeResponse = await repository.getHome();
    emit(state.copyWith(response: homeResponse, user: userProfile));
  }
}

// State:

class HomeState extends Equatable {
  final bool isLoading;
  final bool isError;
  final String errorMessage;
  final ProfileModel? user;
  final List<dynamic> homeResponse;
  const HomeState({
    this.errorMessage = "",
    this.isLoading = false,
    this.isError = false,
    this.homeResponse = const [],
    this.user,
  });

  HomeState copyWith(
      {bool? isLoading,
      bool? isError,
      String? error_message,
      ProfileModel? user,
      List<dynamic>? response}) {
    return HomeState(
      errorMessage: error_message ?? this.errorMessage,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      homeResponse: response ?? this.homeResponse,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [
        this.homeResponse,
        this.errorMessage,
        this.isError,
        this.isLoading,
        this.user ?? ""
      ];

  @override
  String toString() {
    return props.toString();
  }
}
