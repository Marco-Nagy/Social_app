import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/data/my_shared.dart';
import 'package:social_app/ui/models/user_model.dart';
import 'package:social_app/ui/modules/feeds_screen.dart';
import 'package:social_app/ui/modules/search_screen.dart';
import 'package:social_app/ui/modules/settings_screen.dart';
import 'package:social_app/ui/modules/users_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialBottomNavigateState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}

class SocialProfileCamPickedSuccessState extends SocialStates {}

class SocialProfileCamPickedErrorState extends SocialStates {}

class SocialCoverCamPickedSuccessState extends SocialStates {}

class SocialCoverCamPickedErrorState extends SocialStates {}

class SocialProfileImageUploadSuccessState extends SocialStates {}

class SocialProfileImageUploadErrorState extends SocialStates {}

class SocialCoverImageUploadSuccessState extends SocialStates {}

class SocialCoverImageUploadErrorState extends SocialStates {}

//
// class SocialProfileCamUploadSuccessState extends SocialStates {}
//
// class SocialProfileCamUploadErrorState extends SocialStates {}
//
// class SocialCoverCamUploadSuccessState extends SocialStates {}
//
// class SocialCoverCamUploadErrorState extends SocialStates {}
class SocialUserUpdateLoadingState extends SocialStates {}
class SocialUserUpdateSuccessState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {}

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit(SocialStates initialState) : super(initialState);

  static SocialCubit get(context) => BlocProvider.of(context);
  static String uid = MyShared.getData('uId');
  UserData userData = UserData();

  void getUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uid).get().then((value) {
      //print(value.data());
      userData = UserData.fromJson(value.data());
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
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

  File? profileImage;

  getProfileImage() async {
    // Pick an image
    final imageProfile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageProfile != null) {
      print('Image Path ==>> ${imageProfile.path}');
      profileImage = File(imageProfile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('no image Selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  getProfileCam() async {
    final imageProfile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageProfile != null) {
      print('Image Path ==>> ${imageProfile.path}');
      profileImage = File(imageProfile.path);
      emit(SocialProfileCamPickedSuccessState());
    } else {
      print('no image Selected');
      emit(SocialProfileCamPickedErrorState());
    }
  }

  File? coverImage;

  getCoverImage() async {
    // Pick an image
    final imageCover =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageCover != null) {
      print('Image Path ==>> ${imageCover.path}');
      coverImage = File(imageCover.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('no image Selected');
      emit(SocialCoverImagePickedErrorState());
    }
  }

  getCoverCam() async {
    final imageCover =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageCover != null) {
      print('Image Path ==>> ${imageCover.path}');
      coverImage = File(imageCover.path);
      emit(SocialCoverCamPickedSuccessState());
    } else {
      print('no image Selected');
      emit(SocialCoverCamPickedErrorState());
    }
  }

// File? profileImage;
// getProfileImage()async{
//   try{
//     final profileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if(profileImage== null)return;
//     final getImage = File(profileImage.path);
//     this.profileImage= getImage;
//     print('Image Path ==>> ${profileImage.path}');
//     emit(SocialProfileImagePickedSuccessState());
//   }on PlatformException catch(e){
//     print('Failed to Pic Image  $e');
//   }
// }
  String profileImageUrl = '';

  void uploadProfileImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialProfileImageUploadSuccessState());
        value = profileImageUrl;
        print(value);
      }).catchError((onError) {
        emit(SocialProfileImageUploadErrorState());
      });
    }).catchError((error) {
      emit(SocialProfileImageUploadErrorState());
    });
  }

  String coverImageUrl = '';

   uploadCoverImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SocialCoverImageUploadSuccessState());
        value = coverImageUrl;
        print(value);
      }).catchError((onError) {
        emit(SocialCoverImageUploadErrorState());
      });
    }).catchError((error) {
      emit(SocialCoverImageUploadErrorState());
    });
  }

   updateUser({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    if (profileImage != null) {
      uploadProfileImage();
    } else if (coverImage != null) {
      uploadCoverImage();
    } else {
      UserData user = UserData(
        name: name,
        phone: phone,
        isEmailVerified: false,
        bio: bio,
        email: userData.email,
        image: userData.image,
        cover: userData.cover,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update(user.toMap())
          .then((value) {
       getUserData();

      }).catchError((onError) {
        emit(SocialUserUpdateErrorState());
      });
    }
  }
}
