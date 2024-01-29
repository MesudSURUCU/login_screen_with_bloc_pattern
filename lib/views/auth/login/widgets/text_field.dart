import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_event.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_state.dart';

class MyTextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final Icon icon;
  const MyTextFieldWidget({
    super.key,required this.hintText, required this.icon, this.obsecureText = false
  });

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return TextFormField(
        obscureText: obsecureText,
        style:const TextStyle(color: Colors.black, fontSize: 25),
        decoration:  InputDecoration(
          icon: icon,
          hintText: hintText,
          hintStyle:const TextStyle(color: Colors.black),
                
        ),
        validator: (value) => state.isValidUserName ? null : "Input is too short",
        onChanged: (value) => context
        .read<LoginBloc>()
        .add(LoginUsernameChanged(username: value)),
      );
   } ));
  }
}


