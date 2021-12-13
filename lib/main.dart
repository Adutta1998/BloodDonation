import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blood_donation/api_clients/api_client.dart';
import 'package:blood_donation/repositories/authentication_repository.dart';
import 'package:blood_donation/repositories/users_repository.dart';
import 'package:blood_donation/screens/Home.dart';
import 'package:blood_donation/screens/bottom_navigation.dart';
import 'package:blood_donation/screens/signin.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  BDApi _apiClient = BDApi();
  runApp(
    MainApp(
      authenticationRepository: AuthenticationRepository(api: _apiClient),
      usersRepository: UsersRepository(),
    ),
  );
}

class MainApp extends StatelessWidget {
  final AuthenticationRepository? authenticationRepository;

  final UsersRepository? usersRepository;
  const MainApp({Key? key, this.authenticationRepository, this.usersRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BDApi api = BDApi();
    print(api.getLoggedInUser());
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>.value(
          value: authenticationRepository!,
        ),
        RepositoryProvider<UsersRepository>.value(
          value: usersRepository!,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: CustomColors.baseColor,
            appBarTheme:
                AppBarTheme(backgroundColor: CustomColors.primaryColor)),
        home: (api.getLoggedInUser() != null)
            ? const BottomNavigationScreen()
            : SignInScreen(),
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
