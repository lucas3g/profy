// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:fluent_ui/fluent_ui.dart';
import 'package:profy/app/shared/extensions/build_context_extension.dart';

class AppCustomButton extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final Function()? onPressed;
  final bool expands;
  final double height;
  Color? backgroundColor;

  AppCustomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.expands = false,
    this.height = 40,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    backgroundColor ??= context.colorScheme.primary;

    return FilledButton(
      onPressed: onPressed,
      child: label,
    );
  }
}
