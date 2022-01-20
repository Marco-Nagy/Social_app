import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image/network.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/components.dart';
import 'package:social_app/ui/models/user_model.dart';
import 'package:social_app/ui/modules/chats/chats_details_screen.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SocialCubit.get(context).getUsers();
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return screenBody(context);
      },
    );;
  }
  Widget screenBody(BuildContext context) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: ListView(
      children: [
        ConditionalBuilder(
          fallback: ( context) => Center(child: CircularProgressIndicator()),
          condition: SocialCubit.get(context).posts.length > 0,
          builder: ( context) =>ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => buildChatItem(SocialCubit.get(context).users[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: SocialCubit.get(context).users.length,
          ),
        ),
      ],
    ),
  );
  Widget buildChatItem(UserData user,context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          navigateTo(context, ChatsDetailsScreen(user));
        },
        child: Row(
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
                  backgroundImage: NetworkImageWithRetry(
                      user.image.toString()),
                ),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                user.name.toString(),
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
