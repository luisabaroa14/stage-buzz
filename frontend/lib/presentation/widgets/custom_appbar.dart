import 'package:app/core/navigation/app_router.dart';
import 'package:app/core/utils/constants/assets.dart';
import 'package:app/core/utils/constants/colors.dart';
import 'package:app/presentation/features/about/pages/about.dart';
import 'package:app/presentation/features/contact/pages/contact.dart';
import 'package:app/presentation/features/events/pages/events.dart';
import 'package:app/presentation/features/home/pages/home.dart';
import 'package:app/presentation/widgets/buttons/hover_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                  isDarkTheme ? logo6 : logo1,
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
                      // HoverButton(
                      //   label: 'News',
                      //   borderColor: isDarkTheme ? whiteColor : blackColor,
                      //   hoverBorderColor: accentColor,
                      //   onPressed: () => context.goNamed(NewsScreen.route),
                      // ),
                      HoverButton(
                        label: 'Events',
                        borderColor: isDarkTheme ? whiteColor : blackColor,
                        hoverBorderColor: accentColor,
                        onPressed: () => context.goNamed(EventsScreen.route),
                      ),
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
