import 'dart:developer';

import 'package:blood_donation/api_clients/api_client.dart';
import 'package:blood_donation/cubits/home_cubit.dart';
import 'package:blood_donation/models/Home.model.dart';
import 'package:blood_donation/models/profile.model.dart';
import 'package:blood_donation/repositories/users_repository.dart';
import 'package:blood_donation/screens/profile_screen.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:supabase/supabase.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  static const ROUTE_NAME = "/";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var api = BDApi();
    User user = api.getLoggedInUser();
    var repository = context.watch<UsersRepository>();
    HomeCubit cubit = HomeCubit(repository: repository);
    cubit.loadHomeResponse();

    return BlocProvider<HomeCubit>(
      create: (context) => cubit,
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<HomeCubit, HomeState>(
            bloc: cubit,
            listener: (context, state) {
              log(state.user!.name);
            },
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileScreen.ROUTE_NAME);
                      },
                      child: headerView(context, state),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New Requests",
                          style: CustomFontStyle.hintText,
                        ),
                        Row(
                          children: [
                            Text(
                              "All",
                              style: CustomFontStyle.hintText,
                            ),
                            IconButton(
                              onPressed: () {
                                context.read<HomeCubit>().loadHomeResponse();
                              },
                              icon: Icon(Icons.refresh_outlined),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    newRequestWidget(context, state),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  headerView(BuildContext context, HomeState state) {
    print(state.user?.name);
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            state.user?.profileImage ?? "",
            errorBuilder: (a, b, c) => Icon(Icons.broken_image),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              state.user?.name ?? "",
              style: CustomFontStyle.bolderFontStyle,
            ),
            Text(
              state.user?.email ?? "",
            )
          ],
        ),
        Expanded(child: Container()),
        IconButton(
            onPressed: () {
              showDialog(context: context, builder: (_) => moreDialog());
            },
            icon: Icon(Icons.more_vert))
      ],
    );
  }

  newRequestWidget(BuildContext context, HomeState state) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      //padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: ListView.builder(
        itemCount: state.homeResponse.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (_, i) {
          ProfileModel requester = state.homeResponse[i].user;
          HomeModel? home = state.homeResponse[i];
          return ListTile(
            isThreeLine: true,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                requester.profileImage ?? "",
                errorBuilder: (a, b, c) => Icon(Icons.broken_image),
              ),
            ),
            title: Text(requester.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Requested Blood Group: ${home?.bloodGroup}"),
                Text(
                    "Date: ${home?.date.day}-${home?.date.month}-${home?.date.year}"),
                Text("Where: ${home?.city}, ${home?.state}"),
                Text("Phone: ${requester.phone}"),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.done,
                      color: CustomColors.success,
                    ),
                    Icon(
                      Icons.close,
                      color: CustomColors.error,
                    )
                  ],
                ),
                InkWell(
                  radius: 5,
                  splashColor: CustomColors.redAccent1,
                  onTap: () async {
                    if (!await launch("tel:${requester.phone}"))
                      throw 'Could not launch tel:${requester.phone}';
                  },
                  child: Icon(
                    Icons.phone,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  moreDialog() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      children: [
        ListTile(
          leading: Icon(Icons.settings),
          title: Text(
            "Settings",
            style: CustomFontStyle.hintText,
          ),
        ),
        ListTile(
          leading: Icon(Icons.person_add),
          title: Text(
            "Invite",
            style: CustomFontStyle.hintText,
          ),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            "Logout",
            style: CustomFontStyle.hintText,
          ),
        ),
      ],
    );
  }
}
