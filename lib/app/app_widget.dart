import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:profy/app/core/routes/app_routes.dart';
import 'package:profy/app/core/routes/domain/entities/custom_transition.dart';
import 'package:profy/app/core/routes/domain/entities/custom_transition_type.dart';
import 'package:profy/app/shared/theme/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profy',
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      onGenerateRoute: CustomNavigator(
        generateAnimation: _generateAnimation,
      ).onGenerateRoute,
    );
  }

  CustomTransition _generateAnimation(RouteSettings settings) {
    return CustomTransition(
      transitionType: CustomTransitionType.fade,
      duration: const Duration(milliseconds: 200),
    );
  }
}
