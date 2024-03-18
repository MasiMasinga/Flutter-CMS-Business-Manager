import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';
import 'package:flutter_cms_business_manager/common/utils/validators.dart';
import 'package:flutter_cms_business_manager/common/widgets/custom_button.dart';

// Widgets
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';
import 'package:flutter_cms_business_manager/common/widgets/custom_textfield.dart';
import 'package:flutter_cms_business_manager/common/widgets/snack_bar.dart';

// Provider
import 'package:flutter_cms_business_manager/services/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UpdateEmail extends StatelessWidget {
  const UpdateEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController newEmailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final userProvider = Provider.of<UserProvider>(context, listen: false);

    String userId = '';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(
                  initialIndex: 1,
                  key: ValueKey("MainScreen"),
                ),
              ),
            );
          },
        ),
        title: const Text(
          'Update Email',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                controller: newEmailController,
                hintText: 'Enter your new email',
                validator: (value) => Validators.validatePassword(
                  newEmailController.text,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                validator: (value) =>
                    Validators.validatePassword(passwordController.text),
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await userProvider.updateEmail(
                      userId,
                      newEmailController.text,
                      passwordController.text,
                    );
                    CustomSnackBar.show(context, 'Email updated successfully',
                        backgroundColor: AppColors.lightGreen,
                        textColor: AppColors.white);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(
                          initialIndex: 1,
                          key: ValueKey("MainScreen"),
                        ),
                      ),
                    );
                  } catch (e) {
                    CustomSnackBar.show(context, 'Error updating email: $e',
                        backgroundColor: AppColors.lightRed,
                        textColor: AppColors.white);
                  }
                }
              },
              text: 'Update Email',
              color: AppColors.primaryColor,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
