import 'package:flutter/material.dart';
import 'package:revision/src/core/constants/color_manager.dart';


import 'components/form_auth_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorManager.backgroundColor,
     body:FormAuthBody(),
    );
  }
}
