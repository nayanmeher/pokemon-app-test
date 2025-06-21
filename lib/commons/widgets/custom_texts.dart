import 'package:flutter/material.dart';


class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),);
  }
}

class BodyText extends StatelessWidget {
  const BodyText({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(name , style: TextStyle(fontSize: 15),);
  }
}