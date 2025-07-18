import 'package:app/core/utils/constants/assets.dart';
import 'package:app/core/utils/constants/colors.dart';
import 'package:app/presentation/widgets/custom_appbar.dart';
import 'package:app/presentation/widgets/theme_button.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const route = '/about';

  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section with GIF
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'About StageBuzz',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Connecting music lovers with unforgettable live experiences',
                        style: TextStyle(
                          fontSize: 24,
                          color:
                              isDarkTheme ? Colors.grey[300] : Colors.grey[700],
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 60),

                      // Our Story Section
                      _buildSection(
                        title: 'Our Story',
                        content:
                            'Founded in 2020, StageBuzz emerged from a passion for live music and the desire to make concert discovery effortless. We believe that music has the power to bring people together, create memories, and transform lives. Our platform serves as the bridge between artists and audiences, making it easier than ever to discover, share, and attend the best live music events.',
                        isDarkTheme: isDarkTheme,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      logo6,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Mission & Vision
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.flag,
                    title: 'Our Mission',
                    content:
                        'To democratize live music discovery and make every concert experience accessible, memorable, and meaningful for music lovers worldwide.',
                    isDarkTheme: isDarkTheme,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildInfoCard(
                    icon: Icons.visibility,
                    title: 'Our Vision',
                    content:
                        'A world where every music lover can easily discover, connect with, and attend live performances that inspire and unite communities.',
                    isDarkTheme: isDarkTheme,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // What We Do Section
            _buildSection(
              title: 'What We Do',
              content:
                  'StageBuzz is your comprehensive platform for live music discovery. We curate the best concerts, festivals, and intimate performances across all genres. From underground indie shows to major stadium tours, we help you find the perfect musical experience that matches your taste and location.',
              isDarkTheme: isDarkTheme,
            ),

            const SizedBox(height: 40),

            // Statistics
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: accentColor.withValues(alpha: 0.1)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatistic('10K+', 'Events Listed', isDarkTheme),
                  _buildStatistic('50K+', 'Happy Users', isDarkTheme),
                  _buildStatistic('500+', 'Cities Covered', isDarkTheme),
                  _buildStatistic('100+', 'Artists Partners', isDarkTheme),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Values Section
            _buildSection(
              title: 'Our Values',
              content:
                  'We are driven by passion, authenticity, and community. Every decision we make is guided by our commitment to supporting artists, enhancing fan experiences, and fostering genuine connections through the universal language of music.',
              isDarkTheme: isDarkTheme,
            ),

            const SizedBox(height: 40),

            // Team Section
            const Text(
              'Meet the Team',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Our diverse team of music enthusiasts, tech innovators, and industry experts work tirelessly to bring you the best live music experiences.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkTheme ? Colors.grey[300] : Colors.grey[600],
                fontFamily: 'Raleway',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const ThemeButton(),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required bool isDarkTheme,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(height: 15),
        Text(
          content,
          style: TextStyle(
            fontSize: 16,
            height: 1.6,
            color: isDarkTheme ? Colors.grey[300] : Colors.grey[600],
            fontFamily: 'Raleway',
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required bool isDarkTheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isDarkTheme ? Colors.grey[850] : Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 40,
            color: accentColor,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: isDarkTheme ? Colors.grey[300] : Colors.grey[600],
              fontFamily: 'Raleway',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(String number, String label, bool isDarkTheme) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: accentColor,
            fontFamily: 'Raleway',
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isDarkTheme ? Colors.grey[300] : Colors.grey[600],
            fontFamily: 'Raleway',
          ),
        ),
      ],
    );
  }
}
