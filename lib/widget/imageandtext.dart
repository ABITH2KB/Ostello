import 'package:flutter/material.dart';

class Imageandtext extends StatefulWidget {
  final String image;
  final String text;

  const Imageandtext({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  _ImageandtextState createState() => _ImageandtextState();
}

class _ImageandtextState extends State<Imageandtext> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Image.asset(widget.image,
              height: 100,
              width: 80,),
             Text(widget.text,
             style: const TextStyle(
              fontFamily: 'Schyler'
             ),),
          ],
        ),
       
      ],
    );
  }
}