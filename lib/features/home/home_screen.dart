import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E27),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              _buildHeader(context),

              SizedBox(height: 20.h),

              // Hero Section
              _buildHeroSection(context),

              SizedBox(height: 30.h),

              // Menu Grid
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildMenuCard(
                            context: context,
                            title: 'New Match',
                            icon: '🏏',
                            onTap: () => Navigator.pushNamed(context, '/new-match'),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: _buildMenuCard(
                            context: context,
                            title: 'Match History',
                            icon: '📋',
                            onTap: () => Navigator.pushNamed(context, '/match-history'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildMenuCard(
                            context: context,
                            title: 'Teams',
                            icon: '👥',
                            onTap: () => Navigator.pushNamed(context, '/team-management'),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: _buildMenuCard(
                            context: context,
                            title: 'Player Stats',
                            icon: '📊',
                            onTap: () => Navigator.pushNamed(context, '/player-stats'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    _buildMatchSummaryCard(context),
                  ],
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // App Title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cricket ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Score',
                      style: TextStyle(
                        color: const Color(0xFFFFA726),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Counter',
                style: TextStyle(
                  color: const Color(0xFFE53935),
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),

          // Settings Icon
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: const Color(0xFF5B7FDB),
                width: 2.5,
              ),
            ),
            child: IconButton(
              onPressed: () {
                // TODO: Navigate to settings
              },
              icon: Icon(
                Icons.settings_outlined,
                size: 28.w,
                color: const Color(0xFF5B7FDB),
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 280.h,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF1E3A8A),
            Color(0xFF3B82F6),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned(
            right: -20,
            top: 20,
            bottom: 20,
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/cricket_pattern.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Score Every Run.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Track Every Ball.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/new-match'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B7FDB),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Start New Match',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Cricket Player Image (placeholder)
          Positioned(
            right: -30.w,
            bottom: -20.h,
            child: Opacity(
              opacity: 0.3,
              child: Icon(
                Icons.sports_cricket,
                size: 200.w,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140.h,
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFF2A3050),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: TextStyle(fontSize: 48.sp),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchSummaryCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to match summary
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1F3A),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: const Color(0xFF2A3050),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Text(
              '📋',
              style: TextStyle(fontSize: 40.sp),
            ),
            SizedBox(width: 16.w),
            Text(
              'Match Summary',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}