import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/widgets/app_buttons.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Assets.images.welcomeBackground.path, fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: AppConstants.defaultPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 2),
                  Text(
                        'Welcome',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Kaushan Script',
                          fontSize: 32,
                          color: AppColors.textWhite,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: AppConstants.mediumAnimation)
                      .slideY(begin: 0.3, end: 0),
                  Text(
                        'to Cricket Score Counter!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Kaushan Script',
                          fontSize: 32,
                          color: AppColors.textWhite,
                        ),
                      )
                      .animate()
                      .fadeIn(duration: AppConstants.mediumAnimation)
                      .slideY(begin: 0.3, end: 0),
                  Text(
                        'Track matches, manage teams,\nand keep your cricket scores effortlessly.',
                        textAlign: TextAlign.center,
                        style: AppFonts.size20weight500fontInter.copyWith(
                          color: AppColors.textWhite,
                        ),
                      )
                      .animate()
                      .fadeIn(
                        duration: AppConstants.mediumAnimation,
                        delay: const Duration(milliseconds: 300),
                      )
                      .slideY(begin: 0.3, end: 0),

                  Spacer(flex: 3),

                  AppButton(
                        text: 'Get Started',
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                      )
                      .animate()
                      .fadeIn(
                        duration: AppConstants.mediumAnimation,
                        delay: const Duration(milliseconds: 600),
                      )
                      .slideY(begin: 0.4, end: 0),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
