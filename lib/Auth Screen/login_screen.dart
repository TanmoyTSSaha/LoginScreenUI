import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_page_ui/Auth%20Screen/forgot_password_screen.dart';
import 'package:login_page_ui/Auth%20Screen/sign_up_screen.dart';

import '../Shared/shared.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'assets/vecteezy_illustration-of-people-trying-to-solve-the-puzzle-of_9734274.jpg',
                        fit: BoxFit.cover,
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
                      'Login',
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
                    icon: Icons.lock_outline_rounded,
                    textFieldLabel: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CustomTextButton(
                      buttonName: 'Forgot Password?',
                      onTap: () {
                        setState(() {
                          Get.to(
                            () => const ForgotPasswordScreen(),
                          );
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomElevatedButton(
                    buttonName: 'Login',
                    isLoading: isLoading,
                    loadingText: 'Logging',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * 0.4,
                        child: const Divider(
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.4,
                        child: const Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFf1f5f6),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(Get.width, 50)),
                    child: Row(
                      children: [
                        Logo(Logos.google, size: 24),
                        SizedBox(width: Get.width * 0.2),
                        const Text(
                          'Login with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'New to Logistic? ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                      CustomTextButton(
                        buttonName: 'Register',
                        onTap: () {
                          setState(() {
                            Get.to(() => const SignUpScreen());
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
