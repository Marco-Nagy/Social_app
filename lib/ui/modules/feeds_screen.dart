import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:flutter_image/network.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:social_app/cubit/social_cubit.dart';

import 'package:social_app/shared/components.dart';
import 'package:social_app/ui/models/post_model.dart';
import 'package:social_app/ui/modules/story_screen.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SocialCubit.get(context).getPosts();
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return screenBody(context);
      },
    );
  }

  Widget screenBody(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            buildStories(context),
            myDivider(),
            ConditionalBuilder(
              fallback: ( context) => Center(child: CircularProgressIndicator()),
              condition: SocialCubit.get(context).posts.isNotEmpty ,
              builder: ( context) =>ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildPostItem(SocialCubit.get(context).posts[index],context,index),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: SocialCubit.get(context).posts.length,
              ),
            ),
          ],
        ),
      );

  buildStories(context) {
    return Row(
      children: [
        InkWell(
          onTap: () => onAddStoryTapped(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 36,
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
                    radius: 35,
                    backgroundImage: NetworkImageWithRetry(
                        SocialCubit.get(context).userData.image.toString()),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 13,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.add),
                    radius: 11.8,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Your Story',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 110,
            child: ListView.separated(
              itemBuilder: (context, index) => buildStoryItem(context),
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  buildStoryItem(context) {
    return InkWell(
      onTap: () => onShowStoryTapped(context),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 36,
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
                radius: 33,
                backgroundImage: NetworkImage(
                    "https://preview.free3d.com/img/2016/09/2212599006184343186/9fh43hvi-900.jpg"),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Marco',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }

  buildPostItem(NewPost newPost,context,index) {
    return Card(
      color: Theme.of(context).backgroundColor,
      elevation: 15,
      shadowColor: Theme.of(context).primaryColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
                                  newPost.image.toString()),
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
                          newPost.name.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          newPost.dateTime.toString(),
                          style: Theme.of(context).textTheme.bodyText2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Feather.more_horizontal,
                      color: Theme.of(context).focusColor,
                    ),
                  ),
                ],
              ),
            ),
            if(newPost.postImage!= '')
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 5,
              shadowColor: Colors.white,
              child: Image(
                height: 35.h,
                width: double.infinity,
                fit: BoxFit.fill,
                image: NetworkImage(
                  newPost.postImage.toString(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //SocialCubit.get(context).onLikePressed(SocialCubit.get(context).postsId[index]);
                      SocialCubit.get(context).likePosts(SocialCubit.get(context).postsId[index]);
                    },
                    icon: SocialCubit.get(context).like
                        ? Icon(MaterialIcons.favorite,
                      color: Colors.redAccent,
                    ):Icon(
                      MaterialIcons.favorite_border,
                      color: Colors.redAccent,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.chat_bubble,
                      color: Colors.blue.shade300,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Feather.send,
                      color: Colors.grey,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Feather.bookmark,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '${SocialCubit.get(context).likes[index]} Likes',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: newPost.name.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: newPost.text,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onAddStoryTapped() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    print(image!.path);
    // // Capture a photo
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // // Pick a video
    // final XFile? xImage = await _picker.pickVideo(source: ImageSource.gallery);
    // // Capture a video
    // final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    // // Pick multiple images
    // final List<XFile>? images = await _picker.pickMultiImage();
  }

  onShowStoryTapped(context) {
    navigateTo(context, StoryScreen());
  }
}
