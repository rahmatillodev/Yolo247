import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/bloc/app_state.dart';
import 'package:yolo247/core/cubit/app_cubit.dart';
import 'package:yolo247/core/cubit/theme_cubit.dart';
import 'package:yolo247/core/models/team.dart';
import 'package:yolo247/core/theme/app_colors.dart';
import 'package:yolo247/core/widgets/app_app_bar.dart';

// Mock data for teams

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppAppBar(title: 'New Match', actions: []),
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
                            onChanged: (val) => {
                              debugPrint('selected batting team: $val'),
                              setState(() => _selectedBattingTeam = val),
                            },
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
        color: isDark ? AppColors.darkSurfaceLight : Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: DropdownButtonFormField<String>(
        value: value,
        iconEnabledColor: isDark ? AppColors.darkTextPrimary : Colors.white70,
        dropdownColor: isDark ? AppColors.darkSurface : const Color(0xFF1F1C3A),
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
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
        color: isDark ? AppColors.darkSurfaceLight : AppColors.surface,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.border,
        ),
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
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
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
}
