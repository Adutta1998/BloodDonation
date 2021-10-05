import 'package:bloc/bloc.dart';
import 'package:blood_donation/api_clients/api_client.dart';
import 'package:blood_donation/repositories/authentication_repository.dart';
import 'package:blood_donation/repositories/users_repository.dart';
import 'package:blood_donation/screens/home_screen.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  BDApi _apiClient = BDApi();
  runApp(MainApp(
      authenticationRepository: AuthenticationRepository(api: _apiClient)));
}

class MainApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  final UsersRepository? usersRepository;
  const MainApp(
      {Key? key, required this.authenticationRepository, this.usersRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: CustomColors.baseColor,
          appBarTheme: AppBarTheme(backgroundColor: CustomColors.primaryColor)),
      home: const HomeScreen(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
