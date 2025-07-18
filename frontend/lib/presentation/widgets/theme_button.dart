import 'package:app/core/bloc/theme/theme_bloc.dart';
import 'package:app/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
