part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class LoadTheme extends ThemeEvent{
  @override
  List<Object?> get props => [];
}

class ToggleDarkMode extends ThemeEvent{
  @override
  List<Object?> get props => [];
}