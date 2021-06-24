import 'package:check_app_settings/auth_bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if(state is AuthProcessing){
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: (){
                      BlocProvider.of<AuthBloc>(context).add(StartLogin());
                    },
                    child: Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
