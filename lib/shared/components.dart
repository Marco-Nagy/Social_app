import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 30,
  required String text,
  Function()? function,
  double? fontSize,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ),
      ),
    );

Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  TextInputAction inputAction = TextInputAction.next,
  required FormFieldValidator validator,
  required String label,
  required IconData prefixIcon,
  Widget? suffixIcon,
  ValueChanged? onChange,
  FormFieldSetter<String>? onSaved,
  Function? onFieldSubmitted,
  bool obscureText = false,
  required BuildContext context,
}) =>
    TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: type,
      textInputAction: inputAction,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        filled: true,
        fillColor: Theme.of(context).canvasColor,
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onSaved: onSaved,
      onChanged: onChange,
      style:Theme.of(context).textTheme.bodyText2 ,
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => widget),
    );

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

void showToast({
  required String message,
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

Widget myDivider() => Divider(
      color: Colors.white,
      thickness: 0.3,
      height: 8,
    );

PreferredSizeWidget defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          CupertinoIcons.arrow_uturn_left,
          color: Theme.of(context).focusColor,
        ),
      ),
      title: Text(
        title!,
        style: TextStyle(
          fontFamily: 'jannah',
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
      titleSpacing: 2.0,
      actions: actions,
    );

Widget defaultTextButton({
  required String text,
  required context,
  required VoidCallback? onPressed,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      ),
    );
