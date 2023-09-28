import 'package:customer/middleware/helpers/constants.dart';
import 'package:customer/middleware/helpers/shared_preferences_utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/OutlinedDeclineButton.dart';
import '../../widgets/cards/Profile.container.dart';
import '../../widgets/cards/Profile.optionsContainer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String phoneNumber = '';
  @override
  Widget build(BuildContext context) {
    SharedPreferencesUtils.getString(key: SharedPrefrencesKeys.userPhoneNumber)
        .then((value) {
      setState(() {
        phoneNumber = value ?? '';
      });
    });
    return Scaffold(
      body: Column(
        children: <Widget>[
          ProfileContainer(
              name: '', phoneNumber: phoneNumber, joinedDate: '12/01/22'),
          ProfileOptions(
            lable: 'Request History',
            function: () {},
          ),
          ProfileOptions(
            lable: 'Edit Profile',
            function: () {
              Navigator.of(context).pushNamed('/editprofile');
            },
          ),
          ProfileOptions(
            lable: 'Terms & Conditions',
            function: () {},
          ),
          Container(
            height: 200,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedDeclineButton(
                      function: () {
                        SharedPreferencesUtils.clear();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/', (route) => false);
                      },
                      color: const Color(0xFFC25C5C),
                      icon: Icons.logout_outlined,
                      height: 42,
                      margin: const EdgeInsets.all(2),
                      borderradius: 4,
                      lable: "Log out",
                      width: 158),
                  OutlinedDeclineButton(
                      function: () {},
                      icon: Icons.headset_mic_outlined,
                      color: const Color.fromRGBO(34, 150, 199, 1),
                      height: 42,
                      margin: const EdgeInsets.all(2),
                      borderradius: 4,
                      lable: "call Support",
                      width: 158)
                ]),
          ),
        ],
      ),
    );
  }
}
