import 'package:blood_donation/custom_widgets/buttons.dart';
import 'package:blood_donation/utils/colors.dart';
import 'package:blood_donation/utils/fonts.dart';
import 'package:flutter/material.dart';

class SearchUserPage extends StatelessWidget {
  const SearchUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("People"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          locationWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Available",
              style: CustomFontStyle.bolderFontStyle,
            ),
          ),
          ListView.builder(
            itemBuilder: (_, i) => availableUserWidget(),
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }

  locationWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.baseColor,
        border: Border.all(color: CustomColors.dividerColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: CustomFontStyle.bolderFontStyle,
          ),
          Row(
            children: [
              Icon(
                Icons.location_city,
                size: 35,
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                "Kalyani",
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.miscellaneous_services_rounded,
                size: 35,
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                "~ 3km",
                style: CustomFontStyle.subtitleFontStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  availableUserWidget() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: CustomColors.baseColor,
        border: Border.all(color: CustomColors.dividerColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(34),
                child: Image.network("https://i.pravatar.cc/48"),
              ),
              Row(
                children: [
                  Icon(
                    Icons.bloodtype_rounded,
                    color: CustomColors.redAccent1,
                  ),
                  Text("B+"),
                ],
              )
            ],
          ),
          Text(
            "Avinaba Dutta",
            style: CustomFontStyle.bolderFontStyle,
          ),
          Text("Nisith Sarani,\n Modhya MOhanbati,\n Raiganj, Uttar Dinajpur"),
          SizedBox(
            height: 16,
          ),
          PrimaryButton(text: "Request"),
        ],
      ),
    );
  }
}
