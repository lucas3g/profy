// ignore_for_file: must_be_immutable

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';
import 'package:profy/app/shared/extensions/build_context_extension.dart';

class AppTextFormField extends StatefulWidget {
  TextEditingController? controller;
  String? title;
  final String hint;
  final String? value;
  final String? Function(String?)? validator;
  Function(String)? onChanged;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  bool hideInput;
  bool textArea;
  Color? borderColor;
  void Function()? onTap;
  FocusNode? focusNode;
  Function(String)? onFieldSubmitted;
  TextInputAction? textInputAction;
  bool readOnly;
  Widget? suffixIcon;
  Widget? preffixIcon;

  AppTextFormField({
    super.key,
    this.controller,
    this.title,
    required this.hint,
    this.onChanged,
    this.value,
    this.validator,
    this.hideInput = false,
    this.textArea = false,
    this.borderColor,
    this.inputFormatters,
    this.keyboardType,
    this.onTap,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
    this.readOnly = false,
    this.suffixIcon,
    this.preffixIcon,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _hideInput;

  @override
  void initState() {
    super.initState();
    _hideInput = widget.hideInput;
  }

  @override
  Widget build(BuildContext context) {
    return TextBox(
      readOnly: widget.readOnly,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      obscureText: _hideInput,
      controller: widget.controller,
      cursorColor: widget.borderColor ?? context.colorScheme.background,
      style: context.textTheme.bodyLarge?.copyWith(
        color: widget.borderColor ?? context.colorScheme.background,
        decorationColor: Colors.transparent,
        decorationThickness: 0,
      ),
      inputFormatters: widget.inputFormatters,
      placeholder: widget.hint,
      prefix: widget.preffixIcon,
      decoration: BoxDecoration(
        border: Border.all(
          color: widget.borderColor ?? context.colorScheme.background,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
