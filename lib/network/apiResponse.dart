import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';


class ApiResponse{

  String api = '03844c8877544a6045bab93255a7f0b2';
  String title = '';
  String author = '';
  String album = '';
  String trackId = '';
  List<Map> tracks = [];
  String lyrics = '';

  Future<int> getTracks() async {
    try{
      String uri = 'api.musixmatch.com';
      var musicUrl = Uri.https(uri,
          '/ws/1.1/chart.tracks.get',
          {
            'apikey' : api
          }
      );
      var res = await http.get(musicUrl);
      Map data = jsonDecode(res.body);
      Map message = data['message'];
      Map body = message['body'];
      List trackList = body['track_list'];
      for(int i = 0; i < trackList.length; i++){
        Map trackMain = trackList[i];
        Map track = trackMain['track'];
        trackId = track['track_id'].toString();
        title = track['track_name'];
        album = track['album_name'];
        author = track['artist_name'];
        tracks.add({
          'trackId' : trackId,
          'title' : title,
          'album' : album,
          'author' : author
        });
      }

    }
    catch(e){
      debugPrint('$e');
      return Future.value(0);
    }
    return Future.value(1);
  }

  Future<dynamic> getTrackDetails(String trackID) async {
    Map trackDetails;
    try{
      String uri = 'api.musixmatch.com';
      var musicUrl = Uri.https(uri,
          '/ws/1.1/track.get',
          {
            'track_id' : trackID,
            'apikey' : api
          }
      );
      var res = await http.get(musicUrl);
      Map data = jsonDecode(res.body);
      Map message = data['message'];
      Map body = message['body'];
      Map track = body['track'];
      trackDetails = {
        'track_name' : track['track_name'],
        'album_name' : track['album_name'],
        'artist_name' : track['artist_name'],
        'explicit' : track['explicit'],
        'track_rating' : track['track_rating'],
        'trackID' : trackID
      };
    }
    catch(e){
      debugPrint('$e');
      return Future.value(null);
    }
    return Future.value(trackDetails);
  }

  Future<int> getTrackLyrics(String trackID) async {
    try{
      String uri = 'api.musixmatch.com';
      var musicUrl = Uri.https(uri,
          '/ws/1.1/track.lyrics.get',
          {
            'track_id' : trackID,
            'apikey' : api
          }
      );
      var res = await http.get(musicUrl);
      Map data = jsonDecode(res.body);
      Map message = data['message'];
      Map body = message['body'];
      Map lyric = body['lyrics'];
      lyrics = lyric['lyrics_body'];
    }
    catch(e, s){
      debugPrint('$e, $s');
      return Future.value(0);
    }
    return Future.value(1);
  }
}