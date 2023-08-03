import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/navigation/app_router.dart';
import '../../core/utils/constants/assets.dart';
import '../../core/utils/constants/colors.dart';
import '../features/about/pages/about.dart';
import '../features/contact/pages/contact.dart';
import '../features/events/pages/events.dart';
import '../features/home/pages/home.dart';
import '../features/news/pages/news.dart';
import 'buttons/hover_button.dart';

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
              GestureDetector(
                onTap: () => context.goNamed(HomeScreen.route),
                child: Image.asset(
                  logo1,
                  width: 150,
                  height: 150,
                ),
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
                        onPressed: () => context.goNamed(AboutScreen.route),
                      ),
                      // SizedBox(width: constraints.maxWidth / 20),
                      HoverButton(
                        label: 'Events',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () => context.goNamed(EventsScreen.route),
                      ),
                      // SizedBox(width: constraints.maxWidth / 20),
                      HoverButton(
                        label: 'News',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () => context.goNamed(NewsScreen.route),
                      ),
                      // SizedBox(width: constraints.maxWidth / 20),

                      HoverButton(
                        label: 'Contact',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () {
                          AppRouter.router.goNamed(ContactScreen.route);
                        },
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
