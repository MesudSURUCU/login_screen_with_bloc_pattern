import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_event.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_state.dart';

class UsernameTextField extends StatelessWidget {
 
  const UsernameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<LoginBloc, LoginState>(
      builder: ((context, state) {
        return TextFormField(
        style:const TextStyle(color: Colors.black, fontSize: 20),
        decoration:const  InputDecoration(
          icon: Icon(Icons.person),
          hintText: "username",
          hintStyle: TextStyle(color: Colors.black),
                
        ),
        validator: (value) => state.isValidUserName ? null : "Username is too short",
        onChanged: (value) => context
        .read<LoginBloc>()
        .add(LoginUsernameChanged(username: value)),
      );
   } ));
  }
}