import 'package:flutter/material.dart';

import '../../../shared/presentation/utils/pinch_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.isLoading = false,
  }) : super(key: key);
  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final bool isLoading;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              primary: backgroundColor ?? PinchColors.secundary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  Expanded(
                    flex: 4,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: textStyle ??
                          TextStyle(
                              color: PinchColors.background,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (suffixIcon != null) suffixIcon!,
                ],
              ),
            ),
          );
  }
}
