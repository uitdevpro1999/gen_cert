import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gen_cert/core/common/styles/app_colors.dart';
import 'package:gen_cert/core/common/styles/app_text_style.dart';
import 'package:gen_cert/core/common/widgets/buttons/bottom_bar_button.dart';
import 'package:gen_cert/generated/assets.gen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 24, right: 16,top: 8),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Assets.icons.icUnion.provider(),fit: BoxFit.fill)
                    ),
                    child: Text(
                      "Hi there! I’m El!",
                      style: AppTextStyle.h5Bold
                    ),
                  ),
                ],
              ),
            ),
            const Gap(12),
            Assets.images.imgSplashLogo.image(width: 142, height: 247),
            const Gap(24),
            Text(
              "GenCert",
              style: AppTextStyle.h1Bold.copyWith(color: AppColors.primary500),
            ),
            const Gap(12),
            Text(
              "Your content. Your pace. Your path",
              textAlign: TextAlign.center,
              style: AppTextStyle.h5Bold.copyWith(color: AppColors.greyscale700),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  BottomBarButton.primary(
                    "GET STARTED",
                    () {
                      // TODO: Handle navigation
                    },
                    size: BottomBarButtonSize.large,
                  ),
                  const Gap(16),
                  BottomBarButton.secondary(
                    "I ALREADY HAVE AN ACCOUNT",
                    () {
                      // TODO: Handle login nav
                    },
                    size: BottomBarButtonSize.large,
                  ),
                  const Gap(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
