import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Shared/shared.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                        'assets/forgot_password.jpeg',
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
                      'Forgot\nPassword?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Don't worry! it happens, Please enter the address associated with your account",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 36),
                  CustomTextField(
                    icon: Icons.email_outlined,
                    textFieldLabel: 'Email ID / Mobile Number',
                  ),
                  const SizedBox(height: 36),
                  CustomElevatedButton(
                    buttonName: 'Submit',
                    loadingText: 'Submitting',
                    onTap: () {
                      setState(() async {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(const Duration(seconds: 2));
                        setState(() {
                          isLoading = false;
                        });
                        Get.to(
                          () => const OTPScreen(),
                        );
                      });
                    },
                    isLoading: isLoading,
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
