import 'package:better_player/better_player.dart';
import 'package:better_video_player/test_player.dart';
import 'package:flutter/material.dart';

class VideoListWidget extends StatefulWidget {
  final VideoListData videoListData;

  const VideoListWidget({Key key, this.videoListData}) : super(key: key);

  @override
  _VideoListWidgetState createState() => _VideoListWidgetState();
}

class _VideoListWidgetState extends State<VideoListWidget> {
  VideoListData get videoListData => widget.videoListData;
  BetterPlayerConfiguration betterPlayerConfiguration;
  BetterPlayerListVideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = BetterPlayerListVideoPlayerController();
    betterPlayerConfiguration = BetterPlayerConfiguration(autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              videoListData.videoTitle,
              style: TextStyle(fontSize: 50),
            ),
          ),
          AspectRatio(
              child: BetterPlayerListVideoPlayer(
                BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network,
                  videoListData.videoUrl,
                  notificationConfiguration:
                      BetterPlayerNotificationConfiguration(
                          showNotification: true,
                          title: videoListData.videoTitle,
                          author: "Test"),
                ),
                configuration: BetterPlayerConfiguration(
                  autoPlay: false,
                  aspectRatio: 1,
                  fit: BoxFit.cover,
                ),
                //key: Key(videoListData.hashCode.toString()),
                playFraction: 0.8,
                betterPlayerListVideoPlayerController: controller,
              ),
              aspectRatio: 1),
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
                "Horror: In Steven Spielberg's Jaws, a shark terrorizes a beach "
                "town. Plainspoken sheriff Roy Scheider, hippie shark "
                "researcher Richard Dreyfuss, and a squirrely boat captain "
                "set out to find the beast, but will they escape with their "
                "lives? 70's special effects, legendary score, and trademark "
                "humor set this classic apart."),
          ),
          Center(
            child: Wrap(children: [
              RaisedButton(
                child: Text("Play"),
                onPressed: () {
                  controller.play();
                },
              ),
              const SizedBox(width: 8),
              RaisedButton(
                child: Text("Pause"),
                onPressed: () {
                  controller.pause();
                },
              ),
              const SizedBox(width: 8),
              RaisedButton(
                child: Text("Set max volume"),
                onPressed: () {
                  controller.setVolume(100);
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

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
