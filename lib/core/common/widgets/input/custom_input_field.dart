import 'package:flutter/material.dart';
import 'package:gen_cert/core/common/styles/app_text_style.dart';

class CustomInputField extends StatefulWidget {
  final String title;
  final String hintText;
  final String? initialValue;
  final bool enabled;
  final bool isDarkTheme;
  final bool isLoading;
  final Widget? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;

  const CustomInputField._internal({
    required this.title,
    required this.hintText,
    this.initialValue,
    this.controller,
    this.icon,
    this.validator,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.enabled = true,
    this.isDarkTheme = false,
    this.isLoading = false,
    this.obscureText = false,
    this.maxLines = 1,
    super.key,
  });

  factory CustomInputField({
    required String title,
    required String hintText,
    String? initialValue,
    TextEditingController? controller,
    Widget? icon,
    String? Function(String?)? validator,
    VoidCallback? onTap,
    Function(String)? onChanged,
    TextInputType? keyboardType,
    bool enabled = true,
    bool isDarkTheme = false,
    bool isLoading = false,
    bool obscureText = false,
    int maxLines = 1,
    Key? key,
  }) {
    return CustomInputField._internal(
      title: title,
      hintText: hintText,
      initialValue: initialValue,
      controller: controller,
      icon: icon,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      enabled: enabled,
      isDarkTheme: isDarkTheme,
      isLoading: isLoading,
      obscureText: obscureText,
      maxLines: maxLines,
      key: key,
    );
  }

  factory CustomInputField.dark({
    required String title,
    required String hintText,
    String? initialValue,
    TextEditingController? controller,
    Widget? icon,
    String? Function(String?)? validator,
    VoidCallback? onTap,
    Function(String)? onChanged,
    TextInputType? keyboardType,
    bool enabled = true,
    bool isLoading = false,
    bool obscureText = false,
    int maxLines = 1,
    Key? key,
  }) {
    return CustomInputField._internal(
      title: title,
      hintText: hintText,
      initialValue: initialValue,
      controller: controller,
      icon: icon,
      validator: validator,
      onTap: onTap,
      onChanged: onChanged,
      keyboardType: keyboardType,
      enabled: enabled,
      isDarkTheme: true,
      isLoading: isLoading,
      obscureText: obscureText,
      maxLines: maxLines,
      key: key,
    );
  }

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late final TextEditingController _controller;
  late final bool _isExternalController;

  @override
  void initState() {
    super.initState();
    _isExternalController = widget.controller != null;
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    if (!_isExternalController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.isDarkTheme ? Colors.white : Colors.black;
    final Color hintColor = widget.isDarkTheme ? Colors.white60 : Colors.black54;
    const Color lineColor = Color(0xFF42E6A4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyle.bodyLargeBold
        ),
        TextFormField(
          controller: _controller,
          validator: widget.validator,
          readOnly: widget.onTap != null,
          onTap: widget.enabled ? widget.onTap : null,
          onChanged: widget.enabled ? widget.onChanged : null,
          enabled: widget.enabled,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          maxLines: widget.maxLines,
          style: TextStyle(
            color: widget.enabled ? textColor : hintColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            suffixIcon: widget.isLoading
                ? Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(hintColor),
                ),
              ),
            )
                : widget.icon != null
                ? IconTheme(
              data: IconThemeData(color: hintColor),
              child: widget.icon!,
            )
                : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: lineColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: lineColor, width: 2),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lineColor.withOpacity(0.3)),
            ),
          ),
        ),
      ],
    );
  }
}