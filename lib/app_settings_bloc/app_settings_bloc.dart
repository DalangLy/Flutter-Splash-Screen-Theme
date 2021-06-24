import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc() : super(AppSettingsInitial());

  @override
  Stream<AppSettingsState> mapEventToState(
    AppSettingsEvent event,
  ) async* {
    if(event is SetupTheme){
      if(state is AppSettingsLoaded){
        final s = state as AppSettingsLoaded;
        yield AppSettingsLoading();
        final oldPercentage = s.loadPercentage;
        double newPercentage = oldPercentage + 0.5;
        print(newPercentage);
        yield AppSettingsLoaded(loadPercentage: newPercentage, isDarkMode: event.isDarkMode, local: s.local);
      }
      else{
        yield AppSettingsLoaded(loadPercentage: 0.5, isDarkMode: event.isDarkMode);
      }
    }
    else if(event is SetupLocalize){
      if(state is AppSettingsLoaded){
        final s = state as AppSettingsLoaded;
        yield AppSettingsLoading();
        final oldPercentage = s.loadPercentage;
        double newPercentage = oldPercentage + 0.5;
        yield AppSettingsLoaded(loadPercentage: newPercentage, local: event.locale, isDarkMode: s.isDarkMode);
      }
      else{
        yield AppSettingsLoaded(loadPercentage: 0.5, local: event.locale);
      }
    }
  }
}
