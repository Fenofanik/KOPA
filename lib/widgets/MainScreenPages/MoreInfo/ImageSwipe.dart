import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {
  final List imageList;

  ImageSwipe({this.imageList});

  final double radius = 22;

  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (num) {
            setState(() {
              _selectedPage = num;
            });
          },
          children: [
            for (var i = 0; i < 4; i++)
              ClipRRect(
                borderRadius: BorderRadius.circular(widget.radius),
                child: FittedBox(
                  child: Image.network("${widget.imageList[i]}"),
                  fit: BoxFit.fill,
                ),
              ),
          ],
        ),
        Positioned(
          top: 20,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (var i = 0; i < 4; i++)
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: _selectedPage==i? Colors.white:Color(0xffB6B6B6)),
                  height: 8,
                  width: 8,
                ),
            ],
          ),
        )
      ],
    );
  }
}
