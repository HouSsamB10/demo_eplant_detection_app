import 'package:flutter/material.dart';

import '../widgets/searchble_screen.dart';

class ButtonSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showSearch(context: context, delegate: SearchBar());
      },
      icon: const Icon(Icons.search),
    );
  }
}
