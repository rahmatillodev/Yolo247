import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/bloc/app_bloc.dart';
import '../../core/bloc/app_bloc_impl.dart';
import '../../core/bloc/app_state.dart';
import '../../core/constants/app_constants.dart';
import '../../core/models/team.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';

class NewMatchScreen extends StatefulWidget {
  const NewMatchScreen({super.key});

  @override
  State<NewMatchScreen> createState() => _NewMatchScreenState();
}

class _NewMatchScreenState extends State<NewMatchScreen> {
  String? _selectedBattingTeamId;
  String? _selectedBowlingTeamId;
  int _totalOvers = 20;
  final TextEditingController _oversController = TextEditingController(
    text: '20',
  );

  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(LoadTeams());
  }

  @override
  void dispose() {
    _oversController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTexts.newMatch),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: AppColors.error,
              ),
            );
            context.read<AppBloc>().add(ClearError());
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(gradient: AppColors.fieldGradient),
            child: SafeArea(
              child: Padding(
                padding: AppConstants.defaultPadding,
                child: Column(
                  children: [
                    // Header
                    _buildHeader(),

                    SizedBox(height: AppConstants.largeSpacing),

                    // Form
                    Expanded(child: _buildForm(state)),

                    SizedBox(height: AppConstants.largeSpacing),

                    // Start Match Button
                    _buildStartMatchButton(state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(Icons.sports_cricket, size: 48.w, color: AppColors.primary),
          SizedBox(height: AppConstants.mediumSpacing),
          Text(
            'Setup New Match',
            style: AppFonts.headline5.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.bold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          Text(
            'Select teams and configure match parameters',
            style: AppFonts.bodyText2.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildForm(AppState state) {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Batting Team
          Text(
            AppTexts.battingTeam,
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          _buildTeamDropdown(
            value: _selectedBattingTeamId,
            teams: state.teams,
            onChanged: (value) {
              setState(() {
                _selectedBattingTeamId = value;
              });
            },
            hint: 'Select batting team',
          ),

          SizedBox(height: AppConstants.largeSpacing),

          // Bowling Team
          Text(
            AppTexts.bowlingTeam,
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          _buildTeamDropdown(
            value: _selectedBowlingTeamId,
            teams: state.teams,
            onChanged: (value) {
              setState(() {
                _selectedBowlingTeamId = value;
              });
            },
            hint: 'Select bowling team',
          ),

          SizedBox(height: AppConstants.largeSpacing),

          // Overs
          Text(
            AppTexts.overs,
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.textPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          TextFormField(
            controller: _oversController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter number of overs',
              suffixText: 'overs',
            ),
            onChanged: (value) {
              setState(() {
                _totalOvers = int.tryParse(value) ?? 20;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTeamDropdown({
    required String? value,
    required List<Team> teams,
    required ValueChanged<String?> onChanged,
    required String hint,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(hintText: hint),
      items: teams.map((team) {
        return DropdownMenuItem<String>(
          value: team.id,
          child: Row(
            children: [
              Icon(Icons.groups, size: 20.w, color: AppColors.primary),
              SizedBox(width: AppConstants.smallSpacing),
              Text(team.name),
            ],
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildStartMatchButton(AppState state) {
    final bool canStart =
        _selectedBattingTeamId != null &&
        _selectedBowlingTeamId != null &&
        _selectedBattingTeamId != _selectedBowlingTeamId &&
        _totalOvers > 0;

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: canStart && !state.isLoading
            ? () {
                context.read<AppBloc>().add(
                  StartNewMatch(
                    battingTeamId: _selectedBattingTeamId!,
                    bowlingTeamId: _selectedBowlingTeamId!,
                    totalOvers: _totalOvers,
                  ),
                );
                Navigator.pushNamed(
                  context,
                  '/match-scoring',
                  arguments: {'matchId': 'current'},
                );
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: canStart
              ? AppColors.primary
              : AppColors.buttonDisabled,
          foregroundColor: AppColors.textWhite,
          elevation: canStart ? 4 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.largeBorderRadius,
          ),
        ),
        child: state.isLoading
            ? SizedBox(
                width: 24.w,
                height: 24.w,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.textWhite,
                  ),
                ),
              )
            : Text(
                AppTexts.startMatch,
                style: AppFonts.button.copyWith(
                  fontSize: AppFonts.fontSize18,
                  fontWeight: AppFonts.semiBold,
                ),
              ),
      ),
    );
  }
}
