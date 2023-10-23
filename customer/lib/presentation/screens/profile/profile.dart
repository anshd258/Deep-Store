import 'package:customer/middleware/blocs/authentication/auth_cubit.dart';
import 'package:customer/middleware/blocs/food/food_cubit.dart';
import 'package:customer/middleware/blocs/payment/payment_cubit.dart';
import 'package:customer/middleware/blocs/rental/rental_cubit.dart';
import 'package:customer/middleware/blocs/ride/ride_cubit.dart';
import 'package:customer/middleware/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../middleware/helpers/sharedprefrence.utils.dart';
import '../../widgets/buttons/OutlinedDeclineButton.dart';
import '../../widgets/cards/profile.container.dart';
import '../../widgets/cards/profile.options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _uri = Uri(scheme: 'tel', path: '9804440913');
  @override
  void initState() {
    super.initState();
    SharedPreferencesUtils.getString(key: SharedPrefrencesKeys.userPhoneNumber)
        .then((value) {
      context.read<AuthCubit>().getUserDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      state.user != null
                          ? ProfileContainer(
                              name:
                                  '${state.user!.firstName} ${state.user!.lastName} ',
                              phoneNumber: state.user!.contact ?? '',
                              email: state.user!.email ?? '',
                              room: state.user?.room ?? '',
                            )
                          : Container(
                              height: 200,
                              child: const Center(
                                  child: CircularProgressIndicator())),
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
                        function: () {
                          Navigator.of(context)
                              .pushNamed('/termsandconditions');
                        },
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: OutlinedDeclineButton(
                                function: () {
                                  SharedPreferencesUtils.clear();
                                  context.read<FoodCubit>().clear();
                                  context.read<RentalCubit>().clear();
                                  context.read<RideCubit>().clear();
                                  context.read<PaymentCubit>().clear();
                                  context.read<AuthCubit>().clear();

                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/login', (route) => false);
                                },
                                color: const Color(0xFFC25C5C),
                                icon: Icons.logout_outlined,
                                height: 42,
                                margin: const EdgeInsets.all(2),
                                borderradius: 4,
                                lable: "Log out",
                                width: 158),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: OutlinedDeclineButton(
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
                                width: 158),
                          )
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
