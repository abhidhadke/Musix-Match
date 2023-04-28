import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:musixmatch/screens/bookmarks/components/bookCard.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({Key? key}) : super(key: key);

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  List bookmarks = [];

  @override
  void initState() {
    final box = GetStorage();
    super.initState();
    bookmarks = box.read('bookmark') ?? [];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookMarks'),
      ),
      body: (bookmarks.isEmpty) ? const Center(child: Text('No Bookmarks', style: TextStyle(fontSize: 20),),) : ListView.builder(
          itemCount: bookmarks.length,
          itemBuilder: (context, index){
            Map track = bookmarks[index];
            return BookCard(track: track);
      }),
    );
  }
}
