import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_event.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_state.dart';

class PasswordTextField extends StatelessWidget {
 
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return TextFormField(
          obscureText: true,
        style:const TextStyle(color: Colors.black,fontSize: 20),
        decoration:const  InputDecoration(
          icon: Icon(Icons.key),
          hintText: "password",
          hintStyle: TextStyle(color: Colors.black),
                
        ),
        validator: (value) => state.isValidPassword ? null : "Password is too short",
        onChanged: (value) => context
        .read<LoginBloc>()
        .add(LoginPasswordChanged(password: value)),
      );
   } ));
  }
}