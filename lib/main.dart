import 'package:check_app_settings/app_settings_bloc/app_settings_bloc.dart';
import 'package:check_app_settings/auth_bloc/auth_bloc.dart';
import 'package:check_app_settings/dashboard.dart';
import 'package:check_app_settings/localize_bloc/localize_bloc.dart';
import 'package:check_app_settings/login.dart';
import 'package:check_app_settings/splash_screen.dart';
import 'package:check_app_settings/theme_bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (BuildContext context) => ThemeBloc()..add(LoadTheme()),
        ),
        BlocProvider<LocalizeBloc>(
          create: (BuildContext context) => LocalizeBloc()..add(LoadLocalize()),
        ),
        BlocProvider<AppSettingsBloc>(
          create: (BuildContext context) => AppSettingsBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => AuthBloc(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ThemeBloc, ThemeState>(
            listener: (context, state) {
              if(state is ThemeLoaded){
                BlocProvider.of<AppSettingsBloc>(context).add(SetupTheme(isDarkMode: state.isDark));
              }
            },
          ),
          BlocListener<LocalizeBloc, LocalizeState>(
            listener: (context, state) {
              if(state is LocalizeLoaded){
                BlocProvider.of<AppSettingsBloc>(context).add(SetupLocalize(locale: state.locale));
              }
            },
          ),
          BlocListener<AppSettingsBloc, AppSettingsState>(
            listenWhen: (previous, current) {
              if(current is AppSettingsLoaded){
                if(current.loadPercentage >= 0.8){
                  print('fdsljfsf');
                  return true;
                }
              }
              print('nnooooooo');
              return false;
            },
            listener: (context, state) {
              if(state is AppSettingsLoaded){
                print(state.loadPercentage);
                BlocProvider.of<AuthBloc>(context).add(CheckAuth());
              }
            },
          ),
        ],
        child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
          builder: (context, state) {
            if(state is AppSettingsLoaded){
              return MaterialApp(
                locale: state.local,
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  brightness: state.isDarkMode ? Brightness.dark : Brightness.light,
                ),
                home: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if(state is IsAuth){
                      print('Auth Loaded');
                      return Dashboard();
                    }
                    else if(state is IsNotAuth){
                      return Login();
                    }
                    return SplashScreen();
                  },
                ),
              );
            }
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
