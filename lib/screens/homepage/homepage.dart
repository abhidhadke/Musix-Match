import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musixmatch/network/apiResponse.dart';
import 'components/appBar.dart';
import 'components/track_card.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ApiResponse getApi = ApiResponse();
  final isLoading = true.obs;
  final noInternet = false.obs;
  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }

  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      debugPrint(result.name);
      if (result.name == 'none') {
        noInternet.value = true;
        debugPrint('No internet');
      } else {
        noInternet.value = false;
        _setData();
      }
    });
  }



  _setData() async {
    var call = await getApi.getTracks();
    if (call == 1) {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build homepage');
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => noInternet.value
                ? const Center(
                    child: Text(
                      'No Internet',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : Obx(() => isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: getApi.tracks.length,
                        itemBuilder: (context, index) {
                          Map track = getApi.tracks[index];
                          return TrackCard(track: track);
                        }))),
          ),
        ],
      ),
    );
  }
}
