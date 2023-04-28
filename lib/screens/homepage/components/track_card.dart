import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musixmatch/screens/music_details/music_details.dart';

class TrackCard extends StatelessWidget {
  const TrackCard({
    super.key,
    required this.track,
  });

  final Map track;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
       await Get.to(() => MusicDetails(trackID: track['trackId']));
      },
      child: Card(
        elevation: 10,
        child: ListTile(
          title: Text(track['title']),
          subtitle: Text(track['album']),
          leading: const Icon(Icons.library_music),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(track['author']),
            ],
          ),
        ),
      ),
    );
  }
}