import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gen_cert/core/common/styles/app_text_style.dart';
import 'package:gen_cert/generated/assets.gen.dart';
import 'package:gen_cert/generated/locale_keys.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();

}
class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Lặp vô hạn
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.images.imgSplashLogo.image(height: 446, width: 200),
            const Gap(20),
            Text(LocaleKeys.app_name.tr(),style: AppTextStyle.h1Bold,),
            const Gap(110),
            RotationTransition(
              turns: _controller,
              child: Assets.icons.icLoadingSplash.image(height: 60,width: 60),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _controller.dispose(); // Giải phóng tài nguyên
    super.dispose();
  }
}