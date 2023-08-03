import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/theme/theme_bloc.dart';
import '../../../../core/utils/constants/assets.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/lists.dart';
import '../../../widgets/appbar.dart';
import '../widgets/concert_rows.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                        // logo6,
                        gif,
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
        onPressed: () => BlocProvider.of<ThemeBloc>(context).add(UpdateTheme()),
        backgroundColor: accentColor,
        child: BlocSelector<ThemeBloc, ThemeState, bool>(
          selector: (state) => state.darkMode,
          builder: (context, darkMode) {
            return Icon(
              darkMode ? Icons.light_mode : Icons.dark_mode,
            );
          },
        ),
      ),
    );
  }
}

