import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_image/network.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/components.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  bool? isImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userData = SocialCubit.get(context).userData;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        nameController.text = userData.name.toString();
        bioController.text = userData.bio.toString();
        print("profileData=>> " + userData.toString());
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Edit Profile',
            actions: [
              defaultTextButton(text: 'UPDATE', context: context),
              SizedBox(
                width: 15,
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 220,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:((coverImage == null)
                                      ? NetworkImageWithRetry(
                                      userData.cover.toString())
                                      : FileImage(coverImage)) as ImageProvider,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  onCamIconTapped(
                                    context: context, isCover: true,

                                  );
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.camera_enhance_rounded,
                                    size: 17,
                                  ),
                                  radius: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        alignment: AlignmentDirectional.topCenter,
                      ),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 65,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                radius: 60,
                                backgroundImage: ((profileImage == null)
                                    ? NetworkImageWithRetry(
                                        userData.image.toString())
                                    : FileImage(profileImage)) as ImageProvider,
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: Theme.of(context).backgroundColor,
                            radius: 20,
                          ),
                          InkWell(
                            onTap: () {
                              onCamIconTapped(
                                context: context,
                                isCover: false,
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.camera_enhance_rounded,
                                size: 17,
                              ),
                              radius: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                  controller: nameController,
                  type: TextInputType.text,
                  validator: (value) => nameValidator(value),
                  label: "Name",
                  prefixIcon: Feather.users,
                  inputAction: TextInputAction.next,
                  context: context,
                ),
                SizedBox(
                  height: 10,
                ),
                defaultTextField(
                  controller: bioController,
                  type: TextInputType.text,
                  validator: (value) => bioValidator(value),
                  label: "Bio",
                  prefixIcon: Entypo.info_with_circle,
                  context: context,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  nameValidator(String? value) {
    if (value!.isEmpty) {
      return "please Enter User Name";
    }
    return null;
  }

  bioValidator(String? value) {
    if (value!.isEmpty) {
      return "please Enter your bio";
    }
    return null;
  }
  bool? isCam;
  void onCamIconTapped({
    required context,
    required bool isCover,

  }) {
    showMenu<String>(
      color: Theme.of(context).backgroundColor,
      context: context,
      position: RelativeRect.fromLTRB(100, 80, 99.8, 100),
      //position where you want to show the menu on screen
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: Theme.of(context).focusColor,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      items: [
        PopupMenuItem<String>(
          value: '1',
          child: Row(
            children: [
              Text(
                'Camera',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Spacer(),
              SizedBox(
                width: 8,
              ),
              Icon(MaterialIcons.camera, color: Theme.of(context).focusColor),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: '2',
          child: Expanded(
            child: Row(
              children: [
                Text(
                  'Gallery',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                Icon(Icons.album, color: Theme.of(context).focusColor),
              ],
            ),
          ),
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        isCover?
        SocialCubit.get(context).getCoverCam()
        :SocialCubit.get(context).getProfileCam();
      } else if (itemSelected == "2") {
        isCover?
        SocialCubit.get(context).getCoverImage()
            :SocialCubit.get(context).getProfileImage();

      } else {
        //code here
      }
    });
  }
}
