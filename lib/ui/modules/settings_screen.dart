import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_image/network.dart';
import 'package:social_app/cubit/app_cubit.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/data/my_shared.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/ui/modules/authentecation/login_screen.dart';
import 'package:social_app/ui/modules/edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userData = SocialCubit.get(context).userData;

        print("profileData=>> " + userData.toString());
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 220,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Align(
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImageWithRetry(
                              '${userData.cover?.toString()}',
                              scale: 1.0,
                            ),
                          ),
                        ),
                      ),
                      alignment: AlignmentDirectional.topCenter,
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Stack(
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
                            backgroundImage: NetworkImageWithRetry(
                                '${userData.image?.toString()}'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${userData.name}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                '${userData.bio}',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '365',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Photos',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '320',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Followers ',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          children: [
                            Text(
                              '84',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'Add Photos',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  OutlinedButton(
                    onPressed: () {
                      navigateTo(context, EditProfileScreen());
                    },
                    child: Icon(
                      MaterialIcons.edit,
                      color: Theme.of(context).focusColor,
                      size: 25,
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(
                            color: Theme.of(context).primaryColor, width: 2,),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        MyShared.clearData('uId');
                        navigateTo(context, LoginScreen());
                      },
                      child: Row(
                        children: [
                          Icon(
                            MaterialIcons.logout,
                            color: Theme.of(context).focusColor,
                            size: 25,
                          ),
                          SizedBox(width: 10,),
                          Text(
                            'Logout',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  OutlinedButton(
                    onPressed: () {
                      AppCubit.get(context).changeAppMood();
                    },
                    child: AppCubit.get(context).iconMode,
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(
                            color: Theme.of(context).primaryColor,
                          width: 2,),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}
