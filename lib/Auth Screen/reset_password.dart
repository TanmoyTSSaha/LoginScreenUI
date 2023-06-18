import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Shared/shared.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isLoading = false;
  bool isVisibilityOn = false;
  bool isVisibilityOn2 = false;
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
                        'assets/reset_password.jpeg',
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
                      'Reset\nPassword',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        height: 1.25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    icon: Icons.lock_outline_rounded,
                    textFieldLabel: 'Password',
                    isPassword: true,
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    icon: Icons.lock_outline_rounded,
                    textFieldLabel: 'Confirm Password',
                    isPassword: true,
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
                    },
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
