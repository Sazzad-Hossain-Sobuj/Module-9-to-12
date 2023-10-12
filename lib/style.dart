import 'package:flutter/material.dart';

InputDecoration AppInputDecration (label){
  return InputDecoration(
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(),
      // labelText: 'List Item'
      labelText: label
  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
      padding: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )

  );
}
SizedBox sizebox50(child){
  return SizedBox(
    height: 60,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: child,
    ),
  );
}