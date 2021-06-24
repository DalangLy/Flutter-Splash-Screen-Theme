part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();
}

class SetupTheme extends AppSettingsEvent{
  final bool isDarkMode;

  SetupTheme({ required this.isDarkMode });

  @override
  List<Object?> get props => [isDarkMode];
}

class SetupLocalize extends AppSettingsEvent{
  final Locale locale;

  SetupLocalize({ required this.locale });

  @override
  List<Object?> get props => [];
}