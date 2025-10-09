import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_constants.dart';
import '../../core/di/dependency_injection.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';
import 'domain/entities/player_entity.dart';
import 'presentation/bloc/player_bloc.dart';

class PlayerStatsScreen extends StatelessWidget {
  const PlayerStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DependencyInjection.playerBloc..add(const LoadPlayers()),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppAppBar(title: "Player Stats"),
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.screenGradient),
          child: SafeArea(
            child: Padding(
              padding: AppConstants.defaultPadding,
              child: BlocBuilder<PlayerBloc, PlayerState>(
                builder: (context, state) {
                  if (state is PlayerInitial) {
                    return const Center(child: Text('Initializing...'));
                  } else if (state is PlayerLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PlayerLoaded) {
                    if (state.players.isEmpty) {
                      return const Center(child: Text('No players found'));
                    }
                    return ListView.builder(
                      itemCount: state.players.length,
                      itemBuilder: (context, index) {
                        final player = state.players[index];
                        return _buildPlayerCard(context, player);
                      },
                    );
                  } else if (state is PlayerInfoLoaded) {
                    return _buildPlayerDetails(context, state.player);
                  } else if (state is PlayerError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Error: ${state.message}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<PlayerBloc>().add(
                                const LoadPlayers(),
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: Text('Unknown state'));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCard(BuildContext context, PlayerEntity player) {
    return GestureDetector(
      onTap: () {
        context.read<PlayerBloc>().add(LoadPlayerInfo(player.id));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.darkSurface.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white24,
              backgroundImage: player.playerImg != null
                  ? NetworkImage(player.playerImg!)
                  : null,
              child: player.playerImg == null
                  ? const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 28,
                    )
                  : null,
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    player.name,
                    style: AppFonts.bodyText1.copyWith(
                      color: AppColors.textWhite,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    player.country,
                    style: AppFonts.bodyText2.copyWith(
                      color: AppColors.textSubc,
                    ),
                  ),
                  if (player.role != null) ...[
                    SizedBox(height: 2.h),
                    Text(
                      player.role!,
                      style: AppFonts.bodyText2.copyWith(
                        color: Color(0xff92A1FF),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: AppColors.textSubc, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerDetails(BuildContext context, PlayerEntity player) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Player Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.darkSurface.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white24,
                  backgroundImage: player.playerImg != null
                      ? NetworkImage(player.playerImg!)
                      : null,
                  child: player.playerImg == null
                      ? const Icon(
                          Icons.person_outline,
                          color: Colors.white,
                          size: 50,
                        )
                      : null,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.name,
                      style: AppFonts.headline6.copyWith(
                        color: AppColors.textWhite,
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      player.country,
                      style: AppFonts.bodyText1.copyWith(
                        color: AppColors.textSubc,
                      ),
                    ),
                    if (player.role != null) ...[
                      SizedBox(height: 4.h),
                      Text(
                        player.role!,
                        style: AppFonts.bodyText2.copyWith(
                          color: Color(0xff92A1FF),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Player Info
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.darkSurface.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Player Information',
                  style: AppFonts.bodyText1.copyWith(
                    color: AppColors.textWhite,
                    fontWeight: AppFonts.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                if (player.battingStyle != null)
                  _infoRow('Batting Style', player.battingStyle!),
                if (player.bowlingStyle != null)
                  _infoRow('Bowling Style', player.bowlingStyle!),
                if (player.placeOfBirth != null)
                  _infoRow('Place of Birth', player.placeOfBirth!),
                if (player.dateOfBirth != null)
                  _infoRow('Date of Birth', _formatDate(player.dateOfBirth!)),
              ],
            ),
          ),

          SizedBox(height: 16.h),

          // Player Stats
          if (player.stats.isNotEmpty) ...[
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.darkSurface.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: AppFonts.bodyText1.copyWith(
                      color: AppColors.textWhite,
                      fontWeight: AppFonts.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ...player.stats.map(
                    (stat) => _statRow(
                      '${stat.stat.toUpperCase()} (${stat.matchType.toUpperCase()})',
                      stat.value,
                    ),
                  ),
                ],
              ),
            ),
          ],

          SizedBox(height: 20.h),

          // Back Button
          ElevatedButton(
            onPressed: () {
              context.read<PlayerBloc>().add(const LoadPlayers());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
            ),
            child: Text(
              'Back to Players',
              style: AppFonts.bodyText1.copyWith(
                color: Colors.white,
                fontWeight: AppFonts.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppFonts.bodyText2.copyWith(color: AppColors.textWhite),
          ),
          Text(
            value,
            style: AppFonts.bodyText2.copyWith(
              color: AppColors.primary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppFonts.bodyText2.copyWith(color: AppColors.textWhite),
          ),
          Text(
            value,
            style: AppFonts.bodyText2.copyWith(
              color: AppColors.primary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
    } catch (e) {
      return dateString;
    }
  }
}
