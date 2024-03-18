import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

// Utils
import 'package:flutter_cms_business_manager/common/utils/validators.dart';

// Widgets
import 'package:flutter_cms_business_manager/common/widgets/custom_textfield.dart';
import 'package:flutter_cms_business_manager/common/widgets/custom_button.dart';
import 'package:flutter_cms_business_manager/common/widgets/snack_bar.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/auth/forgot_password.dart';
import 'package:flutter_cms_business_manager/screens/auth/register.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';

// Provider
import 'package:provider/provider.dart';
import 'package:flutter_cms_business_manager/services/providers/auth_provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: const TextStyle(
            color: AppColors.black,
            fontSize: 20,
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: Center(
                  child: FlutterLogo(
                    size: 60,
                    textColor: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validators.validateEmail(value),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                  validator: (value) => Validators.validatePassword(value),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authProvider.login(
                        emailController.text,
                        passwordController.text,
                      );

                      CustomSnackBar.show(context, 'Login successful',
                          backgroundColor: AppColors.lightGreen,
                          textColor: AppColors.white);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(
                            initialIndex: 0,
                            key: ValueKey("MainScreen"),
                          ), 
                        ),
                      );
                    } catch (e) {
                      CustomSnackBar.show(context, 'Error logging in',
                          backgroundColor: AppColors.darkRed,
                          textColor: AppColors.white);
                    }
                  }
                },
                text: 'Login',
                color: AppColors.primaryColor,
                textColor: AppColors.white,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: const Text(
                  'Don\'t have an account? Register',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
