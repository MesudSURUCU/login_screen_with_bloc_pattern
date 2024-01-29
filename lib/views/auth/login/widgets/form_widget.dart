import 'package:flutter/material.dart';
import 'package:login_screen_with_bloc_pattern/views/auth/login/widgets/login_button.dart';
import 'package:login_screen_with_bloc_pattern/views/auth/login/widgets/password_textfield.dart';
import 'package:login_screen_with_bloc_pattern/views/auth/login/widgets/username_textfield.dart';

class FormWidget extends StatelessWidget {
   FormWidget({super.key});
 final GlobalKey _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Card(
          color: Colors.white24,
          child: Column(
            children: [
            const UsernameTextField(),
            const  PasswordTextField(),
           const SizedBox(height: 15,),
              LoginButton(
                formKey: _formKey,
              )],
          ),
        ),
      );
  }
}


