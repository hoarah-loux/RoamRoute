import 'package:flutter/material.dart';
import '../theme/duo_theme.dart';
import '../widgets/duo_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? DuoColors.duoTextMainDark : DuoColors.duoTextMain;
    final subTextColor = isDark ? DuoColors.duoGrayDark : DuoColors.duoGray;

    return Scaffold(
      appBar: AppBar(title: const Text('PROFILE')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            DuoCard(
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: DuoColors.duoBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Traveler',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: textColor,
                          ),
                        ),
                        Text(
                          'Level 1 Explorer',
                          style: TextStyle(
                            color: subTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: DuoCard(
                    child: Column(
                      children: [
                        const Icon(Icons.local_fire_department, color: DuoColors.duoOrange, size: 32),
                        const SizedBox(height: 8),
                        Text('3', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: textColor)),
                        Text('DAY STREAK', style: TextStyle(color: subTextColor, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DuoCard(
                    child: Column(
                      children: [
                        const Icon(Icons.stars, color: DuoColors.duoBlue, size: 32),
                        const SizedBox(height: 8),
                        Text('120', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: textColor)),
                        Text('TOTAL XP', style: TextStyle(color: subTextColor, fontSize: 12, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ACHIEVEMENTS',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildAchievement(
              context: context,
              icon: Icons.map,
              color: DuoColors.duoGreen,
              title: 'First Voyage',
              description: 'Complete your first trip.',
              progress: 0.5,
            ),
            const SizedBox(height: 16),
            _buildAchievement(
              context: context,
              icon: Icons.camera_alt,
              color: DuoColors.duoBlue,
              title: 'Memory Maker',
              description: 'Capture 5 moments.',
              progress: 0.8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievement({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required double progress,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? DuoColors.duoTextMainDark : DuoColors.duoTextMain;
    final subTextColor = isDark ? DuoColors.duoGrayDark : DuoColors.duoGray;

    return DuoCard(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: textColor)),
                Text(description, style: TextStyle(color: subTextColor, fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: isDark ? DuoColors.duoCardBorderDark : DuoColors.duoCardBorder,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 8,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
