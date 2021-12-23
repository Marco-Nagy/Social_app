import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:social_app/data/my_shared.dart';
import 'package:social_app/shared/styles/icon_broken.dart';
import 'package:social_app/ui/models/user_model.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/ui/modules/chats_screen.dart';
import 'package:social_app/ui/modules/feeds_screen.dart';
import 'package:social_app/ui/modules/search_screen.dart';
import 'package:social_app/ui/modules/settings_screen.dart';
import 'package:social_app/ui/modules/users_screen.dart';

abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialBottomNavigateState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit(SocialStates initialState) : super(initialState);

  static SocialCubit get(context) => BlocProvider.of(context);
  static String uid = MyShared.getData('uId');
  UserData? userData;

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((value) {
          print(value.data());
          emit(SocialGetUserSuccessState());
    }).catchError((error){
      print(error.toString());

      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(FontAwesome5Solid.home),
      label: "Home",
    ),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome5Solid.search), label: "Chats"),
    BottomNavigationBarItem(
      icon: Icon(FontAwesome5Solid.user_friends),
      label: "Users",
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.settings), label: "Settings"),
  ];

  void changeBottomNavigationBar(int index) {
    currentIndex = index;
    emit(SocialBottomNavigateState());
  }

  List<Widget> screens = [
    FeedsScreen(),
    SearchScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];
}
