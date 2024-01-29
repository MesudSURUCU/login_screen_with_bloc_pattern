import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_bloc.dart';
import 'package:login_screen_with_bloc_pattern/blocs/auth/login/login_state.dart';
import 'package:login_screen_with_bloc_pattern/repository/auth/login/login_repository.dart';
import 'package:login_screen_with_bloc_pattern/views/auth/form_submission_status.dart';
import 'package:login_screen_with_bloc_pattern/views/auth/login/widgets/form_widget.dart';


class LoginScreen extends StatelessWidget {
const  LoginScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) =>
       LoginBloc(authRepo: context.read<LoginRepository>()),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: ((previous, current) => 
        previous.formStatus != current.formStatus),
        listener: (context, state) {
          final formStatus = state.formStatus;

          if(formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
          }
        },
        child: Container(
          decoration:const BoxDecoration(image: DecorationImage(image: AssetImage("assets/photo.png"), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(30.0) + const EdgeInsets.only(top: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [                  
                    FormWidget(),
                    ],
                    ),
          ),
        ),
      ),),
             
      );     
  }

  void _showSnackBar(BuildContext context, String message) {
 final snackBar = SnackBar(content: Text(message),);
 ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

