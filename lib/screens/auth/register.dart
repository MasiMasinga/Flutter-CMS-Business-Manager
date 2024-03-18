import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

// Utils
import 'package:flutter_cms_business_manager/common/utils/validators.dart';

// Widgets
import 'package:flutter_cms_business_manager/common/widgets/custom_textfield.dart';
import 'package:flutter_cms_business_manager/common/widgets/snack_bar.dart';
import 'package:flutter_cms_business_manager/common/widgets/custom_button.dart';

// Screens
import 'package:flutter_cms_business_manager/screens/auth/login.dart';

// Provider
import 'package:provider/provider.dart';
import 'package:flutter_cms_business_manager/services/providers/auth_provider.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

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
          key: formKey,
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
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: nameController,
                  hintText: 'Enter your name',
                  validator: (value) =>
                      Validators.validateName(nameController.text),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      Validators.validateEmail(emailController.text),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                  validator: (value) =>
                      Validators.validatePassword(passwordController.text),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm your password',
                  obscureText: true,
                  validator: (value) => Validators.confirmPasswordValidator(
                    passwordController.text,
                    confirmPasswordController.text,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    try {
                      authProvider.createUser(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                      );

                      CustomSnackBar.show(context, 'User created successfully',
                          backgroundColor: AppColors.lightGreen,
                          textColor: AppColors.white);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    } catch (e) {
                      CustomSnackBar.show(context, 'Error creating user',
                          backgroundColor: AppColors.darkRed,
                          textColor: AppColors.white);
                    }
                  }
                },
                text: 'Register',
                color: AppColors.primaryColor,
                textColor: AppColors.white,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: const Text(
                  'Already have an account? Login',
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
