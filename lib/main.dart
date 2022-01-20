import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/styles/theme.dart';
import 'package:social_app/ui/boarding/on_boarding_screen.dart';
import 'cubit/app_cubit.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/login_cubit.dart';
import 'cubit/register_cubit.dart';
import 'data/my_shared.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await MyShared.init();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (BuildContext context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getAppMode(),
        ),
        BlocProvider(
          create: (context) => SocialCubit(SocialInitialState())
            ..getUserData()
            ..getPosts(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            title: 'Instagram_App',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).themeMode,
            home: ResponsiveSizer(
              builder: (BuildContext, Orientation, ScreenType) {
                return OnBoardingScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
