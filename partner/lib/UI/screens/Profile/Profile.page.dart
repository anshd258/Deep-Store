import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner/UI/util/utilwidget.dart';
import 'package:partner/UI/widget/Buttons/OutlinedDeclineButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:partner/UI/widget/Profile.container.dart';
import 'package:partner/UI/widget/Profile.optionsContainer.dart';
import 'package:partner/middleware/auth_cubit.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final _uri = Uri(scheme: 'tel', path: '9804440913');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constrains) {
          return Column(
            children: [
              BlocConsumer<AuthCubit, AuthInitial>(
                listener: (context, state) {
                  if (state.messaage != null) {
                    errorSnackBar(context, state.messaage!);
                  }
                },
                builder: (context, state) {
                  if (state.userObj == null) {
                    return SizedBox(
                      width: constrains.maxWidth,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          ProfileContainer(
                            email: state.userObj!.userdata!.user!.email!,
                            name: state.userObj!.userdata!.username!,
                            phoneNumber: state.userObj!.userdata!.contact!,
                            providerId: state.userObj!.userdata!.propertyId!,
                          ),
                          ProfileOptions(
                            lable: 'Request History',
                            function: () {
                              Navigator.of(context).pushNamed('/history');
                            },
                          ),
                          ProfileOptions(
                            lable: 'Edit Profile',
                            function: () {
                              Navigator.of(context).pushNamed('/editprofile',
                                  arguments: state.userObj!);
                            },
                          ),
                          ProfileOptions(
                            lable: 'Terms & Conditions',
                            function: () {
                              Navigator.pushNamed(context, "/terms");
                            },
                          ),
                        ],
                      ),
                    );
                  } else if (state.messaage != null) {
                    return errorIcon;
                  } else if (state.loading == true) {
                    return progressIndicator;
                  } else {
                    return Center();
                  }
                },
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                        verticalDirection: VerticalDirection.down,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedDeclineButton(
                              function: () {
                                context.read<AuthCubit>().logout().then(
                                    (value) =>
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
                              function: () async {
                                if (await canLaunchUrl(_uri)) {
                                  await launchUrl(_uri,
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                              icon: Icons.headset_mic_outlined,
                              color: const Color.fromRGBO(34, 150, 199, 1),
                              height: 42,
                              margin: const EdgeInsets.all(2),
                              borderradius: 4,
                              lable: "call Support",
                              width: 158)
                        ]),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
