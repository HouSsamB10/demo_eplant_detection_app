import 'package:flutter/material.dart';

import '../models/product.dart';

List categoryImage = [
  {
    "image": "assets/images/category.jpg",
  },
  {
    "image": "assets/images/category.jpg",
  },
  {
    "image": "assets/images/category.jpg",
  },
  {
    "image": "assets/images/category.jpg",
  },
];

List<Widget> icons = const [
  Icon(Icons.star, size: 18, color: Colors.orange),
  SizedBox(
    width: 2,
  ),
];

class User {
  String name, profession;

  User({required this.name, required this.profession});
}

class Profile {
  User user;

  Profile({required this.user});
}

class Product2 {
  String title;
  double price;
  String image;
  String desc;

  Product2(
      {required this.title,
      required this.price,
      required this.image,
      required this.desc});
}

class ProfileProvider {
  static Profile profile() {
    return Profile(
      user: User(name: 'Hou Ssam', profession: 'Software engineer'),
    );
  }

  // photos
  static List<String> photos() {
    return List.generate(1, (index) {
      return 'assets/images/category.jpg';
    });
  }
  //videos

  static List<String> videos() {
    return List.generate(10, (index) {
      return 'assets/images/category.jpg';
    });
  }

  // posts
  static List<String> posts() {
    return List.generate(10, (index) {
      return 'assets/images/category.jpg';
    });
  }

  // friends
  static List<String> friends() {
    return List.generate(10, (index) {
      return 'assets/images/category.jpg';
    });
  }
}

List balanceCards = [
  {
    "image": "assets/images/pic.jpg",
  },
  {
    "image": "assets/images/pic.jpg",
  },
  {
    "image": "assets/images/pic.jpg",
  },
  {
    "image": "assets/images/pic.jpg",
  },
  {
    "image": "assets/images/pic.jpg",
  },
  {
    "image": "assets/images/pic.jpg",
  },
];

List<Product2> product = [
  Product2(
    image: 'AfricanDaisy.jpg',
    title: 'AfricanDaisy',
    price: 700,
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Product2(
    image: 'roses.jpg',
    title: 'roses',
    price: 400,
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Product2(
    image: '1.png',
    title: ' Plant',
    price: 800,
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Product2(
    image: '2.png',
    title: 'Potted Plant',
    price: 24.99,
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Product2(
    image: '4.png',
    title: 'Ipsum Plant',
    price: 30.99,
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  Product2(
    image: '3.png',
    title: 'Lorem Plant',
    price: 19.99,
    desc:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
];
