part of 'app_settings_bloc.dart';

abstract class AppSettingsState extends Equatable {
  const AppSettingsState();
}

class AppSettingsInitial extends AppSettingsState {
  @override
  List<Object> get props => [];
}

class AppSettingsLoading extends AppSettingsState{
  @override
  List<Object?> get props => [];
}

class AppSettingsLoaded extends AppSettingsState{
  final double loadPercentage;
  final bool isDarkMode;
  final Locale local;

  AppSettingsLoaded({ required this.loadPercentage, this.isDarkMode = false, this.local = const Locale('en') });

  @override
  List<Object?> get props => [isDarkMode, local];
}
