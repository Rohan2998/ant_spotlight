import 'dart:async';
import 'dart:convert';

import 'package:better_player/better_player.dart';
import 'package:better_video_player/constants/constant_url.dart';
import 'package:better_video_player/models/spotlight_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
        title: "Better",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SpotLight> futureSpotLight;
  List<SpotLight> spotlightFeed = new List<SpotLight>();

  BetterPlayerListVideoPlayerController controller;

  DateTime currentBackPressTime;

  int _selectedIndex = 1;

  bool isExpanded = false;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "press again to exit the app");
      return Future.value(false);
    }
    dispose();
    return Future.value(true);
//    exit(0);
  }

  void getSpotLightFeed() async {
    await http.post(
        "http://appstractinnovations.com/TaandavFilmsApp/AdsStreamingVideos/TestGetAdsVideos.php",
        body: {'txtCustomerId': '5'}).then((value) {
      SpotLightList spotLightList =
          SpotLightList.fromJson(jsonDecode(value.body));
      spotlightFeed = spotLightList.spotLightFeedList;
    });
  }

  Widget createSpotLight() {
    print("Aspect Ratio ${MediaQuery.of(context).size.aspectRatio * 0.5}");
    return Container(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        itemCount: spotlightFeed.length,
        itemBuilder: (context, index) {
          bool isLiked = false;
          return SafeArea(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: BetterPlayerListVideoPlayer(
                  BetterPlayerDataSource(
                    BetterPlayerDataSourceType.network,
                    ConstantUrl.spotLightVideoBaseUrl +
                        spotlightFeed[index].videoPath,
                  ),
                  key: Key(spotlightFeed[index].hashCode.toString()),
                  playFraction: 0.8,
                  betterPlayerListVideoPlayerController: controller,
                  configuration: BetterPlayerConfiguration(
                      aspectRatio: 9 / 15.5,
                      autoPlay: true,
                      autoDispose: true,
                      handleLifecycle: true,
                      placeholder: Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      placeholderOnTop: true,
                      fit: BoxFit.cover,
                      looping: true,
                      controlsConfiguration: BetterPlayerControlsConfiguration(
                          enableSkips: false,
                          enableOverflowMenu: false,
                          enableFullscreen: false,
                          controlBarColor: Colors.transparent,
                          playerTheme: BetterPlayerTheme.custom,
                          enableProgressBar: true,
                          enablePlayPause: true,
                          customControlsBuilder: (betterPlayerController) {
                            return Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Positioned(
                                  bottom: MediaQuery.of(context)
                                              .padding
                                              .bottom >=
                                          10
                                      ? MediaQuery.of(context).padding.bottom
                                      : 10,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: MediaQuery.of(
                                                                  context)
                                                              .padding
                                                              .horizontal >=
                                                          5.0
                                                      ? MediaQuery.of(context)
                                                          .padding
                                                          .horizontal
                                                      : 5.0),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.90,
                                                color: Colors.transparent,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      spotlightFeed[index]
                                                          .customerName,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor *
                                                            18,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: MediaQuery.of(
                                                                      context)
                                                                  .padding
                                                                  .vertical <
                                                              5.0
                                                          ? 5.0
                                                          : MediaQuery.of(
                                                                  context)
                                                              .padding
                                                              .vertical,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          spotlightFeed[index]
                                                                  .hasExpanded =
                                                              !spotlightFeed[
                                                                      index]
                                                                  .hasExpanded;
                                                        });
                                                      },
                                                      child: AnimatedCrossFade(
                                                        duration: Duration(
                                                            milliseconds: 400),
                                                        firstChild: Container(
                                                          child: Text(
                                                            "${spotlightFeed[index].spotlightDescription.substring(0, spotlightFeed[index].spotlightDescription.length >= 50 ? 50 : 10)}...more",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .textScaleFactor *
                                                                    16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic),
                                                          ),
                                                        ),
                                                        secondChild: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.08,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Text(
                                                              spotlightFeed[
                                                                      index]
                                                                  .spotlightDescription,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      MediaQuery.of(context)
                                                                              .textScaleFactor *
                                                                          16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic),
                                                            ),
                                                          ),
                                                        ),
                                                        crossFadeState:
                                                            spotlightFeed[index]
                                                                    .hasExpanded
                                                                ? CrossFadeState
                                                                    .showSecond
                                                                : CrossFadeState
                                                                    .showFirst,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: MediaQuery.of(
                                                                  context)
                                                              .padding
                                                              .vertical >=
                                                          8.0
                                                      ? MediaQuery.of(context)
                                                          .padding
                                                          .vertical
                                                      : 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isLiked = !isLiked;
                                                      });
                                                    },
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      child: Icon(
                                                        isLiked
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor *
                                                            40,
                                                        color: isLiked
                                                            ? Colors.red
                                                            : Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      child: Icon(
                                                        Icons.comment,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor *
                                                            40,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onTap: () => debugPrint(
                                                        "pressed comments"),
                                                  ),
                                                  GestureDetector(
                                                    child: Container(
                                                      color: Colors.transparent,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      child: Icon(
                                                        Icons.send,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .textScaleFactor *
                                                            40,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    onTap: () => debugPrint(
                                                        "pressed share"),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          })),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//  BetterPlayerController betterPlayerController;

  @override
  void initState() {
    super.initState();

    getSpotLightFeed();

    controller = BetterPlayerListVideoPlayerController();
  }

  @override
  void dispose() {
    super.dispose();
    spotlightFeed.clear();
    print("dispose called");

    controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("SpotLight"),
        centerTitle: true,
      ),
      body: WillPopScope(
        child: _selectedIndex == 0 ? Text("Hello") : createSpotLight(),
        onWillPop: onWillPop,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.videocam), label: "SpotLight")
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
