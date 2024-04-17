import 'package:flutter/material.dart';

class HomeDynamicWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int viewCount;
  static const double itemHeight = 100;
  static const double titleHeight = 80;
  static const double marginSize = 10;

  const HomeDynamicWidget(this.title, this.imageUrl, this.viewCount,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(marginSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: itemHeight,
            child: Image.network(imageUrl, scale: 1.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleWrap(),
                _viewCountWrap(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _titleWrap() {
    return Container(
      height: titleHeight,
      margin: EdgeInsets.fromLTRB(marginSize, 0, 0, 0),
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w200,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _viewCountWrap() {
    return Container(
      margin: EdgeInsets.fromLTRB(marginSize, 0, 0, 0),
      height: itemHeight - titleHeight,
      child: Row(children: [
        Icon(
          Icons.remove_red_eye_outlined,
          size: 14.0,
          color: Colors.grey,
        ),
        SizedBox(width: 5),
        Text(
          '$viewCount',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
        )
      ]),
    );
  }
}
