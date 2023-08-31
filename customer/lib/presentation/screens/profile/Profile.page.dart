import 'package:flutter/material.dart';

import '../../widgets/Profile.container copy.dart';
import '../../widgets/Profile.optionsContainer copy.dart';

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
