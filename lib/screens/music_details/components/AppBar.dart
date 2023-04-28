import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

AppBar appBarr(String trackID, Map music) {
  final box = GetStorage();
  List read = box.read('bookmark') ?? [];
  final isAdded = false.obs;
  if (read.any((element) => element.toString() == music.toString())) {
    isAdded.value = true;
  }
  //box.erase();
  debugPrint('$read');
  debugPrint('$music');
  return AppBar(
    title: const Text('Track Details'),
    actions: [
      Obx(() => isAdded.value
          ? IconButton(
              onPressed: () async {
                read.removeWhere((element) => element.toString() == music.toString());
                await box.write('bookmark', read);
                isAdded.value = false;
              },
              icon: const Icon(Icons.bookmark_added_rounded))
          : IconButton(
              onPressed: () async {
                read.add(music);
                await box.write('bookmark', read);
                isAdded.value = true;
              },
              icon: const Icon(Icons.bookmark_add_rounded)))
    ],
  );
}


