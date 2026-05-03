import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suggestion extends StatefulWidget {
  Suggestion({Key? key}) : super(key: key);

  @override
  _SuggestionState createState() => _SuggestionState();
}

class _SuggestionState extends State<Suggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text("推荐", style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
