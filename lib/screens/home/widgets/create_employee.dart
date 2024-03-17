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
import 'package:flutter_cms_business_manager/services/providers/cms_provider.dart';
import 'package:provider/provider.dart';

class CreateEmployee extends StatefulWidget {
  const CreateEmployee({super.key});

  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _name = '';
    String _role = '';
    String _department = '';

    final TextEditingController nameController = TextEditingController();
    final TextEditingController roleController = TextEditingController();
    final TextEditingController departmentController = TextEditingController();

    List<String> roles = ['Developer', 'Designer', 'Manager'];
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
          'Create Employee',
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
              const SizedBox(height: 32),
              CustomTextField(
                hintText: 'Name',
                controller: nameController,
                validator: (value) => Validators.validateName(value),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(),
                ),
                items: roles.map((String role) {
                  return DropdownMenuItem<String>(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _role = value!;
                  });
                },
                validator: (value) => Validators.validateRole(value),
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
                        cmsProvider.createEmployee(
                            nameController.text, _role, _department);

                        CustomSnackBar.show(
                            context, 'Employee Created Successfully',
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
                        CustomSnackBar.show(context, 'Error creating employee',
                            backgroundColor: AppColors.darkRed,
                            textColor: AppColors.white);
                      }
                    }
                  },
                  text: 'Create Employee'),
            ],
          ),
        ),
      ),
    );
  }
}
