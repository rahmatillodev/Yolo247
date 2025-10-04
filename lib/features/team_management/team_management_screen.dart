import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/constants/app_constants.dart';
import 'package:yolo247/core/widgets/app_buttons.dart';
import 'package:yolo247/features/create_edit_team/create_edit_team_screen.dart';
import 'package:yolo247/features/team_management/team_card_widget.dart';

import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_app_bar.dart';

const List<Map<String, dynamic>> teams = [
  {"name": "Mumbai Indians", "playerCount": 10},
  {"name": "Chennai Super Kings", "playerCount": 10},
  {"name": "Royal Challengers Bangalore", "playerCount": 10},
];

class TeamManagementScreen extends StatelessWidget {
  const TeamManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppAppBar(title: "Team Management"),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.screenGradient),
        child: Column(
          children: [
            24.verticalSpace,
            Expanded(
              child: ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: AppConstants.horizontalPadding,
                    child: TeamCardWidget(team: teams[index]),
                  );
                },
              ),
            ),
            Padding(
              padding: AppConstants.paddingForButton,
              child: AppOutlinedButton(
                text: "Create Team",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateEditTeamScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
