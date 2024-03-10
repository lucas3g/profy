// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:profy/app/core/data/clients/database/params/client_database_params.dart';
import 'package:profy/app/core/data/clients/database/supabase/supabase_client.dart';
import 'package:profy/app/di/dependency_injection.dart';
import 'package:profy/app/shared/components/custom_button.dart';
import 'package:profy/app/shared/components/spacer_height_widget.dart';
import 'package:profy/app/shared/components/text_form_field.dart';
import 'package:profy/app/shared/domain/entities/app_theme_constants.dart';
import 'package:profy/app/shared/extensions/build_context_extension.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  final SupaBaseService supabase = getIt<SupaBaseService>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool createAccount = false;
  bool visibleFormLogin = true;
  bool visibleFormCreateAccount = false;

  Duration duration = const Duration(milliseconds: 500);
  Duration durationOpacity = const Duration(milliseconds: 1);

  late AnimationController _animationController;

  late Animation<Offset> _animationLogo,
      _animationForm,
      _animationFormCreateAccount;

  late Tween<Offset> _tweenLogo, _tweenForm, _tweenFormCreateAccount;

  late Animation<double> _animationLoginOpacity, _animationCreateAccountOpacity;

  late Tween<double> _tweenLoginOpacity, _tweenCreateAccountOpacity;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _tweenLogo = Tween<Offset>(
      begin: Offset(context.screenWidth * .25, 0),
      end: const Offset(0, 0),
    );

    _animationLogo = _tweenLogo.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _tweenForm = Tween<Offset>(
      begin: const Offset(0, 0),
      end: Offset(context.screenWidth * .25, 0),
    );

    _animationForm = _tweenForm.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _tweenFormCreateAccount = Tween<Offset>(
      begin: const Offset(0, 0),
      end: Offset(context.screenWidth * .25, 0),
    );

    _animationFormCreateAccount = _tweenFormCreateAccount.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _tweenLoginOpacity = Tween<double>(
      begin: 1,
      end: 0,
    );

    _animationLoginOpacity = _tweenLoginOpacity.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: createAccount ? const Interval(0.5, 1) : const Interval(0, 0.5),
      ),
    );

    _tweenCreateAccountOpacity = Tween<double>(
      begin: 0,
      end: 1,
    );

    _animationCreateAccountOpacity = _tweenCreateAccountOpacity.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: !createAccount ? const Interval(0.5, 1) : const Interval(0, 0.5),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: duration,
    );

    _animationController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _createAccount() async {
    setState(() {
      createAccount = !createAccount;
    });

    if (createAccount) {
      _animationController.forward();

      await Future<void>.delayed(const Duration(milliseconds: 200));

      setState(() {
        visibleFormCreateAccount = true;
        visibleFormLogin = false;
      });
    } else {
      _animationController.reverse();

      await Future<void>.delayed(const Duration(milliseconds: 150));

      setState(() {
        visibleFormCreateAccount = false;
        visibleFormLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.inversePrimary,
      body: Center(
        child: Container(
          width: context.screenWidth * .5,
          height: context.screenHeight * .5,
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: BorderRadius.circular(
              AppThemeConstants.largeBorderRadius,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Visibility(
                visible: visibleFormLogin,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: _animationForm.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: durationOpacity,
                    opacity: _animationLoginOpacity.value,
                    child: Container(
                      padding: const EdgeInsets.all(AppThemeConstants.padding),
                      width: context.screenWidth * .25,
                      height: context.screenHeight * .5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Fazer login',
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SpacerHeight(),
                          AppTextFormField(
                            borderColor: context.colorScheme.onBackground,
                            title: 'E-mail',
                            hint: 'Digite seu e-mail',
                            preffixIcon: const Icon(Icons.email),
                          ),
                          const SpacerHeight(),
                          AppTextFormField(
                            borderColor: context.colorScheme.onBackground,
                            title: 'Senha',
                            hint: 'Digite sua senha',
                            preffixIcon: const Icon(Icons.password),
                          ),
                          const SpacerHeight(),
                          AppCustomButton(
                            expands: true,
                            label: const Text('Entrar'),
                            icon: const Icon(Icons.login),
                            onPressed: () {},
                          ),
                          const SpacerHeight(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Text('Não tem uma conta?'),
                              const SizedBox(width: 5),
                              TextButton(
                                onPressed: _createAccount,
                                child: Text(
                                  'Criar conta',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: visibleFormCreateAccount,
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: _animationFormCreateAccount.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: durationOpacity,
                    opacity: _animationCreateAccountOpacity.value,
                    child: Container(
                      padding: const EdgeInsets.all(AppThemeConstants.padding),
                      width: context.screenWidth * .25,
                      height: context.screenHeight * .5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Criar conta',
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SpacerHeight(),
                          AppTextFormField(
                            borderColor: context.colorScheme.onBackground,
                            title: 'Nome Completo',
                            hint: 'Digite seu nome completo',
                            preffixIcon: const Icon(Icons.person),
                          ),
                          const SpacerHeight(),
                          AppTextFormField(
                            borderColor: context.colorScheme.onBackground,
                            title: 'Email',
                            hint: 'Digite seu email',
                            preffixIcon: const Icon(Icons.email),
                            controller: emailController,
                          ),
                          const SpacerHeight(),
                          AppTextFormField(
                            borderColor: context.colorScheme.onBackground,
                            title: 'Senha',
                            hint: 'Digite sua senha',
                            preffixIcon: const Icon(Icons.password),
                            controller: passwordController,
                          ),
                          const SpacerHeight(),
                          AppTextFormField(
                            borderColor: context.colorScheme.onBackground,
                            title: 'Confirmar senha',
                            hint: 'Confirme sua senha',
                            preffixIcon: const Icon(Icons.password),
                          ),
                          const SpacerHeight(),
                          AppCustomButton(
                            expands: true,
                            label: const Text('Criar conta'),
                            icon: const Icon(Icons.check),
                            onPressed: () async {
                              await supabase.createAccount(
                                params: ClientDataBaseCreateAccountParams(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            },
                          ),
                          const SpacerHeight(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Text('Já tem uma conta?'),
                              const SizedBox(width: 5),
                              TextButton(
                                onPressed: _createAccount,
                                child: Text(
                                  'Fazer login',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    color: context.colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedBuilder(
                animation: _animationController,
                builder: (BuildContext context, Widget? child) {
                  return Transform.translate(
                    offset: _animationLogo.value,
                    child: child,
                  );
                },
                child: AnimatedContainer(
                  duration: duration,
                  width: context.screenWidth * .25,
                  height: context.screenHeight * .5,
                  padding: const EdgeInsets.all(AppThemeConstants.padding),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        createAccount
                            ? AppThemeConstants.largeBorderRadius
                            : AppThemeConstants.largeBorderRadius * 8,
                      ),
                      bottomLeft: Radius.circular(
                        createAccount
                            ? AppThemeConstants.largeBorderRadius
                            : AppThemeConstants.largeBorderRadius * 8,
                      ),
                      topRight: Radius.circular(
                        createAccount
                            ? AppThemeConstants.largeBorderRadius * 8
                            : AppThemeConstants.largeBorderRadius,
                      ),
                      bottomRight: Radius.circular(
                        createAccount
                            ? AppThemeConstants.largeBorderRadius * 8
                            : AppThemeConstants.largeBorderRadius,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Profy',
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.background,
                          fontSize: 30,
                        ),
                      ),
                      Divider(
                        color: context.colorScheme.background,
                      ),
                      Text(
                        'Seu ajudante de pareceres escolares',
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: context.colorScheme.background,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
