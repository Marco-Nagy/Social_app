import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/ui/models/user_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterPasswordVisibilityState extends RegisterStates {}

class CreateUserSuccessState extends RegisterStates {}

class CreateUserErrorState extends RegisterStates {
  final String error;

  CreateUserErrorState(this.error);
}

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
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        name: name,
        phone: phone,
        email: email,
        uId: value.user!.uid,

      );

    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error));
    });
  }

  void userCreate({
    required String name,
    required String phone,
    required String email,
    required String uId,
  }) {
    UserData userData = UserData(
      name: name,
      phone: phone,
      email: email,
      uId: uId,
      isEmailVerified:false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userData.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_off_outlined;

  bool passwordVisible = true;

  void changeRegisterPasswordVisibility() {
    passwordVisible = !passwordVisible;
    suffix = passwordVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterPasswordVisibilityState());
  }
}
