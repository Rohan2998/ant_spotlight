import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  BetterPlayerListVideoPlayerController controller;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      dispose();
    }
  }

  DateTime currentBackPressTime;

  int _selectedIndex = 1;

  List dataSourceList = List();

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

  Widget createSpotLight() {
    print("Aspect Ratio ${MediaQuery.of(context).size.aspectRatio * 0.5}");
    return Container(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        itemCount: dataSourceList.length,
        itemBuilder: (context, index) {
          String description =
              "loren ipsum cello video delta tesitnf alpha echjo kswed fakfk dks fdeowkfoewfomeofm oefoewfeofefeff,eofofeofofmeoflmfolmomfmfolwemfps,vps, ,essssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdrpg";
          bool isLiked = false;
          return SafeArea(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
//                child: BetterPlayer(
//                  controller: BetterPlayerController(
//                    BetterPlayerConfiguration(
//                        aspectRatio: 9 / 15.5,
//                        autoPlay: true,
//                        autoDispose: true,
//                        handleLifecycle: true,
////                        overlay: SafeArea(
////                          child: Container(
////                            child: Padding(
////                              padding: EdgeInsets.symmetric(
////                                  horizontal: MediaQuery.of(context)
////                                      .padding
////                                      .horizontal),
////                              child: Stack(children: [
////                                Column(
////                                  mainAxisAlignment: MainAxisAlignment.start,
////                                  children: [
////                                    SizedBox(
////                                      height:
////                                          MediaQuery.of(context).size.height *
////                                              0.55,
////                                    ),
////                                    Padding(
////                                      padding: EdgeInsets.symmetric(
////                                          horizontal: MediaQuery.of(context)
////                                                      .padding
////                                                      .horizontal <=
////                                                  5.0
////                                              ? 5.0
////                                              : MediaQuery.of(context)
////                                                  .padding
////                                                  .horizontal),
////                                      child: Row(
////                                        mainAxisAlignment:
////                                            MainAxisAlignment.spaceBetween,
////                                        children: [
////                                          GestureDetector(
////                                            onTap: () {
////                                              setState(() {
////                                                print("pressed");
//////                                            if (isExpanded) {
//////                                              isExpanded = false;
//////                                              print("pressed");
//////                                            } else {
//////                                              isExpanded = true;
//////                                              print("pressed");
//////                                            }
////                                              });
////                                            },
////                                            child: Container(
////                                              width: MediaQuery.of(context)
////                                                      .size
////                                                      .width *
////                                                  0.85,
////                                              color: Colors.transparent,
////                                              child: Column(
////                                                mainAxisAlignment:
////                                                    MainAxisAlignment.start,
////                                                crossAxisAlignment:
////                                                    CrossAxisAlignment.start,
////                                                children: [
////                                                  Text(
////                                                    "Rohan Lawande",
////                                                    style: TextStyle(
////                                                      color: Colors.white,
////                                                      fontSize: MediaQuery.of(
////                                                                  context)
////                                                              .textScaleFactor *
////                                                          18,
////                                                      fontWeight:
////                                                          FontWeight.w500,
////                                                    ),
////                                                  ),
//////                                                !isExpanded
//////                                                    ? Text(
//////                                                        "${description.substring(0, 20)}...",
//////                                                        style: TextStyle(
//////                                                            color: Colors.white,
//////                                                            fontSize: MediaQuery.of(
//////                                                                        context)
//////                                                                    .textScaleFactor *
//////                                                                16,
//////                                                            fontWeight:
//////                                                                FontWeight.w300,
//////                                                            fontStyle: FontStyle
//////                                                                .italic),
//////                                                      )
//////                                                    :
////                                                  Text(
////                                                    description,
////                                                    style: TextStyle(
////                                                        color: Colors.white,
////                                                        fontSize: MediaQuery.of(
////                                                                    context)
////                                                                .textScaleFactor *
////                                                            16,
////                                                        fontWeight:
////                                                            FontWeight.w300,
////                                                        fontStyle:
////                                                            FontStyle.italic),
////                                                  ),
////                                                ],
////                                              ),
////                                            ),
////                                          ),
////                                          Column(
////                                            mainAxisAlignment:
////                                                MainAxisAlignment.spaceEvenly,
////                                            children: [
////                                              Padding(
////                                                padding: EdgeInsets.all(
////                                                    MediaQuery.of(context)
////                                                        .padding
////                                                        .vertical),
////                                                child: IconButton(
////                                                  icon: Icon(
////                                                    isLiked
////                                                        ? Icons.favorite
////                                                        : Icons.favorite_border,
////                                                    size: MediaQuery.of(context)
////                                                            .textScaleFactor *
////                                                        40,
////                                                    color: Colors.white,
////                                                  ),
////                                                  onPressed: () {
////                                                    isLiked
////                                                        ? isLiked = false
////                                                        : isLiked = true;
////                                                  },
////                                                ),
////                                              ),
////                                              Padding(
////                                                padding: EdgeInsets.all(
////                                                    MediaQuery.of(context)
////                                                        .padding
////                                                        .vertical),
////                                                child: IconButton(
////                                                  icon: Icon(
////                                                    Icons.comment_bank_outlined,
////                                                    size: MediaQuery.of(context)
////                                                            .textScaleFactor *
////                                                        40,
////                                                    color: Colors.white,
////                                                  ),
////                                                  onPressed: () =>
////                                                      debugPrint("pressed"),
////                                                ),
////                                              ),
////                                              Padding(
////                                                padding: EdgeInsets.all(
////                                                    MediaQuery.of(context)
////                                                        .padding
////                                                        .vertical),
////                                                child: IconButton(
////                                                  icon: Icon(
////                                                    Icons.send,
////                                                    size: MediaQuery.of(context)
////                                                            .textScaleFactor *
////                                                        40,
////                                                    color: Colors.white,
////                                                  ),
////                                                  onPressed: () =>
////                                                      debugPrint("pressed"),
////                                                ),
////                                              ),
////                                            ],
////                                          )
////                                        ],
////                                      ),
////                                    )
////                                  ],
////                                ),
////                              ]),
////                            ),
////                          ),
////                        ),
//
//                        fit: BoxFit.cover,
//                        controlsConfiguration:
//                            BetterPlayerControlsConfiguration(
//                                enableSkips: false,
//                                enableOverflowMenu: false,
//                                enableFullscreen: false,
//                                controlBarColor: Colors.transparent,
//                                playerTheme: BetterPlayerTheme.material,
//                                enableProgressBar: false,
//                                customControlsBuilder:
//                                    (betterPlayerController) {
//                                  return Container(
//                                    height: MediaQuery.of(context).size.height,
//                                    width: MediaQuery.of(context).size.width,
//                                    child: Column(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.center,
//                                      children: [
//                                        Row(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.spaceBetween,
//                                          children: [
//                                            GestureDetector(
//                                              onTap: () {
//                                                setState(() {
//                                                  print("pressed");
////                                            if (isExpanded) {
////                                              isExpanded = false;
////                                              print("pressed");
////                                            } else {
////                                              isExpanded = true;
////                                              print("pressed");
////                                            }
//                                                });
//                                              },
//                                              child: Container(
//                                                width: MediaQuery.of(context)
//                                                        .size
//                                                        .width *
//                                                    0.85,
//                                                color: Colors.transparent,
//                                                child: Column(
//                                                  mainAxisAlignment:
//                                                      MainAxisAlignment.start,
//                                                  crossAxisAlignment:
//                                                      CrossAxisAlignment.start,
//                                                  children: [
//                                                    Text(
//                                                      "Rohan Lawande",
//                                                      style: TextStyle(
//                                                        color: Colors.white,
//                                                        fontSize: MediaQuery.of(
//                                                                    context)
//                                                                .textScaleFactor *
//                                                            18,
//                                                        fontWeight:
//                                                            FontWeight.w500,
//                                                      ),
//                                                    ),
////                                                !isExpanded
////                                                    ? Text(
////                                                        "${description.substring(0, 20)}...",
////                                                        style: TextStyle(
////                                                            color: Colors.white,
////                                                            fontSize: MediaQuery.of(
////                                                                        context)
////                                                                    .textScaleFactor *
////                                                                16,
////                                                            fontWeight:
////                                                                FontWeight.w300,
////                                                            fontStyle: FontStyle
////                                                                .italic),
////                                                      )
////                                                    :
//                                                    Text(
//                                                      description,
//                                                      style: TextStyle(
//                                                          color: Colors.white,
//                                                          fontSize: MediaQuery.of(
//                                                                      context)
//                                                                  .textScaleFactor *
//                                                              16,
//                                                          fontWeight:
//                                                              FontWeight.w300,
//                                                          fontStyle:
//                                                              FontStyle.italic),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//                                            ),
//                                            Column(
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment.spaceEvenly,
//                                              children: [
//                                                Padding(
//                                                  padding: EdgeInsets.all(
//                                                      MediaQuery.of(context)
//                                                          .padding
//                                                          .vertical),
//                                                  child: IconButton(
//                                                    icon: Icon(
//                                                      isLiked
//                                                          ? Icons.favorite
//                                                          : Icons
//                                                              .favorite_border,
//                                                      size: MediaQuery.of(
//                                                                  context)
//                                                              .textScaleFactor *
//                                                          40,
//                                                      color: Colors.white,
//                                                    ),
//                                                    onPressed: () {
//                                                      isLiked
//                                                          ? isLiked = false
//                                                          : isLiked = true;
//                                                    },
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(
//                                                      MediaQuery.of(context)
//                                                          .padding
//                                                          .vertical),
//                                                  child: IconButton(
//                                                    icon: Icon(
//                                                      Icons
//                                                          .comment_bank_outlined,
//                                                      size: MediaQuery.of(
//                                                                  context)
//                                                              .textScaleFactor *
//                                                          40,
//                                                      color: Colors.white,
//                                                    ),
//                                                    onPressed: () =>
//                                                        debugPrint("pressed"),
//                                                  ),
//                                                ),
//                                                Padding(
//                                                  padding: EdgeInsets.all(
//                                                      MediaQuery.of(context)
//                                                          .padding
//                                                          .vertical),
//                                                  child: IconButton(
//                                                    icon: Icon(
//                                                      Icons.send,
//                                                      size: MediaQuery.of(
//                                                                  context)
//                                                              .textScaleFactor *
//                                                          40,
//                                                      color: Colors.white,
//                                                    ),
//                                                    onPressed: () =>
//                                                        debugPrint("pressed"),
//                                                  ),
//                                                ),
//                                              ],
//                                            )
//                                          ],
//                                        ),
//                                      ],
//                                    ),
//                                  );
//                                })),
//                    betterPlayerPlaylistConfiguration:
//                        BetterPlayerPlaylistConfiguration(
//                            loopVideos: true,
//                            nextVideoDelay: Duration(seconds: 4)),
//                    betterPlayerDataSource: BetterPlayerDataSource(
//                        BetterPlayerDataSourceType.network,
//                        dataSourceList[index]),
//                  ),
//                ),

                child: BetterPlayerListVideoPlayer(
                  BetterPlayerDataSource(
                    BetterPlayerDataSourceType.network,
                    dataSourceList[index],
                  ),
                  key: Key(dataSourceList[index].hashCode.toString()),
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
                      controlsConfiguration: BetterPlayerControlsConfiguration(
                          enableSkips: false,
                          enableOverflowMenu: false,
                          enableFullscreen: false,
                          controlBarColor: Colors.transparent,
                          playerTheme: BetterPlayerTheme.custom,
                          enableProgressBar: true,
                          customControlsBuilder: (betterPlayerController) {
                            return Container(
                              color: Colors.transparent,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: MediaQuery.of(context)
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
                                                  "Rohan Lawande",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: MediaQuery.of(
                                                                context)
                                                            .textScaleFactor *
                                                        18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                              .padding
                                                              .vertical <
                                                          5.0
                                                      ? 5.0
                                                      : MediaQuery.of(context)
                                                          .padding
                                                          .vertical,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      isExpanded = !isExpanded;
                                                    });
                                                  },
                                                  child: AnimatedCrossFade(
                                                    duration: Duration(
                                                        milliseconds: 400),
                                                    firstChild: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.08,
                                                      child: Text(
                                                        "${description.substring(0, 20)}...more",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .textScaleFactor *
                                                                16,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                            fontStyle: FontStyle
                                                                .italic),
                                                      ),
                                                    ),
                                                    secondChild: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.08,
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Text(
                                                          description,
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
                                                    ),
                                                    crossFadeState: isExpanded
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
                                              vertical: MediaQuery.of(context)
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  child: Icon(
                                                    isLiked
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    size: MediaQuery.of(context)
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  child: Icon(
                                                    Icons.comment,
                                                    size: MediaQuery.of(context)
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
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  child: Icon(
                                                    Icons.send,
                                                    size: MediaQuery.of(context)
                                                            .textScaleFactor *
                                                        40,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onTap: () =>
                                                    debugPrint("pressed share"),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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

  BetterPlayerController betterPlayerController;

  @override
  void initState() {
    super.initState();

    dataSourceList.add(
        "https://appstractinnovations.com/TaandavFilmsApp/Ad_Videos/crunch.mp4");

    dataSourceList.add("http://appstractinnovations.com/test/output.mp4");

    dataSourceList
        .add("http://appstractinnovations.com/test/outputvertical.mp4");

    dataSourceList
        .add("http://appstractinnovations.com/test/outputverticaldas.mp4");

    dataSourceList.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4");
    dataSourceList.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    dataSourceList.add(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4");

    controller = BetterPlayerListVideoPlayerController();
  }

  @override
  void dispose() {
    super.dispose();
    dataSourceList.clear();
    print("dispose called");
    WidgetsBinding.instance.removeObserver(this);
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
