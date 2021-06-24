part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeLoaded extends ThemeState{
  final bool isDark;

  ThemeLoaded({ required this.isDark });

  @override
  List<Object?> get props => [isDark];
}