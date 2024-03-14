import 'package:bot_toast/bot_toast.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:profy/app/core/routes/app_routes.dart';
import 'package:profy/app/core/routes/domain/entities/custom_transition.dart';
import 'package:profy/app/core/routes/domain/entities/custom_transition_type.dart';
import 'package:system_theme/system_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Profy',
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: FluentThemeData(
        accentColor: SystemTheme.accentColor.accent.toAccentColor(),
      ),
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
