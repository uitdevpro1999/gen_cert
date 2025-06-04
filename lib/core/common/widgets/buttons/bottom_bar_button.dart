import 'package:flutter/material.dart';
import 'package:gen_cert/core/common/styles/app_text_style.dart';

enum BottomBarButtonSize { small, medium, large }

class BottomBarButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final BottomBarButtonSize size;
  final bool fullWidth;

  const BottomBarButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.size = BottomBarButtonSize.medium,
    this.fullWidth = true,
  });

  /// Factory: Primary
  factory BottomBarButton.primary(String text, VoidCallback onPressed,
      {BottomBarButtonSize size = BottomBarButtonSize.medium, bool fullWidth = true}) {
    return BottomBarButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF3DDC97),
      textColor: Colors.white,
      size: size,
      fullWidth: fullWidth,
    );
  }

  /// Factory: Secondary
  factory BottomBarButton.secondary(String text, VoidCallback onPressed,
      {BottomBarButtonSize size = BottomBarButtonSize.medium, bool fullWidth = true}) {
    return BottomBarButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: const Color(0xFFE1FFF4),
      textColor: const Color(0xFF3DDC97),
      size: size,
      fullWidth: fullWidth,
    );
  }

  double _heightBySize() {
    switch (size) {
      case BottomBarButtonSize.small:
        return 48;
      case BottomBarButtonSize.medium:
        return 56;
      case BottomBarButtonSize.large:
        return 64;
    }
  }

  double _fontSizeBySize() {
    switch (size) {
      case BottomBarButtonSize.small:
        return 14;
      case BottomBarButtonSize.medium:
        return 16;
      case BottomBarButtonSize.large:
        return 18;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      height: _heightBySize(),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE4DEFF).withOpacity(0.6),
            blurRadius: 20,
            spreadRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: AppTextStyle.bodyLargeBold.copyWith(
                fontSize: _fontSizeBySize(),
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}