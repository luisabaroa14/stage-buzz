part of 'theme_bloc.dart';

class ThemeState {
  bool darkMode;

  ThemeState({
    this.darkMode = false,
  });

  ThemeState copyWith({
    bool? darkMode,
  }) {
    return ThemeState(
      darkMode: darkMode ?? this.darkMode,
    );
  }

  factory ThemeState.initState() => ThemeState();
}
