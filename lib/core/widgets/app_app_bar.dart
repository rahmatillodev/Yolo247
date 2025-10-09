import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yolo247/core/assets/assets.gen.dart';
import 'package:yolo247/core/routes/app_routes.dart';

import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final bool showBackButton;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;

  const AppAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onBackPressed,
    this.showBackButton = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
  });

  /// 🔹 Menyuni ko‘rsatish
  void _showMenu(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    // 🔹 Menyu elementlari ro‘yxati
    final menuItems = [
      {"icon": Assets.icons.homeIcon, "label": "Home", "route": Routes.home},
      {
        "icon": Assets.icons.newMatchIcon,
        "label": "New Match",
        "route": Routes.newMatch,
      },
      {
        "icon": Assets.icons.matchHistory,
        "label": "Match History",
        "route": Routes.matchHistory,
      },
      {
        "icon": Assets.icons.team,
        "label": "Teams",
        "route": Routes.teamManagement,
      },
      {
        "icon": Assets.icons.playerStatus,
        "label": "Player Stats",
        "route": Routes.playerStats,
      },
      {
        "icon": Assets.icons.matchStatus,
        "label": "Match Summary",
        "route": Routes.matchSummary,
      },
    ];

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 60.h,
              right: 16.w,
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.dialogGradient,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Material(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    width: 220.w,
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: menuItems.map((item) {
                        final route = item["route"];
                        final isSelected = currentRoute == route;
                        return _buildMenuItem(
                          context,
                          icon: item["icon"] as String,
                          label: item["label"] as String,
                          route: route,
                          isSelected: isSelected,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 🔹 Menyu item builder
  Widget _buildMenuItem(
    BuildContext context, {
    required String icon,
    required String label,
    String? route,
    bool isSelected = false,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () {
        Navigator.pop(context);
        if (route != null && ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withValues(alpha: 0.5)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 26.w, height: 26.h),
            12.horizontalSpace,
            Text(
              label,
              style: AppFonts.bodyText1.copyWith(
                color: AppColors.textWhite,
                fontWeight: isSelected ? AppFonts.semiBold : AppFonts.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 AppBar UI
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation ?? 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: backgroundColor ?? Colors.transparent,
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: AppColors.appbarGradient),
      ),
      titleSpacing: 0,
      leadingWidth: double.infinity,
      leading: showBackButton
          ? Row(
              children: [
                SizedBox(width: 8.w),
                InkWell(
                  onTap: onBackPressed ?? () => Navigator.pop(context),
                  child: Assets.icons.arrowBack.image(
                    width: 26.w,
                    height: 26.h,
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  title,
                  style: AppFonts.bold18Inter.copyWith(
                    color: AppColors.textWhite,
                  ),
                ),
              ],
            )
          : null,
      actions: [
        GestureDetector(
          onTap: () => _showMenu(context),
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Assets.icons.menuIcon.image(width: 28.w, height: 28.h),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
