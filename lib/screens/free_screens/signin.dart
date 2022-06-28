import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/models/auth/sign_in.dart';
import 'package:wasafi_market/screens/free_screens/signup.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void _login() {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      AuthController authController = Get.find<AuthController>();

      if (phone.isEmpty) {
        showCustomSnackBar("Type mobile number e.g 07 **** ****",
            title: "Mobile number");
      } else if (phone.length > 10) {
        showCustomSnackBar("Mobile number should not exceed 10 characters!",
            title: "Mobile number");
      } else if (phone.length < 10) {
        showCustomSnackBar(
            "Mobile number should not be less than 10 characters!",
            title: "Mobile number");
      } else if (password.length < 6) {
        showCustomSnackBar("Password should atleast have six characters!",
            title: "Password");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type password with atleast six characters!",
            title: "Password");
      } else {
        SignInBody signInBody =
            SignInBody(phone: phone.substring(1), password: password);

        authController.login(signInBody).then((status) {
          if (status.isSuccess) {
            String name = authController.user;
            showCustomSnackBar("Welcome $name!", title: "Login Successful");
            Get.to(() => const Parent());
          } else {
            showCustomSnackBar("Login failed! try again!", title: "Login");
          }
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<AuthController>(builder: (signData) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Bold(text: "Sign In", size: 22),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white30),
                    color: Colors.white12),
                child: TextField(
                  controller: phoneController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white70),
                      hintText: " Mobile Number e.g 07*********"),
                )),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Colors.white30),
                    color: Colors.white12),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  obscuringCharacter: "*",
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.white70),
                      hintText: "Password"),
                )),
            GestureDetector(
              onTap: () {
                _login();
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(horizontal: 60),
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.blueAccent.shade700,
                    borderRadius: BorderRadius.circular(16)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  signData.isLoading
                      ? const CupertinoActivityIndicator()
                      : const Regular(
                          color: Colors.white,
                          text: "Sign In ",
                          size: 15,
                        ),
                  signData.isLoading
                      ? const Regular(
                          text: " Loading", size: 14, color: Colors.white)
                      : const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(
                            CupertinoIcons.chevron_right,
                            color: Colors.white,
                          ),
                        )
                ]),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const SignUp(), transition: Transition.zoom);
              },
              child: const Regular(
                  text: " Have no account Yet? Sign Up Now",
                  size: 14,
                  color: Colors.blueAccent),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => const Parent(),
                      transition: Transition.leftToRightWithFade);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white24),
                  child: const Icon(CupertinoIcons.arrow_left),
                ))
          ],
        );
      }),
    );
  }
}
