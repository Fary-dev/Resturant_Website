import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Bloc/user_bloc.dart';
import 'package:flutter_app/screens/home_Screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/bloc_state.dart';
import 'Constant/constant.dart';
import 'screens/login_width_web.dart';
import 'screens/onBurding_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<UserBloc>(create: (_) => UserBloc())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodo ',
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(color: primaryColor),
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: defaultTargetPlatform == TargetPlatform.android ||
              defaultTargetPlatform == TargetPlatform.macOS
          ? OnburdingScreen()
          // ? BlocBuilder<UserBloc, BlocState>(
          //     builder: (context, state) {
          //       if (state is Authenticated) return const HomeScreen();
          //       return LoginWeb(state: state);
          //     },
          //   )
          : BlocBuilder<UserBloc, BlocState>(
              builder: (context, state) {
                if (state is Authenticated) return const HomeScreen();
                return LoginWeb(state: state);
              },
            ),
    );
  }
}
