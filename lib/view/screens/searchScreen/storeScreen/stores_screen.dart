import 'package:e_plant1/view/screens/searchScreen/storeScreen/stores_list_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../widgets/searchBar.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child:
                SearchBar(title: 'search', width: double.infinity, height: 40),
          ),
          Flexible(
            flex: 1,
            child: MyListStores(),
          ),
        ],
      ),
    );
  }
}
