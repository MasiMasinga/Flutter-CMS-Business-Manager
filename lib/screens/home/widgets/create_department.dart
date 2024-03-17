import 'package:flutter/material.dart';

// Constants
import 'package:flutter_cms_business_manager/common/constants/colors.dart';
import 'package:flutter_cms_business_manager/common/utils/validators.dart';

// Widgets
import 'package:flutter_cms_business_manager/common/widgets/custom_button.dart';
import 'package:flutter_cms_business_manager/common/widgets/custom_textfield.dart';
import 'package:flutter_cms_business_manager/common/widgets/snack_bar.dart';
import 'package:flutter_cms_business_manager/screens/home/widgets/main_screen.dart';

// Provider
import 'package:flutter_cms_business_manager/services/providers/cms_provider.dart';
import 'package:provider/provider.dart';

class CreateDepartment extends StatefulWidget {
  const CreateDepartment({super.key});

  @override
  State<CreateDepartment> createState() => _CreateDepartmentState();
}

class _CreateDepartmentState extends State<CreateDepartment> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _departmentName = '';

    final TextEditingController departmentController = TextEditingController();

    final cmsProvider = Provider.of<CMSProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(
                  initialIndex: 0,
                  key: ValueKey("MainScreen"),
                ),
              ),
            );
          },
        ),
        title: const Text(
          'Create Department',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomTextField(
                  hintText: 'Department Name',
                  controller: departmentController,
                  validator: (value) =>
                      Validators.validateDepartmentName(value),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      cmsProvider.createDepartment(departmentController.text);

                      CustomSnackBar.show(
                          context, 'Department Created Successfully',
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
                      CustomSnackBar.show(context, 'Error creating department',
                          backgroundColor: AppColors.darkRed,
                          textColor: AppColors.white);
                    }
                  }
                },
                text: 'Create Department',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
