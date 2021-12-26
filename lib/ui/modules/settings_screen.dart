import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
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
                        image: NetworkImage(
                          'https://image.freepik.com/free-vector/modern-merry-christmas-card-with-claus_1361-2803.jpg',
                        ),
                      ),
                    ),
                  ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                InkWell(
                  onTap: () => {},
                  child: Stack(
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
                                color: Theme.of(context).cardColor,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                "https://preview.free3d.com/img/2016/09/2212599006184343186/9fh43hvi-900.jpg"),
                          ),
                        ],
                      ),

                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.camera_enhance_rounded,size: 17,),
                        radius: 18,
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
            'Marco Nagy',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'bio.... ',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
