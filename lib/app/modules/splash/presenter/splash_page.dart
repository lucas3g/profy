import 'package:fluent_ui/fluent_ui.dart';
import 'package:profy/app/core/domain/entities/named_routes.dart';
import 'package:profy/app/shared/components/spacer_height_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _init() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    if (mounted) {
      await Navigator.of(context).pushReplacementNamed(NamedRoutes.login.route);
    }
  }

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return const Acrylic(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Splash Page'),
            SpacerHeight(),
            ProgressRing(),
          ],
        ),
      ),
    );
  }
}
