import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final IconData? iconLeft;
  final IconData? iconRight;
  final bool fullWidth;
  final Widget? leadingIcon;
  final ButtonSize size;

  const CustomButton._internal({
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.iconLeft,
    this.iconRight,
    this.fullWidth = true,
    this.leadingIcon,
    this.size = ButtonSize.medium,
    super.key,
  });

  /// Các factory constructors như trước, thêm `size` là optional parameter mặc định `medium`
  factory CustomButton.primary(String text, VoidCallback onPressed, {ButtonSize size = ButtonSize.medium}) {
    return CustomButton._internal(
      text: text,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF00DFA2),
      textColor: Colors.white,
      size: size,
    );
  }

  factory CustomButton.secondary(String text, VoidCallback onPressed, {ButtonSize size = ButtonSize.medium}) {
    return CustomButton._internal(
      text: text,
      onPressed: onPressed,
      backgroundColor: const Color(0xFFE1FFF4),
      textColor: const Color(0xFF00DFA2),
      size: size,
    );
  }

  factory CustomButton.dark(String text, VoidCallback onPressed, {ButtonSize size = ButtonSize.medium}) {
    return CustomButton._internal(
      text: text,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF2C2C2C),
      textColor: Colors.white,
      size: size,
    );
  }

  factory CustomButton.withIcons({
    required String text,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
    IconData? iconLeft,
    IconData? iconRight,
    ButtonSize size = ButtonSize.medium,
  }) {
    return CustomButton._internal(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      textColor: textColor,
      iconLeft: iconLeft,
      iconRight: iconRight,
      size: size,
    );
  }

  factory CustomButton.social({
    required String text,
    required VoidCallback onPressed,
    required Widget icon,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
    ButtonSize size = ButtonSize.medium,
  }) {
    return CustomButton._internal(
      text: text,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      textColor: textColor,
      leadingIcon: icon,
      size: size,
    );
  }

  /// Mapping size → padding, font size, height
  EdgeInsets _paddingBySize() {
    switch (size) {
      case ButtonSize.small:
        return const EdgeInsets.symmetric(vertical: 10, horizontal: 16);
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: 14, horizontal: 20);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(vertical: 18, horizontal: 24);
    }
  }

  double _fontSizeBySize() {
    switch (size) {
      case ButtonSize.small:
        return 14;
      case ButtonSize.medium:
        return 16;
      case ButtonSize.large:
        return 18;
    }
  }

  double _minHeightBySize() {
    switch (size) {
      case ButtonSize.small:
        return 40;
      case ButtonSize.medium:
        return 56;
      case ButtonSize.large:
        return 64;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        padding: _paddingBySize(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: fullWidth ? Size(double.infinity, _minHeightBySize()) : null,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconLeft != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(iconLeft, size: 20, color: textColor),
            ),
          if (leadingIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: leadingIcon,
            ),
          Text(
            text,
            style: TextStyle(
              fontSize: _fontSizeBySize(),
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          if (iconRight != null)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(iconRight, size: 20, color: textColor),
            ),
        ],
      ),
    );
  }
}