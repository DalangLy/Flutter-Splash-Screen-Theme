import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ThemeBloc() : super(ThemeInitial());

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if(event is LoadTheme){
      final SharedPreferences prefs = await _prefs;
      final isDark = prefs.getBool('isDarkMode') ?? false;
      yield ThemeLoaded(isDark: isDark);
    }
    else if(event is ToggleDarkMode){
      if(state is ThemeLoaded){
        final s = state as ThemeLoaded;
        bool newValue = !s.isDark;
        final SharedPreferences prefs = await _prefs;
        prefs.setBool('isDarkMode', newValue);
        yield ThemeLoaded(isDark: newValue);
      }
    }
  }
}
