import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {

}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterPasswordVisibilityState extends RegisterStates {}

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,

  }) {
    emit(RegisterLoadingState());

  }

  IconData suffix = Icons.visibility_off_outlined;

  bool passwordVisible = true;

  void changeRegisterPasswordVisibility() {
    passwordVisible = !passwordVisible;
    suffix = passwordVisible
        ? Icons.visibility_off_outlined
        :Icons.visibility_outlined ;
    emit(RegisterPasswordVisibilityState());
  }
}
