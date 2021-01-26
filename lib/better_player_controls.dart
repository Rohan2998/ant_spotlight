import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BetterPlayerCustomController extends StatefulWidget {
  final BetterPlayerController betterPlayerController;
  final bool isExpanded;
  final String description;
  final bool isLiked;

  const BetterPlayerCustomController(
      {Key key,
      this.betterPlayerController,
      this.isExpanded,
      this.description,
      this.isLiked})
      : super(key: key);
  @override
  _BetterPlayerCustomControllerState createState() =>
      _BetterPlayerCustomControllerState();
}

class _BetterPlayerCustomControllerState
    extends State<BetterPlayerCustomController> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return betterPlayerCustomControls(widget.betterPlayerController,
        widget.isExpanded, widget.description, widget.isLiked);
  }

  Widget betterPlayerCustomControls(
      BetterPlayerController betterPlayerController,
      bool isExpanded,
      String description,
      bool isLiked) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.70,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rohan Lawande",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).textScaleFactor * 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.vertical < 5.0
                              ? 5.0
                              : MediaQuery.of(context).padding.vertical,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: AnimatedCrossFade(
                            duration: Duration(milliseconds: 400),
                            firstChild: Text(
                              "${description.substring(0, 20)}...",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic),
                            ),
                            secondChild: Container(
                              height: MediaQuery.of(context).size.height * 0.10,
                              child: SingleChildScrollView(
                                child: Text(
                                  description,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context)
                                              .textScaleFactor *
                                          16,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            crossFadeState: isExpanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).padding.vertical < 5.0
                                    ? 5.0
                                    : MediaQuery.of(context).padding.vertical),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Icon(
                              isLiked ? Icons.favorite : Icons.favorite_border,
                              size: MediaQuery.of(context).textScaleFactor * 40,
                              color: isLiked ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).padding.vertical < 5.0
                                    ? 5.0
                                    : MediaQuery.of(context).padding.vertical),
                        child: GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Icon(
                              Icons.comment,
                              size: MediaQuery.of(context).textScaleFactor * 40,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () => debugPrint("pressed comments"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).padding.vertical < 5.0
                                    ? 5.0
                                    : MediaQuery.of(context).padding.vertical),
                        child: GestureDetector(
                          child: Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Icon(
                              Icons.send,
                              size: MediaQuery.of(context).textScaleFactor * 40,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () => debugPrint("pressed share"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
