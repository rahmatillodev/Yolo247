import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/constants/app_constants.dart';
import 'package:yolo247/core/routes/app_routes.dart';
import 'package:yolo247/core/theme/app_colors.dart';
import 'package:yolo247/core/theme/app_fonts.dart';
import 'package:yolo247/core/widgets/app_buttons.dart';

class TeamCardWidget extends StatelessWidget {
  final Map<String, dynamic> team;
  const TeamCardWidget({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.smallSpacing),
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: AppConstants.smallBorderRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(team['name'], style: AppFonts.semibold14Inter),
              4.verticalSpace,
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.group,
                    size: AppConstants.smallIconSize,
                    color: AppColors.secondaryText,
                  ),
                  Text(
                    "Player Count: ",
                    style: AppFonts.regular12Inter.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                  Text(
                    team['playerCount'].toString(),
                    style: AppFonts.regular12Inter.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppIconTextButton(
            text: "Edit",
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.createEditTeam,
                arguments: {'teamId': team['id']},
              );
            },
            icon: Icons.edit,
            color: AppColors.transparent,
          ),
        ],
      ),
    );
  }
}
