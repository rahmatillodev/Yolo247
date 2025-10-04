import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/constants/app_constants.dart';
import 'package:yolo247/core/cubit/app_cubit.dart';
import 'package:yolo247/core/cubit/app_state.dart';
import 'package:yolo247/core/data/mock_data.dart';
import 'package:yolo247/core/routes/app_routes.dart';
import 'package:yolo247/core/widgets/app_buttons.dart';
import 'package:yolo247/features/team_management/team_card_widget.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_app_bar.dart';

class TeamManagementScreen extends StatelessWidget {
  const TeamManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppAppBar(title: MockData.teamManagement),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.screenGradient),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Column(
              children: [
                24.verticalSpace,
                Expanded(
                  child: state.teams.isEmpty
                      ? Center(
                          child: Text(
                            'No teams found. Create your first team!',
                            style: TextStyle(
                              color: AppColors.darkTextPrimary,
                              fontSize: 16.sp,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: state.teams.length,
                          itemBuilder: (context, index) {
                            final team = state.teams[index];
                            return Padding(
                              padding: AppConstants.horizontalPadding,
                              child: TeamCardWidget(
                                team: {
                                  'name': team.name,
                                  'playerCount': team.playerIds.length,
                                  'id': team.id,
                                },
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: AppConstants.paddingForButton,
                  child: AppOutlinedButton(
                    text: "Create Team",
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.createEditTeam);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
