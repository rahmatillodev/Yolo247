import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/bloc/app_state.dart';
import 'package:yolo247/core/cubit/app_cubit.dart';
import 'package:yolo247/core/cubit/theme_cubit.dart';
import 'package:yolo247/core/models/team.dart';
import 'package:yolo247/core/theme/app_colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: isDark
                  ? AppColors.darkBackground
                  : AppColors.background,
              body: Stack(
                children: [
                  // Background Gradient
                  Container(
                    decoration: BoxDecoration(
                      gradient: isDark
                          ? AppColors.darkGradient
                          : AppColors.mainGradient,
                    ),
                  ),

                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // AppBar Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: isDark
                                      ? AppColors.darkTextPrimary
                                      : Colors.white,
                                ),
                              ),
                              Text(
                                'New Match',
                                style: TextStyle(
                                  color: isDark
                                      ? AppColors.darkTextPrimary
                                      : Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() => _isMenuOpen = !_isMenuOpen);
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: isDark
                                      ? AppColors.darkTextPrimary
                                      : Colors.white,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30.h),

                          // Select Batting Team
                          Text(
                            'Select Batting Team:',
                            style: TextStyle(
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          _buildDropdown(
                            hint: 'Choose a team...',
                            value: _selectedBattingTeam,
                            teams: state.teams,
                            isDark: isDark,
                            onChanged: (val) =>
                                setState(() => _selectedBattingTeam = val),
                          ),

                          SizedBox(height: 24.h),

                          // Select Bowling Team
                          Text(
                            'Select Bowling Team:',
                            style: TextStyle(
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          _buildDropdown(
                            hint: 'Choose a team...',
                            value: _selectedBowlingTeam,
                            teams: state.teams,
                            isDark: isDark,
                            onChanged: (val) =>
                                setState(() => _selectedBowlingTeam = val),
                          ),

                          SizedBox(height: 24.h),

                          // Number of Overs
                          Text(
                            'Number of Overs:',
                            style: TextStyle(
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          _buildTextField(isDark),
                          const Spacer(),

                          // Start Match Button
                          _buildStartButton(isDark),
                        ],
                      ),
                    ),
                  ),

                  // Menu Overlay
                  if (_isMenuOpen) _buildMenu(isDark),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDropdown({
    required String hint,
    required String? value,
    required List<Team> teams,
    required bool isDark,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceLight.withOpacity(0.8)
            : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: DropdownButtonFormField<String>(
        value: value,
        iconEnabledColor: isDark ? AppColors.darkTextPrimary : Colors.white70,
        dropdownColor: isDark ? AppColors.darkSurface : const Color(0xFF1F1C3A),
        decoration: const InputDecoration(border: InputBorder.none),
        hint: Text(
          hint,
          style: TextStyle(
            color: isDark ? AppColors.darkTextSecondary : Colors.white70,
          ),
        ),
        style: TextStyle(
          color: isDark ? AppColors.darkTextPrimary : Colors.white,
        ),
        items: teams.isNotEmpty
            ? teams.map((team) {
                return DropdownMenuItem<String>(
                  value: team.id,
                  child: Text(team.name),
                );
              }).toList()
            : [],
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildTextField(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkSurfaceLight.withOpacity(0.8)
            : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: TextField(
        controller: _oversController,
        style: TextStyle(
          color: isDark ? AppColors.darkTextPrimary : Colors.white,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'e.g. 20',
          hintStyle: TextStyle(
            color: isDark ? AppColors.darkTextSecondary : Colors.white70,
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(bool isDark) {
    return GestureDetector(
      onTap: () {
        if (_selectedBattingTeam != null &&
            _selectedBowlingTeam != null &&
            _selectedBattingTeam != _selectedBowlingTeam) {
          final overs = int.tryParse(_oversController.text) ?? 20;
          context.read<AppCubit>().startNewMatch(
            _selectedBattingTeam!,
            _selectedBowlingTeam!,
            overs,
          );

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Match Started!')));

          Navigator.pushNamed(context, '/match-scoring');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please select different teams!')),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.mainGradient,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: const Text(
          'Start Match',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildMenu(bool isDark) {
    return Positioned(
      top: 80.h,
      right: 20.w,
      child: Container(
        width: 200.w,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.darkSurface.withOpacity(0.95)
              : const Color(0xFF1F1C3A).withOpacity(0.95),
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _menuItem(Icons.home, 'Home', isDark),
            _menuItem(Icons.sports_cricket, 'New Match', isDark),
            _menuItem(Icons.history, 'Match History', isDark),
            _menuItem(Icons.groups, 'Teams', isDark),
            _menuItem(Icons.bar_chart, 'Player Stats', isDark),
            _menuItem(Icons.summarize, 'Match Summary', isDark),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String title, bool isDark) {
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
            Icon(
              icon,
              color: isDark ? AppColors.darkTextPrimary : Colors.white,
              size: 20.w,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: TextStyle(
                color: isDark ? AppColors.darkTextPrimary : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
