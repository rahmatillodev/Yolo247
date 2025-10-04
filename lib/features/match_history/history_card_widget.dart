import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yolo247/core/constants/app_constants.dart';
import 'package:yolo247/core/routes/app_routes.dart';
import 'package:yolo247/core/theme/app_colors.dart';
import 'package:yolo247/core/theme/app_fonts.dart';

class HistoryCardWidget extends StatelessWidget {
  final Map<String, dynamic> match;
  const HistoryCardWidget({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.matchDetails,
          arguments: {'match': match},
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppConstants.smallSpacing),
        padding: AppConstants.defaultPadding,
        decoration: BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: AppConstants.largeBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 4.w,
                  children: [
                    Text(
                      match["teamA"],
                      style: AppFonts.semibold20Inter.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      'vs',
                      style: AppFonts.semibold20Inter.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      match["teamB"],
                      style: AppFonts.semibold20Inter.copyWith(
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${match["date"]} | \n ${match["time"]}',
                  textAlign: TextAlign.end,
                  style: AppFonts.regular12Inter,
                ),
              ],
            ),
            10.verticalSpace,

            Row(
              children: [
                Text(
                  "Result: ",
                  style: AppFonts.regular16Inter.copyWith(
                    color: AppColors.textSuccess,
                  ),
                ),
                Text(match["result"], style: AppFonts.regular16Inter),
              ],
            ),
            6.verticalSpace,
            Text(
              'Score: ${match["teamA"]} ${match["scoreA"]} - ${match["teamB"]} ${match["scoreB"]}',
              style: AppFonts.light12Inter,
            ),
          ],
        ),
      ),
    );
  }
}
