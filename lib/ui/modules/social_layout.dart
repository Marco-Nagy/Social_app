import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/ui/modules/feeds/post_screen.dart';
import 'package:social_app/ui/modules/notifications_screen.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);

        return Scaffold(
          appBar: screenAppBar(context),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNavigationBar(index);
            },
            items: cubit.bottomItems,
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }

  AppBar screenAppBar(context) => AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              onAddBoxTapped(context);
            },
            icon: Icon(MaterialIcons.add_box),
            color: Theme.of(context).focusColor,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(MaterialIcons.favorite_border),
            color: Theme.of(context).focusColor,
          ),
          IconButton(
            onPressed: () {
              navigateTo(context, NotificationsScreen());
            },
            icon: Icon(MaterialIcons.notifications),
            color: Theme.of(context).focusColor,
          ),
        ],
      );

  void onAddBoxTapped(context) {
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
                'Post',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Spacer(),
              SizedBox(
                width: 8,
              ),
              Icon(MaterialIcons.post_add, color: Theme.of(context).focusColor),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: '2',
          child: Expanded(
            child: Row(
              children: [
                Text(
                  'Story',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                Icon(MaterialCommunityIcons.plus_circle_outline,
                    color: Theme.of(context).focusColor),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: '3',
          child: Expanded(
            child: Row(
              children: [
                Text(
                  'Reel',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                Icon(MaterialIcons.live_tv,
                    color: Theme.of(context).focusColor),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: '4',
          child: Expanded(
            child: Row(
              children: [
                Text(
                  'Live',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Spacer(),
                Icon(Fontisto.livestream, color: Theme.of(context).focusColor),
              ],
            ),
          ),
        ),
      ],
      elevation: 8.0,
    ).then<void>((String? itemSelected) {
      if (itemSelected == null) return;

      if (itemSelected == "1") {
        navigateTo(context, PostScreen());
      } else if (itemSelected == "2") {
        //code here
      } else {
        //code here
      }
    });
  }
}
