import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/widgets/app_buttons.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_text_field.dart';

class NewMatchScreen extends StatefulWidget {
  const NewMatchScreen({super.key});

  @override
  State<NewMatchScreen> createState() => _NewMatchScreenState();
}

class _NewMatchScreenState extends State<NewMatchScreen> {
  String? _selectedBattingTeam;
  String? _selectedBowlingTeam;
  final TextEditingController _oversController = TextEditingController(
    text: '20',
  );
  bool _isMenuOpen = false;

  final List<String> _teams = ['Team A', 'Team B', 'Team C', 'Team D'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(gradient: AppColors.mainGradient),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.textWhite,
                        ),
                      ),
                      Text(
                        'New Match',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            setState(() => _isMenuOpen = !_isMenuOpen),
                        icon: const Icon(
                          Icons.menu,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h),

                  _buildLabel('Select Batting Team:'),
                  SizedBox(height: 8.h),
                  _buildDropdown(
                    hint: 'Choose a team...',
                    value: _selectedBattingTeam,
                    onChanged: (v) => setState(() => _selectedBattingTeam = v),
                  ),

                  SizedBox(height: 24.h),

                  _buildLabel('Select Bowling Team:'),
                  SizedBox(height: 8.h),
                  _buildDropdown(
                    hint: 'Choose a team...',
                    value: _selectedBowlingTeam,
                    onChanged: (v) => setState(() => _selectedBowlingTeam = v),
                  ),

                  SizedBox(height: 24.h),

                  _buildLabel('Number of Overs:'),
                  SizedBox(height: 8.h),
                  AppTextField(
                    controller: _oversController,
                    hintText: 'e.g. 20',
                    keyboardType: TextInputType.number,
                  ),

                  const Spacer(),
                  AppButton(text: 'Start Match', onPressed: () {}),
                ],
              ),
            ),
          ),

          if (_isMenuOpen) _buildMenu(),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) => Text(
    text,
    style: const TextStyle(
      color: AppColors.textWhite,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonFormField<String>(
        value: value,
        dropdownColor: AppColors.surface,
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(
          hint,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        style: const TextStyle(color: AppColors.textWhite),
        iconEnabledColor: AppColors.textSecondary,
        items: _teams
            .map((t) => DropdownMenuItem(value: t, child: Text(t)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildMenu() {
    return Positioned(
      top: 80.h,
      right: 20.w,
      child: Container(
        width: 200.w,
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuItem(Icons.home, 'Home'),
            _menuItem(Icons.sports_cricket, 'New Match'),
            _menuItem(Icons.history, 'Match History'),
            _menuItem(Icons.groups, 'Teams'),
            _menuItem(Icons.bar_chart, 'Player Stats'),
            _menuItem(Icons.summarize, 'Match Summary'),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        setState(() => _isMenuOpen = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('$title clicked')));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textWhite, size: 20.w),
            SizedBox(width: 10.w),
            Text(title, style: const TextStyle(color: AppColors.textWhite)),
          ],
        ),
      ),
    );
  }
}
