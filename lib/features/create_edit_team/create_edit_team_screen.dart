import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_fonts.dart';
import '../../core/widgets/app_app_bar.dart';

class CreateEditTeamScreen extends StatefulWidget {
  final String? teamId;

  const CreateEditTeamScreen({super.key, this.teamId});

  @override
  State<CreateEditTeamScreen> createState() => _CreateEditTeamScreenState();
}

class _CreateEditTeamScreenState extends State<CreateEditTeamScreen> {
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _playerNameController = TextEditingController();
  final List<String> _players = [];

  @override
  void initState() {
    super.initState();
    if (widget.teamId != null) {
      // TODO: Load team data for editing
    }
  }

  @override
  void dispose() {
    _teamNameController.dispose();
    _playerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppAppBar(
        title: widget.teamId == null ? 'Create Team' : 'Edit Team',
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.darkGradient),
        child: SafeArea(
          child: Padding(
            padding: AppConstants.defaultPadding,
            child: Column(
              children: [
                _buildTeamNameField(),
                SizedBox(height: AppConstants.largeSpacing),
                Expanded(child: _buildPlayersList()),
                SizedBox(height: AppConstants.largeSpacing),
                _buildAddPlayerButton(),
                SizedBox(height: AppConstants.largeSpacing),
                _buildSaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamNameField() {
    return Container(
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface.withOpacity(0.9),
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Team Name",
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.smallSpacing),
          TextFormField(
            controller: _teamNameController,
            style: TextStyle(color: AppColors.darkTextPrimary),
            decoration: InputDecoration(
              hintText: 'Enter team name',
              hintStyle: TextStyle(color: AppColors.darkTextSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayersList() {
    return Container(
      width: double.infinity,
      padding: AppConstants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkSurface.withOpacity(0.9),
        borderRadius: AppConstants.largeBorderRadius,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Players',
            style: AppFonts.subtitle1.copyWith(
              color: AppColors.darkTextPrimary,
              fontWeight: AppFonts.semiBold,
            ),
          ),
          SizedBox(height: AppConstants.mediumSpacing),
          Expanded(
            child: _players.isEmpty
                ? Center(
                    child: Text(
                      'No players added yet',
                      style: AppFonts.bodyText2.copyWith(
                        color: AppColors.darkTextSecondary,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _players.length,
                    itemBuilder: (context, index) {
                      final player = _players[index];
                      return _buildPlayerItem(player, index);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerItem(String playerName, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: AppConstants.smallSpacing),
      padding: AppConstants.smallPadding,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: AppConstants.smallBorderRadius,
      ),
      child: Row(
        children: [
          Text(
            '${index + 1}.',
            style: AppFonts.bodyText2.copyWith(
              color: AppColors.darkTextPrimary,
            ),
          ),
          SizedBox(width: AppConstants.smallSpacing),
          Expanded(
            child: Text(
              playerName,
              style: AppFonts.bodyText2.copyWith(color: AppColors.textPrimary),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _players.removeAt(index);
              });
            },
            icon: Icon(Icons.delete, color: AppColors.error, size: 20.w),
          ),
        ],
      ),
    );
  }

  Widget _buildAddPlayerButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: _showAddPlayerDialog,
        icon: const Icon(Icons.add),
        label: Text("Add Player"),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.largeBorderRadius,
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: _saveTeam,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textWhite,
          shape: RoundedRectangleBorder(
            borderRadius: AppConstants.largeBorderRadius,
          ),
        ),
        child: Text(
          "Save",
          style: AppFonts.button.copyWith(
            fontSize: AppFonts.fontSize18,
            fontWeight: AppFonts.semiBold,
          ),
        ),
      ),
    );
  }

  void _showAddPlayerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Player'),
        content: TextField(
          controller: _playerNameController,
          decoration: InputDecoration(hintText: 'Enter player name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_playerNameController.text.isNotEmpty) {
                setState(() {
                  _players.add(_playerNameController.text);
                  _playerNameController.clear();
                });
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _saveTeam() {
    if (_teamNameController.text.isNotEmpty && _players.isNotEmpty) {
      // TODO: Save team
      Navigator.pop(context);
    }
  }
}
