import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/login_cubit.dart';
import 'package:social_app/data/my_shared.dart';
import 'package:social_app/ui/modules/authentecation/register_screen.dart';
import 'package:social_app/ui/modules/social_layout.dart';
import '../../../shared/components.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKye = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
              showToast(message: state.error.toString());
              return;

            } if(state is LoginSuccessState)  {
          MyShared.saveData(
              'uId', state.uId)
              .then((value) {
            print(value);
            navigateAndFinish(context, SocialLayout());
          });

          navigateAndFinish(context, SocialLayout());
              //showToast(message: state.loginResponse.message.toString());
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 33,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login now to brows our hot offers",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultTextField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) => emailValidator(value),
                        label: "Email",
                        prefixIcon: Icons.email_rounded,
                        inputAction: TextInputAction.next,
                        context: context,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      defaultTextField(
                        controller: passwordController,
                        type: TextInputType.text,
                        obscureText: LoginCubit.get(context).passwordVisible,
                        validator: (value) => passwordValidator(value),
                        label: "password",
                        prefixIcon: Icons.lock_rounded,
                        suffixIcon: IconButton(
                          onPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          icon: Icon(LoginCubit.get(context).suffix),
                        ),
                        context: context,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        fallback: (BuildContext context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (BuildContext context) => defaultButton(
                            function: () {
                              if (formKye.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                                print(emailController.text);
                                print(passwordController.text);

                              }
                            },
                            text: "login"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have account?",
                            style: TextStyle(fontSize: 13),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                navigateTo(context, RegisterScreen());
                              },
                              child: Text("Register",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlue)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  passwordValidator(value) {
    if (value!.isEmpty) {
      return "please Enter Email";
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
}
