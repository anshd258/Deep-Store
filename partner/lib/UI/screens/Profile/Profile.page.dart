import 'package:flutter/material.dart';
import 'package:partner/UI/widget/Profile.container.dart';
import 'package:partner/UI/widget/Profile.optionsContainer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProfileContainer(),
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
          )
        ],
      ),
    );
  }
}
