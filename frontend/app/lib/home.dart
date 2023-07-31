import 'package:app/concert_rows.dart';
import 'package:app/core/utils/constants/assets.dart';
import 'package:app/presentation/widgets/buttons/hover_button.dart';
import 'package:flutter/material.dart';

import 'core/utils/constants/colors.dart';
import 'core/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Theme(
      data: _isDarkMode ? darkTheme : lightTheme,
      child: Scaffold(
        appBar: const CustomAppBar(),
        // body: AppBarView(),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Flexible(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "WE INVEST IN TOUGH TECH",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 70,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 25),
                            Text(
                              "The most urgent problems hold the biggest opportunities. The Engine invests in remarkable founders to create positive global change.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          logo6,
                          // gif,
                          fit: BoxFit.cover,
                          // width: screenSize.width / 4,
                          // height: screenSize.height / 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                ConcertRows(dataList: concerts),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _toggleTheme(),
          backgroundColor: accentColor,
          child: Icon(
            _isDarkMode ? Icons.light_mode : Icons.dark_mode,
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(1000);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                logo1,
                width: 150,
                height: 150,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isDarkTheme ? greyColor : blackColor,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HoverButton(
                        label: 'About',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () {},
                      ),
                      // SizedBox(width: constraints.maxWidth / 20),
                      HoverButton(
                        label: 'News',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () {},
                      ),
                      // SizedBox(width: constraints.maxWidth / 20),
                      HoverButton(
                        label: 'Team',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () {},
                      ),
                      // SizedBox(width: constraints.maxWidth / 20),
                      HoverButton(
                        label: 'Contact',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<String> concerts = [
  'Coachella',
  'Glastonbury Festival',
  'Lollapalooza',
  'Bonnaroo Music & Arts Festival',
  'Tomorrowland',
  'Ultra Music Festival',
  'SXSW (South by Southwest) Music Festival',
  'Electric Daisy Carnival (EDC)',
  'Rock in Rio',
  'Reading and Leeds Festivals'
];
