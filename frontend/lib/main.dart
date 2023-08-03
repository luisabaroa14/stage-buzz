import 'package:app/core/bloc/theme/theme_bloc.dart';
import 'package:app/core/navigation/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc(),
        ),
      ],
      child: BlocSelector<ThemeBloc, ThemeState, bool>(
        selector: (state) => state.darkMode,
        builder: (context, darkMode) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            theme: darkMode ? darkTheme : lightTheme,
          );
        },
      ),
    );
  }
}
