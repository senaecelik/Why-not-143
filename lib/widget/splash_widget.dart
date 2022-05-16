library flutter_splash;
import 'dart:core';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  final int? seconds;
  final Text title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final double? photoSize;
  final dynamic onClick;
  final Color? loaderColor;
  final Image? image;
  final Text loadingText;
  final ImageProvider? imageBackground;
  final Gradient? gradientBackground;

   Splash({
    this.loaderColor,
    this.seconds,
    this.photoSize,
    this.onClick,
    this.title = const Text(''),
    this.backgroundColor = Colors.white,
    this.styleTextUnderTheLoader = const TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.image,
    this.loadingText = const Text(""),
    this.imageBackground,
    this.gradientBackground,
  });

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  InkWell(
        onTap: widget.onClick,
        child:  Stack(
          fit: StackFit.expand,
          children: <Widget>[
             Container(
              decoration:  BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    :  DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.imageBackground!,
                      ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
             Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                 Expanded(
                  flex: 2,
                  child:  Container(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child:  Container(child: widget.image),
                          radius: widget.photoSize,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        widget.title
                      ],
                    ),
                  ),
                ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}
