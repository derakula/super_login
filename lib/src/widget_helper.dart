import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Size getWidgetSize(GlobalKey key) {
  final RenderBox renderBox = key.currentContext?.findRenderObject();
  return renderBox?.size;
}

AwesomeDialog showErrorDialog(BuildContext context, String message){
  return AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.TOPSLIDE,
            body: Center(child: Text(message),),
            btnCancelOnPress: () {},
            btnCancelText: 'OK'
            )..show();
}

AwesomeDialog showSuccessDialog(BuildContext context, String message){
  return AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.TOPSLIDE,
            body: Center(child: Text(message),),
            btnOkOnPress: () {},
            btnOkText: 'OK'
            )..show();
}