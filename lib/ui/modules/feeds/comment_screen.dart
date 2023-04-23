import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:social_app/cubit/social_cubit.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments',
        style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 23,
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
                          radius:20,
                          backgroundImage: NetworkImageWithRetry(
                              SocialCubit.get(context).userData.image.toString()),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: SocialCubit.get(context).userData.name.toString(),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                TextSpan(
                                  text: ' ',
                                ),
                                TextSpan(
                                  text: "newPost.text newPost.textnewPost.textnewPost.textnewPost.textnewPost.text",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Text('2h',style: Theme.of(context).textTheme.subtitle1,)
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                          SocialCubit.get(context).userData.image.toString()),
                    ),
                  ],
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: TextFormField(
                      controller: null,
                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Add Comment ...',
                        hintStyle: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
