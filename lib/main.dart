import 'package:flutter/material.dart';
import 'package:profy/app/core/domain/entities/database_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/app_widget.dart';
import 'app/di/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: DatabaseKeys.baseUrl,
    anonKey: DatabaseKeys.apiKey,
  );

  await configureDependencies();

  runApp(const AppWidget());
}
