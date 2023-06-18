import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page_ui/Auth%20Screen/reset_password.dart';
import 'package:pinput/pinput.dart';

import '../Shared/shared.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
                      'assets/verification.jpg',
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter OTP',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "An 4 digit code has been sent to +91 1234567890",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Pinput(
                      defaultPinTheme: PinTheme(
                        height: 48,
                        width: 48,
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(
                            width: 1,
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),
                  CustomElevatedButton(
                    buttonName: 'Submit',
                    isLoading: isLoading,
                    loadingText: 'Submitting',
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
                      Get.to(
                        () => const ResetPasswordScreen(),
                      );
                    },
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
