import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/styles/theme.dart';
import 'package:social_app/ui/boarding/on_boarding_screen.dart';
import 'package:social_app/ui/modules/authentecation/login_screen.dart';
import 'package:social_app/shared/constants.dart';


import 'cubit/app_cubit.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/login_cubit.dart';
import 'cubit/register_cubit.dart';
import 'data/my_shared.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await MyShared.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [

        BlocProvider(
          create: (context) =>AppCubit()..getAppMode(),
        ),
        BlocProvider(
          create: (context) =>SocialCubit(SocialInitialState())..getUserData(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: ( context, state) {  },
        builder: ( context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme:lightTheme,
            darkTheme: darkTheme,
            themeMode:ThemeMode.dark,
            home: OnBoardingScreen(),
          );
        },

      ),
    );
  }
}
