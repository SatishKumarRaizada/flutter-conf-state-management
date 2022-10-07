import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_shopping/config/routes/app_route.dart';
import 'package:my_shopping/theme/app_theme.dart';
import 'state/theme/app_theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _route = AppRoute();

  @override
  Widget build(BuildContext context) {
    // provider where all starts with consumer
    return Consumer(
      builder: (context, ref, child) {
        final currentTheme = ref.watch(themeProvider).darkMode;
        return MaterialApp(
          title: 'My Shopping App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: currentTheme ? ThemeMode.dark : ThemeMode.light,
          onGenerateRoute: _route.onGenerateRoute,
        );
      },
    );
  }
}
