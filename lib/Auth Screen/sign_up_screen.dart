import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page_ui/Auth%20Screen/login_screen.dart';

import '../Shared/shared.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            setState(() {
              Get.back();
            });
          },
          color: Colors.black,
          splashColor: Colors.blue.shade100,
          highlightColor: Colors.blue.shade100,
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            FocusManager.instance.primaryFocus!.unfocus();
          });
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: Get.width / 1.35,
                      // width: Get.width / 1.35,
                      child: Image.asset(
                        'assets/handshaking.jpeg',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      )
                      // SvgPicture.asset(
                      //   'assets/appreciation.svg',
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    icon: Icons.email_outlined,
                    textFieldLabel: 'Email ID',
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                      icon: Icons.person_outline_rounded,
                      textFieldLabel: 'Full Name'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    icon: Icons.phone_outlined,
                    textFieldLabel: 'Mobile',
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    text: TextSpan(
                      text: "By signing up, you're agree to our ",
                      style: const TextStyle(
                          color: Colors.grey, fontSize: 16, height: 1.5),
                      children: [
                        TextSpan(
                          text: 'Terms & Conditions ',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        const TextSpan(
                          text: "and ",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomElevatedButton(
                    buttonName: 'Continue',
                    isLoading: isLoading,
                    loadingText: 'Continuing',
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(
                        const Duration(seconds: 2),
                      );
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Joined us before? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      CustomTextButton(
                        buttonName: 'Login',
                        onTap: () {
                          setState(() {
                            Get.to(
                              () => const LoginScreen(),
                            );
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
