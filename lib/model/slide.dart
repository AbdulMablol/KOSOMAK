import 'package:flutter/material.dart';
class Slide {
  final String imageUrl;
  final String title;

  Slide({
    @required this.imageUrl,
    @required this.title,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/images/baby-sleeping.png',
    title: 'Welcome to Infant Visualization System!',
  ),
  Slide(
    imageUrl: 'assets/images/mom-baby.png',
    title: 'Never leave your baby alone!',
  ),
];