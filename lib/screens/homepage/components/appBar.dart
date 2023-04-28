import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musixmatch/screens/bookmarks/bookmarks.dart';

AppBar appBar(){
  return AppBar(
    title: const Text('Trending'),
    centerTitle: true,
    actions: [
      IconButton(
      onPressed: () { 
        Get.to(() => const BookMarks());
      },
      icon: const Icon(Icons.bookmark_border_rounded),

    )
    ],
  );
}