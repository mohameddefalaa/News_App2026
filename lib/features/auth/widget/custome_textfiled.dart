import 'package:flutter/material.dart';

class CustomeTextFiled extends StatefulWidget {
  const CustomeTextFiled({
    super.key,
    required this.haintText,
    required this.controller,
    this.confirmPassword,
    this.isbassword = false,
  });
  final String haintText;
  final bool isbassword;
  final TextEditingController controller;
  final String? confirmPassword;

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
        } else if (widget.confirmPassword != null &&
            widget.confirmPassword != value) {
          return "Passwords do not match";
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
