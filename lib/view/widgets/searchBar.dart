import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  SearchBar({required this.title, required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      width: width,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.white30,
      ),
      child: TextField(
        decoration: InputDecoration(
          // ignore: unrelated_type_equality_checks
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              color: Colors.black,
            ),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.search,
              size: 16,
              color: Color(0xFFB6B7B7),
            ),
          ),
          hintText: title,
          hintStyle: const TextStyle(
            color: Color(0xFFB6B7B7),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
