import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musixmatch/network/apiResponse.dart';
import 'components/AppBar.dart';
import 'components/musicCard.dart';

class MusicDetails extends StatefulWidget {
  const MusicDetails({Key? key, required this.trackID}) : super(key: key);
  final String trackID;

  @override
  State<MusicDetails> createState() => _MusicDetailsState();
}

class _MusicDetailsState extends State<MusicDetails> {
  final ApiResponse _apiResponse = ApiResponse();
  final isLoading = true.obs;
  Map call = {};

  @override
  void initState() {
    super.initState();
    _setData();
  }

  _setData() async {
    call = await _apiResponse.getTrackDetails(widget.trackID);
    var call2 = await _apiResponse.getTrackLyrics(widget.trackID);

    if (call.isEmpty) {
    } else {
      isLoading.value = false;
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.trackID);
    return Scaffold(
      appBar: appBarr(widget.trackID, call),
      body: Obx(() => isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MusicDetail(
                      value: call['track_name'],
                      label: 'Name',
                      isBool: false,
                    ),
                    MusicDetail(
                      value: call['artist_name'],
                      label: 'Artist',
                      isBool: false,
                    ),
                    MusicDetail(
                      value: call['album_name'],
                      label: 'Album Name',
                      isBool: false,
                    ),
                    MusicDetail(
                      value: call['explicit'].toString(),
                      label: 'Explicit',
                      isBool: true,
                    ),
                    MusicDetail(
                        value: call['track_rating'].toString(),
                        label: 'Rating',
                        isBool: false),
                    MusicDetail(
                        value: _apiResponse.lyrics,
                        label: 'Lyrics',
                        isBool: false)
                  ]
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: e,
                          ))
                      .toList(),
                ),
              ),
            )),
    );
  }
}

