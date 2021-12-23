import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:social_app/cubit/social_cubit.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: screenAppBar(),
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
  AppBar screenAppBar()=>AppBar(
    title: Text(
      'Instagram',
      style: TextStyle(
        fontWeight: FontWeight.w900,
      ),
    ),
    actions: [
      IconButton(onPressed: () {
      }, icon: Icon(MaterialIcons.add_box)),
      IconButton(onPressed: () {
      }, icon: Icon(MaterialIcons.favorite_border)),
      IconButton(onPressed: () {
      }, icon: Icon(CupertinoIcons.chat_bubble)),
    ],
  );
}
