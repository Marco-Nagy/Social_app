import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/register_cubit.dart';
import 'package:social_app/ui/modules/social_layout.dart';

import '../../../shared/components.dart';


class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var userNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKye = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(

        listener: (context, state) {
          if(state is CreateUserSuccessState){
            navigateAndFinish(context, SocialLayout());
          }
        },
        builder: (context, state) {

          return Scaffold(
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.all(15),
                width: double.infinity,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Form(
                  key: formKye,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "REGISTER",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 33,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Register now to brows our hot offers",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (value) => emailValidator(value),
                            label: "Email Address",
                            prefixIcon: Icons.mail,
                            inputAction: TextInputAction.next, context: context),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextField(
                            controller: userNameController,
                            type: TextInputType.text,
                            validator: (value) => userNameValidator(value),
                            label: "User Name",
                            prefixIcon: Icons.person_rounded,
                            inputAction: TextInputAction.next, context: context),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextField(
                            controller: phoneNumberController,
                            type: TextInputType.phone,
                            validator: (value) => phoneValidator(value),
                            label: "Phone No",
                            prefixIcon: Icons.phone,
                            inputAction: TextInputAction.next, context: context),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextField(
                          controller: passwordController,
                          type: TextInputType.text,
                          obscureText:  RegisterCubit.get(context).passwordVisible,
                          validator: (value) => passwordValidator(value),
                          label: "password",
                          prefixIcon: Icons.lock_rounded,
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(context).changeRegisterPasswordVisibility();
                            },
                            icon: Icon(RegisterCubit.get(context).suffix),
                          ), context: context,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextField(
                          controller: confirmPasswordController,
                          type: TextInputType.text,
                          obscureText: RegisterCubit.get(context).passwordVisible,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "please Confirm Password";
                            }
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return " password not matched ";
                            }
                            return null;
                          },
                          label: "Confirm Password",
                          prefixIcon: Icons.lock_rounded,
                          suffixIcon: IconButton(
                            onPressed: () {
                              RegisterCubit.get(context).changeRegisterPasswordVisibility();
                            },
                            icon: Icon(RegisterCubit.get(context).suffix),
                          ), context: context,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          fallback: (context) =>   Center(child: CircularProgressIndicator()),
                          builder:(context) => defaultButton(
                            text: "Create Account",
                            function: () {
                              if (formKye.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: userNameController.text,
                                  phone: phoneNumberController.text,
                                  email: emailController.text,
                                  password: passwordController.text,

                                );
                                print(emailController.text);
                                print(passwordController.text);
                                print(userNameController.text);
                                print(phoneNumberController.text);

                              }
                            }, context: context,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have account?",
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Text("Login",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  emailValidator(String? value) {
    if (value!.isEmpty) {
      return "please Enter Email";
    }
    bool emailValid = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
    if (!emailValid) {
      return "email not valid";
    }
    return null;
  }

  phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "please Enter Phone Number";
    }
    String pattern = r'(^(?:[+0]9)?[0-9]{11}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
  }

  userNameValidator(String? value) {
    if (value!.isEmpty) {
      return "please Enter User Name";
    }
    return null;
  }

  passwordValidator(value) {
    if (value!.isEmpty) {
      return "please Enter Password";
    }
    if (value.length < 8) {
      return " password must be  more 8 characters ";
    }
    bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value);
    if (!passwordValid) {
      return "password not valid";
    }
    return null;
  }
}
