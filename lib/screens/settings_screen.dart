import 'package:flutter/material.dart';
import '../services/app_settings_service.dart';
import '../theme/duo_theme.dart';
import '../widgets/duo_card.dart';

class SettingsScreen extends StatelessWidget {
  final AppSettings settings;
  final ValueChanged<AppSettings> onSettingsChanged;

  const SettingsScreen({
    Key? key,
    required this.settings,
    required this.onSettingsChanged,
  }) : super(key: key);

  void _showAbout(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Roam Route',
      applicationVersion: '1.0.0',
      applicationLegalese: 'Adventure Planner 2026',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? DuoColors.duoTextMainDark : DuoColors.duoTextMain;

    return Scaffold(
      appBar: AppBar(title: const Text('SETTINGS')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            DuoCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _buildSwitch(
                    context: context,
                    title: 'Dark Mode',
                    value: settings.darkMode,
                    onChanged: (v) => onSettingsChanged(settings.copyWith(darkMode: v)),
                  ),
                  Divider(height: 1, color: isDark ? DuoColors.duoCardBorderDark : DuoColors.duoCardBorder, thickness: 2),
                  _buildSwitch(
                    context: context,
                    title: 'Notifications',
                    value: settings.notificationsEnabled,
                    onChanged: (v) => onSettingsChanged(settings.copyWith(notificationsEnabled: v)),
                  ),
                  Divider(height: 1, color: isDark ? DuoColors.duoCardBorderDark : DuoColors.duoCardBorder, thickness: 2),
                  _buildSwitch(
                    context: context,
                    title: 'Auto Backup',
                    value: settings.autoBackupEnabled,
                    onChanged: (v) => onSettingsChanged(settings.copyWith(autoBackupEnabled: v)),
                  ),
                  Divider(height: 1, color: isDark ? DuoColors.duoCardBorderDark : DuoColors.duoCardBorder, thickness: 2),
                  _buildSwitch(
                    context: context,
                    title: 'Offline Maps Cache',
                    value: settings.offlineMapsEnabled,
                    onChanged: (v) => onSettingsChanged(settings.copyWith(offlineMapsEnabled: v)),
                  ),
                  Divider(height: 1, color: isDark ? DuoColors.duoCardBorderDark : DuoColors.duoCardBorder, thickness: 2),
                  _buildDropdown(
                    context: context,
                    title: 'Distance Unit',
                    value: settings.distanceUnit,
                    items: ['Kilometers', 'Miles'],
                    onChanged: (v) => onSettingsChanged(settings.copyWith(distanceUnit: v)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: () => _showAbout(context),
                child: const DuoCard(
                  color: DuoColors.duoBlue,
                  borderColor: DuoColors.duoBlueDark,
                  child: Center(
                    child: Text(
                      'ABOUT APP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitch({required BuildContext context, required String title, required bool value, required ValueChanged<bool> onChanged}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: isDark ? DuoColors.duoTextMainDark : DuoColors.duoTextMain)),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: DuoColors.duoGreen,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required BuildContext context,
    required String title,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: isDark ? DuoColors.duoTextMainDark : DuoColors.duoTextMain)),
          DropdownButton<String>(
            value: value,
            underline: const SizedBox.shrink(),
            dropdownColor: isDark ? const Color(0xFF1C1C1E) : Colors.white,
            items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(fontWeight: FontWeight.bold, color: isDark ? DuoColors.duoTextMainDark : DuoColors.duoTextMain)))).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
