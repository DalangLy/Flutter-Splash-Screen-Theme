import 'package:check_app_settings/auth_bloc/auth_bloc.dart';
import 'package:check_app_settings/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ThemeBloc>(context).add(ToggleDarkMode());
                },
                child: Icon(Icons.dark_mode),
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(StartLogout());
                },
                child: Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
