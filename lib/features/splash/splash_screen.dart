import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToWelcome();
  }

  void _navigateToWelcome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Loading text
            Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            
            SizedBox(height: 60.h),
            
            // Circular progress indicator
            SizedBox(
              width: 80.w,
              height: 80.w,
              child: CircularProgressIndicator(
                strokeWidth: 8.w,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xFF5B6FA8), // Blue-purple color from the image
                ),
                backgroundColor: const Color(0xFF2A3654), // Darker blue-purple
              ),
            ),
          ],
        ),
      ),
    );
  }
}