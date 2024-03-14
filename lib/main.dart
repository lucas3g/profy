import 'package:fluent_ui/fluent_ui.dart';
import 'package:system_theme/system_theme.dart';

import 'app/app_widget.dart';
import 'app/di/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemTheme.accentColor.load();

  await configureDependencies();

  runApp(const AppWidget());
}
