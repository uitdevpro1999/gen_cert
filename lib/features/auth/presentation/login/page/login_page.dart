import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen_cert/features/auth/presentation/login/bloc/login_cubit.dart';
import 'package:gen_cert/injection_container.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  late LoginCubit _loginCubit;

  @override
  void initState() {
    _loginCubit = getIt<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (_) => _loginCubit,
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
