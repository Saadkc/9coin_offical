import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/auth/services/auth.dart';
import 'package:ninecoin/features/auth/ui/login_page.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/new_password_reset.dart';
import 'package:ninecoin/utilities/dialogs/password_reset.dart';

class ForgotPasswordPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => const ForgotPasswordPage());
  }

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = new TextEditingController();
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: CoinColors.black12,
            centerTitle: true,
            title: Text(
              "Forgot Password",
              style: CoinTextStyle.title1,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Reset Your Password",
                    style: CoinTextStyle.title1.copyWith(
                      color: CoinColors.orange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                      "Please enter your email address.You will receive a code to create a new  password via email.",
                      style: CoinTextStyle.title4,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  TextField(
                      controller: emailController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "Your email address",
                      )),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      print(emailController.text);
                      if (await showResetPasswordDialog(context)) {
                        ForgotPassword(email: emailController.text)
                            .then((value) async {
                          print(value);
                          if (await showNewPasswordResetDialog(
                              context, value)) {
                            Navigator.push(context, LoginPage.route());
                          }
                        });
                      }
                    },
                    child: Text(
                      "Reset Password",
                      style: CoinTextStyle.title2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
