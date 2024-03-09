import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _init() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    if (mounted) {
      context.go('/auth');
    }
  }

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Splash Page'),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
