import 'package:social_app/data/my_shared.dart';
import 'package:social_app/shared/Components.dart';
import 'package:social_app/ui/modules/authentecation/login_screen.dart';

void signOut(context){
  MyShared.clearData('token').then((value) {
    if(value){
      navigateAndFinish(context, LoginScreen());
    }
  });
  String token = '';
  String uId = '';
}