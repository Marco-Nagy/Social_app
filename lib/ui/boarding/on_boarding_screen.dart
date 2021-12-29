import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_app/data/my_shared.dart';
import 'package:social_app/ui/modules/authentecation/login_screen.dart';
import 'package:social_app/ui/modules/social_layout.dart';

import '../../shared/components.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Lottie.network(
          'https://assets5.lottiefiles.com/private_files/lf30_5jrklsmp.json',
          controller: _controller,
          height: MediaQuery.of(context).size.height * 2,
          animate: true,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward().whenComplete(() =>
                  navigate()
                  //navigateTo(context, LoginScreen())
                  );
          },
        ));
  }

  void navigate() {

    if (MyShared.getData('uId') == null) {
      navigateTo(context, LoginScreen());
    } else {
      print('uId >> '+MyShared.getData('uId').toString());
      navigateAndFinish(context, SocialLayout());
    }
  }
}
