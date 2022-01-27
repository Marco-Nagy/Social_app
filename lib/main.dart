import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/shared/styles/theme.dart';
import 'package:social_app/ui/boarding/on_boarding_screen.dart';
import 'cubit/app_cubit.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/login_cubit.dart';
import 'cubit/register_cubit.dart';
import 'data/my_shared.dart';
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.data.toString()}");
  showToast(message: "Handling a background message");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var token = await FirebaseMessaging.instance.getToken();
  print('device token ===>> $token');
  FirebaseMessaging.onMessage.listen((event) {
    print('onMessage App');
    showToast(message: "onMessage App");
    print(event.data.toString());
  }).onError((error){
    print(error.toString());
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    showToast(message: "onMessage opened App");
    print('onMessage opened App');
    print(event.data.toString());
  }).onError((error){
    print(error.toString());
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
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
