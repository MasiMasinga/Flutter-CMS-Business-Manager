import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';

// Utils
import 'package:flutter_cms_business_manager/common/utils/validators.dart';

// Widgets
import 'package:flutter_cms_business_manager/common/widgets/custom_button.dart';
import 'package:flutter_cms_business_manager/common/widgets/custom_textfield.dart';
import 'package:flutter_cms_business_manager/common/widgets/snack_bar.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';

// Provider
import 'package:flutter_cms_business_manager/services/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UpdateName extends StatelessWidget {
  const UpdateName({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final TextEditingController nameController = TextEditingController();

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
          'Update Name',
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
                controller: nameController,
                hintText: 'Name',
                validator: (value) => Validators.validateName(
                  nameController.text,
                ),
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await userProvider.updateName(userId, nameController.text);
                    CustomSnackBar.show(context, 'Name updated successfully',
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
                    CustomSnackBar.show(context, 'Error updating name',
                        backgroundColor: AppColors.lightRed,
                        textColor: AppColors.white);
                  }
                }
              },
              text: 'Update Name',
              color: AppColors.primaryColor,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
