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

class CreateRole extends StatefulWidget {
  const CreateRole({super.key});

  @override
  State<CreateRole> createState() => _CreateRoleState();
}

class _CreateRoleState extends State<CreateRole> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _jobTitle = '';
    String _salary = '';
    String _department = '';

    final TextEditingController jobTitleController = TextEditingController();
    final TextEditingController salaryController = TextEditingController();

    List<String> departments = ['IT', 'Marketing', 'HR'];

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
          'Create Role',
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
            children: [
              const SizedBox(height: 32),
              CustomTextField(
                hintText: 'Job Title',
                controller: jobTitleController,
                validator: (value) => Validators.validateRole(value),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Salary',
                controller: salaryController,
                validator: (value) => Validators.validateSalary(value),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(),
                ),
                items: departments.map((String department) {
                  return DropdownMenuItem<String>(
                    value: department,
                    child: Text(department),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _department = value!;
                  });
                },
                validator: (value) => Validators.validateDepartmentName(value),
              ),
              const SizedBox(height: 32),
              CustomButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      cmsProvider.createRole(
                        jobTitleController.text,
                        salaryController.text,
                        _department,
                      );

                      CustomSnackBar.show(
                        context,
                        'Role Created Successfully',
                        backgroundColor: AppColors.lightGreen,
                        textColor: AppColors.white,
                      );

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
                      CustomSnackBar.show(
                        context,
                        e.toString(),
                        backgroundColor: AppColors.lightRed,
                        textColor: AppColors.white,
                      );
                    }
                  }
                },
                text: 'Create Role',
              )
            ],
          ),
        ),
      ),
    );
  }
}
