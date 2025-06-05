import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  const CustomAppBar._({
    this.leading,
    this.title,
    this.actions,
    this.bottom,
  });

  /// Factory: AppBar with title and optional actions
  factory CustomAppBar.standard({
    required String titleText,
    VoidCallback? onBack,
    VoidCallback? onNotificationTap,
  }) {
    return CustomAppBar._(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBack,
      ),
      title: Text(
        titleText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: onNotificationTap,
        )
      ],
    );
  }

  /// Factory: AppBar with progress bar
  factory CustomAppBar.withProgress({
    required String titleText,
    required double progress, // từ 0.0 đến 1.0
    VoidCallback? onBack,
    VoidCallback? onNotificationTap,
  }) {
    return CustomAppBar._(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBack,
      ),
      title: Text(
        titleText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: onNotificationTap,
        )
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.white24,
          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF42E6A4)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: leading,
      title: title,
      actions: actions,
      centerTitle: false,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 56 : 56 + 4);
}
