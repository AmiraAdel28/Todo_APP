import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showMessage(
BuildContext context,String message,String actionName,VoidCallback actionCallback
){
showDialog(context: context, builder: (c){
  return AlertDialog(
    content: Text(message),
    actions: [TextButton(onPressed: actionCallback, child: Text(actionName))],

  );
});
}
void showloading(
    BuildContext context,String text,
    ){
  showDialog(context: context, builder: (c){
    return AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 10,),
          Text(text),
        ],
      ),
    );
  });
}
void hideBottomSheet(BuildContext context){
  Navigator.pop(context);
}