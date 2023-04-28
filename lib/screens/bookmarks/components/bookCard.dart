import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musixmatch/screens/music_details/music_details.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    super.key,
    required this.track,
  });

  final Map track;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.to(() => MusicDetails(trackID: track['trackID']));
      },
      child: Card(
        elevation: 10,
        child: ListTile(
          title: Text(track['track_name']),
          subtitle: Text(track['album_name']),
          leading: const Icon(Icons.library_music),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(track['artist_name']),
            ],
          ),
        ),
      ),
    );
  }
}