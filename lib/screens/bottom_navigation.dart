import 'package:blood_donation/models/navigation.model.dart';
import 'package:blood_donation/screens/Home.dart';
import 'package:blood_donation/screens/search_screen.dart';
import 'package:blood_donation/screens/signup.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late List<NavigationModel> navigations;
  int index = 0;
  @override
  void initState() {
    super.initState();
    navigations = [
      NavigationModel(
          label: "Home", icon: Icon(Icons.home), widget: HomeScreen()),
      NavigationModel(
          label: "Search", icon: Icon(Icons.search), widget: SearchScreen()),
      NavigationModel(
          label: "History", icon: Icon(Icons.history), widget: HomeScreen()),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigations[index].widget,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          selectedItemColor: CustomColors.primaryColor,
          unselectedItemColor: CustomColors.tertiaryColor,
          onTap: (i) {
            setState(() {
              index = i;
            });
          },
          items: navigations != null
              ? navigations
                  .map((e) =>
                      BottomNavigationBarItem(icon: e.icon, label: e.label))
                  .toList()
              : []),
    );
  }
}
