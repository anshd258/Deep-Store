import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:partner/UI/widget/Profile.container.dart';
import 'package:partner/UI/widget/Profile.optionsContainer.dart';
import 'package:partner/middleware/auth_cubit.dart';

import '../../widget/OutlinedDeclineButton.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            const ProfileContainer(),
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedDeclineButton(
                        function: () {
                          context.read<AuthCubit>().logout().then((value) =>
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/", (route) => false));
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
      ),
    );
  }
}
