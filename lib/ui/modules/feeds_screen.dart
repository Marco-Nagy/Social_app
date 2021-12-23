import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_app/shared/Components.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return screenBody(context);
  }

  Widget screenBody(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            buildStories(context),
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
                          ],),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://preview.free3d.com/img/2016/09/2212599006184343186/9fh43hvi-900.jpg"),
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

  onAddStoryTapped() {}

  buildStoryItem(context) {
    return InkWell(
      onTap: () => onAddStoryTapped(),
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
                    ],),
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
}
