import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage _storage = new FlutterSecureStorage();
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if(event is CheckAuth){
      yield AuthProcessing();
      final auth = await _storage.read(key: 'auth');
      if(auth == null){
        print('hello $auth');
        yield IsNotAuth();
      }
      else{
        yield IsAuth();
      }
    }
    else if(event is StartLogin){
      await _storage.write(key: 'auth', value: 'hello world');
      yield IsAuth();
    }
    else if(event is StartLogout){
      await _storage.delete(key: 'auth');
      yield IsNotAuth();
    }
  }
}
