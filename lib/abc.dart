//import 'package:better_player/better_player.dart';
//import 'package:flutter/material.dart';
//
//class Test extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: BetterPlayer(
//      controller: BetterPlayerController(
//        BetterPlayerConfiguration(
//            aspectRatio: 9 / 15.5,
//            autoPlay: true,
//            autoDispose: true,
//            handleLifecycle: true,
//            overlay: SafeArea(
//              child: Container(
//                child: Padding(
//                  padding: EdgeInsets.symmetric(
//                      horizontal: MediaQuery.of(context).padding.horizontal),
//                  child: Stack(children: [
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        SizedBox(
//                          height: MediaQuery.of(context).size.height * 0.55,
//                        ),
//                        Padding(
//                          padding: EdgeInsets.symmetric(
//                              horizontal: MediaQuery.of(context)
//                                          .padding
//                                          .horizontal <=
//                                      5.0
//                                  ? 5.0
//                                  : MediaQuery.of(context).padding.horizontal),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: [
//                              GestureDetector(
//                                onTap: () {
//                                  setState(() {
//                                    print("pressed");
////                                            if (isExpanded) {
////                                              isExpanded = false;
////                                              print("pressed");
////                                            } else {
////                                              isExpanded = true;
////                                              print("pressed");
////                                            }
//                                  });
//                                },
//                                child: Container(
//                                  width:
//                                      MediaQuery.of(context).size.width * 0.85,
//                                  color: Colors.transparent,
//                                  child: Column(
//                                    mainAxisAlignment: MainAxisAlignment.start,
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: [
//                                      Text(
//                                        "Rohan Lawande",
//                                        style: TextStyle(
//                                          color: Colors.white,
//                                          fontSize: MediaQuery.of(context)
//                                                  .textScaleFactor *
//                                              18,
//                                          fontWeight: FontWeight.w500,
//                                        ),
//                                      ),
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
//                                      Text(
//                                        description,
//                                        style: TextStyle(
//                                            color: Colors.white,
//                                            fontSize: MediaQuery.of(context)
//                                                    .textScaleFactor *
//                                                16,
//                                            fontWeight: FontWeight.w300,
//                                            fontStyle: FontStyle.italic),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                              Column(
//                                mainAxisAlignment:
//                                    MainAxisAlignment.spaceEvenly,
//                                children: [
//                                  Padding(
//                                    padding: EdgeInsets.all(
//                                        MediaQuery.of(context)
//                                            .padding
//                                            .vertical),
//                                    child: IconButton(
//                                      icon: Icon(
//                                        isLiked
//                                            ? Icons.favorite
//                                            : Icons.favorite_border,
//                                        size: MediaQuery.of(context)
//                                                .textScaleFactor *
//                                            40,
//                                        color: Colors.white,
//                                      ),
//                                      onPressed: () {
//                                        isLiked
//                                            ? isLiked = false
//                                            : isLiked = true;
//                                      },
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.all(
//                                        MediaQuery.of(context)
//                                            .padding
//                                            .vertical),
//                                    child: IconButton(
//                                      icon: Icon(
//                                        Icons.comment_bank_outlined,
//                                        size: MediaQuery.of(context)
//                                                .textScaleFactor *
//                                            40,
//                                        color: Colors.white,
//                                      ),
//                                      onPressed: () => debugPrint("pressed"),
//                                    ),
//                                  ),
//                                  Padding(
//                                    padding: EdgeInsets.all(
//                                        MediaQuery.of(context)
//                                            .padding
//                                            .vertical),
//                                    child: IconButton(
//                                      icon: Icon(
//                                        Icons.send,
//                                        size: MediaQuery.of(context)
//                                                .textScaleFactor *
//                                            40,
//                                        color: Colors.white,
//                                      ),
//                                      onPressed: () => debugPrint("pressed"),
//                                    ),
//                                  ),
//                                ],
//                              )
//                            ],
//                          ),
//                        )
//                      ],
//                    ),
//                  ]),
//                ),
//              ),
//            ),
//            placeholder: Container(
//              child: Center(
//                child: CircularProgressIndicator(),
//              ),
//            ),
//            placeholderOnTop: true,
//            fit: BoxFit.cover,
//            controlsConfiguration: BetterPlayerControlsConfiguration(
//                enableSkips: false,
//                enableOverflowMenu: false,
//                enableFullscreen: false,
//                controlBarColor: Colors.transparent,
//                playerTheme: BetterPlayerTheme.material,
//                enableProgressBar: true)),
//        betterPlayerPlaylistConfiguration: BetterPlayerPlaylistConfiguration(
//            loopVideos: true, nextVideoDelay: Duration(milliseconds: 400)),
//        betterPlayerDataSource: BetterPlayerDataSource(
//            BetterPlayerDataSourceType.network, dataSourceList[index]),
//      ),
//    ));
//  }
//}
