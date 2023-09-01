import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/core/routes/app_routers.dart';
import 'package:simple_app/core/utils/app_size.dart';
import 'package:simple_app/core/utils/helper.dart';

import '../../../controller/network/local/hive_server.dart';
import '../../../controller/services/services_locator.dart';
import '../../widgets/default_bottom.dart';
import '../../widgets/flutter_toast.dart';
import '../../widgets/textform_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _validateInputs() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (Helper.isEmailValid(email)) {
      if (Helper.isPasswordValid(password)) {
        ServiceLocator.instance<HiveServer>()
            .insertOrUpdateUser(email, password)
            .then((value) {
          context.pushNamedAndRemoveUntil(
              Routers.HOME_SCREEN, (route) => false);
        });

        showToast(
          text: "login successfully",
          state: ToastStates.SUCCESS,
        );
      } else {
        showToast(
          state: ToastStates.ERROR,
          text: 'Password is incorrect try again',
        );
      }
    } else {
      showToast(
        text: 'Please enter a valid email address.',
        state: ToastStates.ERROR,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(backgroundColor: Colors.grey[100], elevation: 0.0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: kIsWeb ? 400.0 : context.width * 0.8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ],
              ),
              padding: kIsWeb
                  ? const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0)
                  : const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'welcome',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSize.sv_10,
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AppSize.sv_20,
                    DefaultTextFormWidget(
                      controller: _emailController,
                      hintText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefix: Icons.email,
                    ),
                    AppSize.sv_10,
                    DefaultTextFormWidget(
                      controller: _passwordController,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      prefix: Icons.lock,
                      suffix: Icons.visibility,
                      isPassword: true,
                    ),
                    AppSize.sv_10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppSize.sv_10,
                    DefaultButton(
                      onPressed: _validateInputs,
                      textBottom: 'Login',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
