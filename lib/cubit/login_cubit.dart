import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {

}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginPasswordVisibilityState extends LoginStates {}

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);



  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());

  }

  IconData suffix = Icons.visibility_off_outlined;

  bool passwordVisible = true;

  void changePasswordVisibility() {
    passwordVisible = !passwordVisible;
    suffix = passwordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(LoginPasswordVisibilityState());
  }
}
