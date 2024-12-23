import 'package:flutter/material.dart';
import 'package:learnquran/screens/settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Heading(),
          const SizedBox(height: 16),
          // Learning Progress Card
          _buildLearningProgressCard(context),
          const SizedBox(height: 16),
          _buildWeeklyStreak(context),
        ],
      ),
    );
  }

  // Move all the existing widget building methods here
  Widget _buildLearningProgressCard(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.black.withAlpha(26),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          // Green Header
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFE8F5E9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.flag,
                  color: Colors.green,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  'Learning progress',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          // White Body
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Continue from where you left off.",
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(
                                value: 6 / 15,
                                backgroundColor: Colors.grey.shade200,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.green.shade700),
                                strokeWidth: 4,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '6/15',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('Stage 1 : List 2'),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Negations & Exceptions',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: Colors.green),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayBox(String day, bool isCurrentDay,
      {bool hasLearned = false}) {
    final now = DateTime.now();
    final weekday = 5; // Hardcoded for testing, normally would be now.weekday
    final dayNumber = _getDayNumber(day);

    Color backgroundColor;
    Color textColor;

    if (isCurrentDay) {
      backgroundColor = const Color(0xFF1B5E20); // Dark green
      textColor = Colors.white;
    } else if (dayNumber < weekday) {
      backgroundColor = const Color(0xFFE8F5E9); // Light green background
      textColor = Colors.black87;
    } else {
      backgroundColor = const Color(0xFFF5F5F5); // Grey background
      textColor = Colors.grey.shade600;
    }

    return Container(
      width: 40,
      height: 70,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        children: [
          // Day text at the top
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              day,
              style: TextStyle(
                color: textColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(),
          // Checkmark circle at the bottom
          if (hasLearned)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            )
          else
            const SizedBox(height: 28), // To maintain consistent height
        ],
      ),
    );
  }

  // Helper method to convert day string to number
  int _getDayNumber(String day) {
    switch (day) {
      case 'Mo':
        return 1;
      case 'Tu':
        return 2;
      case 'We':
        return 3;
      case 'Th':
        return 4;
      case 'Fr':
        return 5;
      case 'Sa':
        return 6;
      case 'Su':
        return 7;
      default:
        return 0;
    }
  }

  Widget _buildWeeklyStreak(BuildContext context) {
    final weekday = 5; // Hardcoded to Friday for testing

    return Card(
      elevation: 1,
      shadowColor: Colors.black.withAlpha(26),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.grey.shade700),
                const SizedBox(width: 8),
                Text(
                  'Weekly learning streak',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildDayBox('Mo', weekday == 1,
                    hasLearned: true), // Past day with learning
                _buildDayBox('Tu', weekday == 2,
                    hasLearned: true), // Past day with learning
                _buildDayBox('We', weekday == 3,
                    hasLearned: true), // Past day with learning
                _buildDayBox('Th', weekday == 4,
                    hasLearned: false), // Past day with learning
                _buildDayBox('Fr', weekday == 5), // Current day
                _buildDayBox('Sa', weekday == 6), // Future day
                _buildDayBox('Su', weekday == 7), // Future day
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              color: Colors.grey.shade200,
              height: 1,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Daily learning goal',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '10 mins',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.grey.shade600,
                  ),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Salam,',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
