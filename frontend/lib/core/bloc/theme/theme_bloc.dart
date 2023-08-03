import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initState()) {
    on<ThemeEvent>(
      (event, emit) => emit(state.copyWith(darkMode: !state.darkMode)),
    );
  }
}
