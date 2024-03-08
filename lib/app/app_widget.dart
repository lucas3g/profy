import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:profy/app/core/routes/routes.dart';

import 'shared/theme/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Profy',
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: routerConfig,
    );
  }
}
