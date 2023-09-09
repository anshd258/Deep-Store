import 'package:flutter/material.dart';

import 'package:partner/UI/widget/Profile.container.dart';
import 'package:partner/UI/widget/Profile.optionsContainer.dart';

import '../../widget/OutlinedDeclineButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            ProfileContainer(),
            ProfileOptions(
              lable: 'Request History',
              function: () {
                Navigator.of(context).pushNamed('/history');
              },
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedDeclineButton(
                        function: () {},
                        color: Color(0xFFC25C5C),
                        icon: Icons.logout_outlined,
                        height: 42,
                        margin: EdgeInsets.all(2),
                        borderradius: 4,
                        lable: "Log out",
                        width: 158),
                    OutlinedDeclineButton(
                        function: () {},
                        icon: Icons.headset_mic_outlined,
                        color: Color.fromRGBO(34, 150, 199, 1),
                        height: 42,
                        margin: EdgeInsets.all(2),
                        borderradius: 4,
                        lable: "call Support",
                        width: 158)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
