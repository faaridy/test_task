import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/data/services/local/hive_local_service.dart';
import 'package:test_task/presentations/widgets/custom_input.dart';
import 'package:test_task/utilities/constants/app_colors.dart';
import 'package:test_task/utilities/extensions/navigation_extension.dart';
import 'package:test_task/utilities/extensions/sizedbox_extension.dart';
import '../../../data/models/local/user_response.dart';
import '../../../utilities/di/locator.dart';
import '../../../utilities/helpers/pager.dart';
import '../../../utilities/helpers/user_provider.dart';

class ProfilPage extends StatelessWidget {

  ProfilPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  static final hiveLocalService = locator<HiveLocalService>();
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    _nameController.text = userProvider.user.name;
    _emailController.text = userProvider.user.email;
    _phoneController.text = userProvider.user.phone;

    void handleSave() {
      if (_formKey.currentState!.validate()) {
        UserResponse updatedUser = UserResponse(
          name: _nameController.text,
          email: _emailController.text,
          phone: _phoneController.text,
        );
        userProvider.saveUser(updatedUser);
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInput(
                controller: _nameController,
                text: 'Name',
                isObsecure: false,
              ),
              15.h,
              CustomInput(
                controller: _emailController,
                text: 'Surname',
                isObsecure: false,
              ),
              15.h,
              CustomInput(
                controller: _phoneController,
                text: 'Phone',
                isObsecure: false,
              ),
              20.h,
              ElevatedButton(
                onPressed: handleSave,
                child: const Text('Save'),
              ),
              TextButton(
                  onPressed: () {
                    userProvider.deleteUser();
                    hiveLocalService.clearCache();
                    context.removeAll(Pager.login);
                  },
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: AppColors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
