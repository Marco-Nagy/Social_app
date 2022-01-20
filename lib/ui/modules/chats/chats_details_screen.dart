import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_image/network.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/ui/models/user_model.dart';

class ChatsDetailsScreen extends StatelessWidget {
  UserData userData;

  ChatsDetailsScreen(this.userData);

  @override
  Widget build(BuildContext context) {
    SocialCubit.get(context).getUsers();
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return screenBody(context);
      },
    );
  }

  Widget screenBody(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 26,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xff833ab4),
                            Color(0xfffd1d1d),
                            Color(0xfffcb045),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 23,
                    backgroundImage:
                    NetworkImageWithRetry(userData.image.toString()),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  userData.name.toString(),
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

        ),
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(15),
                      bottomEnd: Radius.circular(15),
                      topEnd: Radius.circular(15),
                    ),
                    color: Theme.of(context).highlightColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text('Hello world'),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(15),
                      bottomStart: Radius.circular(15),
                      topEnd: Radius.circular(15),
                    ),
                    color: Theme.of(context).focusColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text('Hello world',
                  style: Theme.of(context).textTheme.bodyText2,),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type your message here ...',
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                    Container(

                      height: 5.h,
                      child: MaterialButton(onPressed: () {
                      },
                      child: Icon(FontAwesome.send,size: 28,color: Theme.of(context).primaryColor,),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

}
