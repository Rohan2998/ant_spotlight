import 'dart:math';

import 'package:better_video_player/test_player_widget.dart';
import 'package:flutter/material.dart';

class VideoListData {
  final String videoTitle;
  final String videoUrl;

  VideoListData(this.videoTitle, this.videoUrl);
}

class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  final _random = new Random();
  final List<String> _videos = [
    "https://appstractinnovations.com/test/output.mp4",
    "http://appstractinnovations.com/test/outputvertical.mp4",
    "http://appstractinnovations.com/test/outputverticaldas.mp4"
  ];
  List<VideoListData> dataList = [];
  var value = 0;

  @override
  void initState() {
    _setupData();
    super.initState();
  }

  void _setupData() {
    for (int index = 0; index < 10; index++) {
      var randomVideoUrl = _videos[_random.nextInt(_videos.length)];
      dataList.add(VideoListData("Video $index", randomVideoUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video in list")),
      body: Container(
        color: Colors.grey,
        child: Column(children: [
          FlatButton(
            child: Text("Update page state"),
            onPressed: () {
              setState(() {
                value++;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                VideoListData videoListData = dataList[index];
                return VideoListWidget(
                  videoListData: videoListData,
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

////////////////////////////////////////////////////         overlay         /////////////////////////////////////////////////
//                      overlay: SafeArea(
//                        child: Container(
//                          child: Padding(
//                            padding: EdgeInsets.symmetric(
//                                horizontal:
//                                    MediaQuery.of(context).padding.horizontal),
//                            child: Stack(children: [
//                              Column(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: [
//                                  SizedBox(
//                                    height: MediaQuery.of(context).size.height *
//                                        0.55,
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.symmetric(
//                                        horizontal: MediaQuery.of(context)
//                                                    .padding
//                                                    .horizontal <=
//                                                5.0
//                                            ? 5.0
//                                            : MediaQuery.of(context)
//                                                .padding
//                                                .horizontal),
//                                    child: Row(
//                                      mainAxisAlignment:
//                                          MainAxisAlignment.spaceBetween,
//                                      children: [
//                                        GestureDetector(
//                                          onTap: () {
//                                            setState(() {
//                                              print("pressed");
////                                            if (isExpanded) {
////                                              isExpanded = false;
////                                              print("pressed");
////                                            } else {
////                                              isExpanded = true;
////                                              print("pressed");
////                                            }
//                                            });
//                                          },
//                                          child: Container(
//                                            width: MediaQuery.of(context)
//                                                    .size
//                                                    .width *
//                                                0.85,
//                                            color: Colors.transparent,
//                                            child: Column(
//                                              mainAxisAlignment:
//                                                  MainAxisAlignment.start,
//                                              crossAxisAlignment:
//                                                  CrossAxisAlignment.start,
//                                              children: [
//                                                Text(
//                                                  "Rohan Lawande",
//                                                  style: TextStyle(
//                                                    color: Colors.white,
//                                                    fontSize: MediaQuery.of(
//                                                                context)
//                                                            .textScaleFactor *
//                                                        18,
//                                                    fontWeight: FontWeight.w500,
//                                                  ),
//                                                ),
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
//                                                Text(
//                                                  description,
//                                                  style: TextStyle(
//                                                      color: Colors.white,
//                                                      fontSize: MediaQuery.of(
//                                                                  context)
//                                                              .textScaleFactor *
//                                                          16,
//                                                      fontWeight:
//                                                          FontWeight.w300,
//                                                      fontStyle:
//                                                          FontStyle.italic),
//                                                ),
//                                              ],
//                                            ),
//                                          ),
//                                        ),
//                                        Column(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.spaceEvenly,
//                                          children: [
//                                            Padding(
//                                              padding: EdgeInsets.all(
//                                                  MediaQuery.of(context)
//                                                      .padding
//                                                      .vertical),
//                                              child: IconButton(
//                                                icon: Icon(
//                                                  isLiked
//                                                      ? Icons.favorite
//                                                      : Icons.favorite_border,
//                                                  size: MediaQuery.of(context)
//                                                          .textScaleFactor *
//                                                      40,
//                                                  color: Colors.white,
//                                                ),
//                                                onPressed: () {
//                                                  isLiked
//                                                      ? isLiked = false
//                                                      : isLiked = true;
//                                                },
//                                              ),
//                                            ),
//                                            Padding(
//                                              padding: EdgeInsets.all(
//                                                  MediaQuery.of(context)
//                                                      .padding
//                                                      .vertical),
//                                              child: IconButton(
//                                                icon: Icon(
//                                                  Icons.comment_bank_outlined,
//                                                  size: MediaQuery.of(context)
//                                                          .textScaleFactor *
//                                                      40,
//                                                  color: Colors.white,
//                                                ),
//                                                onPressed: () =>
//                                                    debugPrint("pressed"),
//                                              ),
//                                            ),
//                                            Padding(
//                                              padding: EdgeInsets.all(
//                                                  MediaQuery.of(context)
//                                                      .padding
//                                                      .vertical),
//                                              child: IconButton(
//                                                icon: Icon(
//                                                  Icons.send,
//                                                  size: MediaQuery.of(context)
//                                                          .textScaleFactor *
//                                                      40,
//                                                  color: Colors.white,
//                                                ),
//                                                onPressed: () =>
//                                                    debugPrint("pressed"),
//                                              ),
//                                            ),
//                                          ],
//                                        )
//                                      ],
//                                    ),
//                                  )
//                                ],
//                              ),
//                            ]),
//                          ),
//                        ),
//                      ),

//                  controller: BetterPlayerController(
//                    BetterPlayerConfiguration(
//
//                    ),
//                    betterPlayerPlaylistConfiguration: BetterPlayerPlaylistConfiguration(
//                      loopVideos: true,
//                      nextVideoDelay: Duration(milliseconds: 400)
//                    ),
//                    betterPlayerDataSource:
//
//                  ),
