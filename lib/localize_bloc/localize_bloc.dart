import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'localize_event.dart';
part 'localize_state.dart';

class LocalizeBloc extends Bloc<LocalizeEvent, LocalizeState> {
  LocalizeBloc() : super(LocalizeInitial());

  @override
  Stream<LocalizeState> mapEventToState(
    LocalizeEvent event,
  ) async* {
    if(event is LoadLocalize){
      await Future.delayed(Duration(seconds: 5));
      yield LocalizeLoaded(locale: Locale('en'));
    }
  }
}
