import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wasafi_market/controllers/auth_controller.dart';
import 'package:wasafi_market/controllers/verification.dart';
import 'package:wasafi_market/main.dart';
import 'package:wasafi_market/models/sign_up.dart';
import 'package:wasafi_market/models/verification.dart';
import 'package:wasafi_market/screens/free_screens/signin.dart';
import 'package:wasafi_market/widgets/show_snackbar.dart';
import 'package:wasafi_market/widgets/text/bold.dart';
import 'package:wasafi_market/widgets/text/regular.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void _registrationValidation() {
      String username = usernameController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      var authController = Get.find<AuthController>();
      var verifyController = Get.find<VerificationController>();

      if (username.isEmpty) {
        showCustomSnackBar("Type in your username", title: "Username");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type your mobile number Eg. 07 **** ** **",
            title: "Mobile Number");
      } else if (phone.length >= 11) {
        showCustomSnackBar("Mobile number should not exceed 10 numbers!",
            title: "Mobile Number");
      } else if (phone.length <= 9) {
        showCustomSnackBar("Mobile number should not be less than 10 numbers!",
            title: "Mobile Number");
      } else if (password.length < 6) {
        showCustomSnackBar("Password show atleast be more than six characters",
            title: 'Password');
      } else {
        SignUpBody signUpBody = SignUpBody(
            username: username,
            phone: phone.substring(1),
            password: password,
            gender: "male",
            email: "chazy2@gmail.com",
            age: 33);

        authController.registration(signUpBody).then((status) {
          if (status.isSuccess) {
            showModalBottomSheet(
                context: context,
                barrierColor: Colors.black.withOpacity(.9),
                isDismissible: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) {
                  TextEditingController codeController =
                      TextEditingController();
                  var number = signUpBody.phone;

                  void sendVerify(String text) {
                    String code = codeController.text.trim();

                    VerificationModel verificationController =
                        VerificationModel(verificationCode: code);

                    verifyController
                        .verification(verificationController)
                        .then((status) {
                      if (status.isSuccess) {
                        Get.to(() => const Parent());
                        showCustomSnackBar("Registration successfull!",
                            title: "Registration");
                      } else {
                        showCustomSnackBar("Try again to enter the code send!",
                            title: "Verification Failed");
                        text = '';
                      }
                    });
                  }

                  return GetBuilder<VerificationController>(builder: (data) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.8),
                      ),
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Bold(text: "Verify Number", size: 22),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: Text(
                              "Verify 0$number by entering the 4 digits code send to your number",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 6),
                              width: 150,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1, color: Colors.white30),
                                  color: Colors.white12),
                              child: data.isLoading
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            CupertinoActivityIndicator(
                                              color: Colors.white,
                                            ),
                                            Regular(
                                                text: "Verifying",
                                                size: 14,
                                                color: Colors.white)
                                          ]),
                                    )
                                  : TextField(
                                      onChanged: (text) {
                                        if (text.length >= 4) {
                                          sendVerify(text);
                                        }
                                      },
                                      controller: codeController,
                                      maxLength: 4,
                                      style:
                                          const TextStyle(color: Colors.white),
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          counter: Offstage(),
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          hintText: " Enter 4 Code"),
                                    )),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(
                                    CupertinoIcons.chevron_left,
                                    color: Colors.blueAccent,
                                  ),
                                  Regular(
                                      text: "Wrong Number?",
                                      size: 16,
                                      color: Colors.blueAccent)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  });
                });
          } else {
            showCustomSnackBar(status.message, title: "Registration Failed");
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<AuthController>(
          builder: ((authData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Bold(text: "Sign Up", size: 22),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.white30),
                        color: Colors.white12),
                    child: TextField(
                      controller: usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white70),
                          hintText: " Username"),
                    )),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
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
                          hintText: " Mobile Number"),
                    )),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.white30),
                        color: Colors.white12),
                    child: TextField(
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white70),
                          hintText: "Password"),
                    )),
                GestureDetector(
                  onTap: () {
                    _registrationValidation();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    height: 44,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.shade700,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          authData.isLoading
                              ? const CupertinoActivityIndicator()
                              : const Regular(
                                  color: Colors.white,
                                  text: "Sign Up ",
                                  size: 15,
                                ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: authData.isLoading
                                ? const Regular(
                                    text: "Loading",
                                    size: 14,
                                    color: Colors.white)
                                : const Icon(
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
                    Get.to(() => const SignIn(), transition: Transition.zoom);
                  },
                  child: const Regular(
                      text: "Already Have an account? Sign In Now",
                      size: 14,
                      color: Colors.blueAccent),
                )
              ],
            );
          }),
        ));
  }
}
