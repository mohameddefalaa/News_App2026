import 'package:flutter/material.dart';

class CustomeTextFiled extends StatefulWidget {
  CustomeTextFiled(
    this.isbassword, {
    super.key,
    required this.haintText,
    required this.controller,
  });
  final String haintText;
  bool isbassword = false;
  TextEditingController controller;

  @override
  State<CustomeTextFiled> createState() => _CustomeTextFiledState();
}

class _CustomeTextFiledState extends State<CustomeTextFiled> {
  bool ishide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This Filed Musn't be Empty ";
        }
      },
      controller: widget.controller,
      cursorColor: Colors.black,
      obscureText: widget.isbassword & ishide ? true : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        suffixIcon: widget.isbassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    ishide = !ishide;
                  });
                },
                icon: !ishide
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              )
            : SizedBox(),
        hintText: widget.haintText,
      ),
    );
  }
}
