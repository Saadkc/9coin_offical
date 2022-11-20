import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/auth/services/auth.dart';
import 'package:ninecoin/features/auth/ui/login_page.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/new_password_reset.dart';
import 'package:ninecoin/utilities/dialogs/password_reset.dart';

import '../../../utilities/dialogs/error_dialoge.dart';

class ChangePasswordPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const ChangePasswordPage());
  }

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: CoinColors.black12,
            centerTitle: true,
            title: Text(
              "Change Password",
              style: CoinTextStyle.title1,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Text(
                      "Change Your Password",
                      style: CoinTextStyle.title1.copyWith(
                        color: CoinColors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                        controller: _currentPasswordController,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: "Current Password",
                          suffixIcon: Icon(
                            Icons.lock,
                            color: CoinColors.orange,
                          ),
                        )),
                    const SizedBox(height: 30),
                    TextFormField(
                        controller: _newPasswordController,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: "New Password",
                          suffixIcon: Icon(
                            Icons.lock,
                            color: CoinColors.orange,
                          ),
                        )),
                    const SizedBox(height: 30),
                    TextFormField(
                        controller: _confirmPasswordController,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                          suffixIcon: Icon(
                            Icons.lock,
                            color: CoinColors.orange,
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      height: 50,
                      width: size.width,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await showResetPasswordDialog(context)) {
                              if (_newPasswordController.text ==
                                  _confirmPasswordController.text) {
                                changePassword(
                                        currentPassword:
                                            _currentPasswordController.text,
                                        newPassword:
                                            _newPasswordController.text)
                                    .then((value) async {
                                  if (await showNewPasswordResetDialog(
                                      context, value)) {
                                    Navigator.pop(context);
                                  }
                                }).catchError((err) async {
                                  await showErrorDialog(
                                      context, "Error", "$err");
                                });
                              } else {
                                await showErrorDialog(
                                    context, "Error", "Passwords do not match");
                              }
                            }
                          }
                        },
                        child: Text(
                          "Change  Password",
                          style: CoinTextStyle.title2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
