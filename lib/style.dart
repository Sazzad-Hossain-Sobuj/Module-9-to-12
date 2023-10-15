import 'package:flutter/material.dart';

InputDecoration TodoInputDecration(label) {
  return InputDecoration(
      border: OutlineInputBorder(),
      hintText: label
  );
}

ButtonStyle AddEditButtonStyle() {
  return ElevatedButton.styleFrom(
      shadowColor: Colors.pinkAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ));
}

InputDecoration TodoEditInputDecoration(){
  return InputDecoration(
    border: OutlineInputBorder(),
  );
}
