import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:profy/app/core/domain/entities/app_global.dart';
import 'package:profy/app/core/domain/entities/named_routes.dart';
import 'package:profy/app/shared/components/spacer_height_widget.dart';
import 'package:profy/app/shared/extensions/build_context_extension.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool userLogged() {
    final AppGlobal appGlobal = AppGlobal.instance;

    return appGlobal.user != null;
  }

  Future<void> _init() async {
    BotToast.showWidget(
      toastBuilder: (_) => Material(
        color: Colors.transparent,
        child: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(),
                const SpacerHeight(),
                Text(
                  'Verificando licença...',
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SpacerHeight(),
              ],
            ),
          ),
        ),
      ),
    );

    await Future<void>.delayed(const Duration(seconds: 2));

    BotToast.cleanAll();

    if (userLogged()) {
      await Navigator.pushReplacementNamed(context, NamedRoutes.home.route);
    } else {
      await Navigator.pushReplacementNamed(context, NamedRoutes.login.route);
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async => _init());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
