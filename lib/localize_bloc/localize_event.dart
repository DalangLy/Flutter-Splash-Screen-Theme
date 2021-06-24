part of 'localize_bloc.dart';

abstract class LocalizeEvent extends Equatable {
  const LocalizeEvent();
}

class LoadLocalize extends LocalizeEvent{
  @override
  List<Object?> get props => [];
}