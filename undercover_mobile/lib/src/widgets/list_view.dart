import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'device.dart';

class UndercoverListView extends StatefulWidget {
  const UndercoverListView(
      {required this.listOfWidgets,
      required this.numOfWidgetsOnTablet,
      required this.numOfWidgetsOnDesktop,
      required this.numOfWidgetsOnWideScreen,
      required this.itemHeight,
      required this.itemWidth,
      required this.padding,
      required this.leftPaddingOnPhone,
      Key? key})
      : super(key: key);
  final List<Widget> listOfWidgets;
  final double itemHeight;
  final double itemWidth;
  final double padding;
  final double leftPaddingOnPhone;
  final int numOfWidgetsOnTablet;
  final int numOfWidgetsOnDesktop;
  final int numOfWidgetsOnWideScreen;

  @override
  _UndercoverListViewState createState() => _UndercoverListViewState();
}

class _UndercoverListViewState extends State<UndercoverListView> {
  final ScrollController _scrollController = ScrollController();
  late Size _screenSize;
  double movedItem = 0;
  late double _initMovedItem;
  late double _maxLength;
  bool backButton = false;
  bool forwardButton = true;

  @override
  void didChangeDependencies() {
    _screenSize = MediaQuery.of(context).size;
    _maxLength =
        (widget.itemWidth + (widget.padding * 2)) * widget.listOfWidgets.length;
    if (_screenSize.width >= 800 && _screenSize.width < 1440) {
      setState(() {
        _initMovedItem = (widget.itemWidth + (widget.padding * 2)) *
            widget.numOfWidgetsOnTablet;
        if (widget.listOfWidgets.length <= widget.numOfWidgetsOnTablet) {
          setState(() {
            forwardButton = false;
          });
        }
      });
    } else if (_screenSize.width >= 1440 && _screenSize.width < 1780) {
      setState(() {
        _initMovedItem = (widget.itemWidth + (widget.padding * 2)) *
            widget.numOfWidgetsOnDesktop;
        if (widget.listOfWidgets.length <= widget.numOfWidgetsOnDesktop) {
          setState(() {
            forwardButton = false;
          });
        }
      });
    } else if (_screenSize.width >= 1780) {
      setState(() {
        _initMovedItem = (widget.itemWidth + (widget.padding * 2)) *
            widget.numOfWidgetsOnWideScreen;
        if (widget.listOfWidgets.length <= widget.numOfWidgetsOnWideScreen) {
          setState(() {
            forwardButton = false;
          });
        }
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return getScreenType(context) == DeviceType.phone
        ? Container(
            height: widget.itemHeight,
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: widget.listOfWidgets.length,
              addSemanticIndexes: false,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(
                          right: widget.padding,
                          left: widget.leftPaddingOnPhone)
                      : EdgeInsets.symmetric(horizontal: widget.padding),
                  child: widget.listOfWidgets[index],
                );
              },
            ),
          )
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: widget.itemHeight,
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: true,
                    itemCount: widget.listOfWidgets.length,
                    addSemanticIndexes: false,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.only(right: widget.padding)
                            : EdgeInsets.symmetric(horizontal: widget.padding),
                        child: widget.listOfWidgets[index],
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: forwardButton,
                child: Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        if (movedItem == 0) {
                          setState(() {
                            movedItem = _initMovedItem;
                          });
                          if (_initMovedItem >= _maxLength - _initMovedItem) {
                            _scrollController
                                .animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                forwardButton = false;
                                backButton = true;
                              });
                            });
                          } else {
                            _scrollController
                                .animateTo(
                              _initMovedItem,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                movedItem =
                                    _scrollController.offset + _initMovedItem;
                                backButton = true;
                              });
                            });
                          }
                        } else {
                          if (movedItem >= _maxLength - _initMovedItem) {
                            _scrollController
                                .animateTo(
                              _scrollController.position.maxScrollExtent,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                forwardButton = false;
                                backButton = true;
                              });
                            });
                          } else {
                            _scrollController
                                .animateTo(
                              movedItem,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            )
                                .then((_) {
                              setState(() {
                                movedItem =
                                    _scrollController.offset + _initMovedItem;
                                backButton = true;
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: themeBoxBlueLightest,
                            shape: BoxShape.circle),
                        height: 50,
                        width: 50,
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
              Visibility(
                visible: backButton,
                child: Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        forwardButton = true;
                        movedItem = _scrollController.offset - _initMovedItem;
                      });
                      if (movedItem < 0) {
                        setState(() {
                          movedItem = 0;
                        });
                      }
                      _scrollController
                          .animateTo(
                        movedItem,
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 500),
                      )
                          .then((_) {
                        if (movedItem <= 0) {
                          setState(() {
                            backButton = false;
                          });
                        }
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: themeBoxBlueLightest, shape: BoxShape.circle),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
