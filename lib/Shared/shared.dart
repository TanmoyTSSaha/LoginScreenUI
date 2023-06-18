import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String textFieldLabel;
  final bool isPassword;
  CustomTextField({
    required this.icon,
    required this.textFieldLabel,
    this.isPassword = false,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(widget.icon),
        SizedBox(
          width: Get.width * 0.825,
          child: widget.isPassword
              ? TextFormField(
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    )),
                    labelText: widget.textFieldLabel,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        )),
                  ),
                )
              : TextFormField(
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                        borderSide: BorderSide(
                      width: 0.5,
                      color: Colors.grey,
                    )),
                    labelText: widget.textFieldLabel,
                  ),
                ),
        ),
      ],
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String buttonName;
  final void Function() onTap;
  final bool isLoading;
  final String loadingText;
  const CustomElevatedButton({
    required this.buttonName,
    required this.onTap,
    required this.isLoading,
    required this.loadingText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0164FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(Get.width, 50)),
      child: isLoading
          ? Row(
              children: [
                const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: Get.width * 0.25),
                Text(
                  loadingText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            )
          : Text(
              buttonName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String buttonName;
  final void Function() onTap;
  const CustomTextButton({
    required this.buttonName,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        foregroundColor: Colors.blue,
      ),
      child: Text(
        buttonName,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
      ),
    );
  }
}
