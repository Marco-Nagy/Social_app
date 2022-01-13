import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_image/network.dart';
import 'package:social_app/cubit/social_cubit.dart';
import 'package:social_app/shared/components.dart';

class PostScreen extends StatelessWidget {
  PostScreen({Key? key}) : super(key: key);
  var postController = TextEditingController();
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var postImage = SocialCubit
            .get(context)
            .postImage;
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              defaultTextButton(
                text: 'POST',
                context: context,
                onPressed: () {
                  if (postImage== null) {
                    SocialCubit.get(context).createNewPost(
                      dateTime: now.toString(),
                      text: postController.text,
                    );
                  } else {
                    SocialCubit.get(context).uploadPostImage(
                      dateTime: now.toString(),
                      text: postController.text,
                    );
                  }
                },
              ),

              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if(state is SocialCreatePostLoadingState)
                SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
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
                                    SocialCubit.get(context)
                                        .userData
                                        .image
                                        .toString()),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Marco Nagy',
                            style: Theme.of(context).textTheme.bodyText1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: postController,
                    decoration: InputDecoration(
                      hintText: 'What is on your mind,...',
                      hintStyle: Theme.of(context).textTheme.bodyText2,
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if(SocialCubit.get(context).postImage != null)
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(postImage!),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            SocialCubit.get(context).removePostImage();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.close,
                              size: 17,
                            ),
                            radius: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          SocialCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Ionicons.image,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'add Photo',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '# tags',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
