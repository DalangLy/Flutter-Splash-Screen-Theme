part of 'localize_bloc.dart';

abstract class LocalizeState extends Equatable {
  const LocalizeState();
}

class LocalizeInitial extends LocalizeState {
  @override
  List<Object> get props => [];
}

class LocalizeLoaded extends LocalizeState{
  final Locale locale;

  LocalizeLoaded({required this.locale});

  @override
  List<Object?> get props => [locale];
}