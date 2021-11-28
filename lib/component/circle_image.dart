import 'package:flutter/material.dart';

class CircleImage{

  static Widget defaultImage({
    @required String image,
    double size = 50,
    Color backgroundColor = Colors.transparent
  }){
    return CircleAvatar(
      minRadius: 15,
      maxRadius: size / 2,
      backgroundColor: backgroundColor,
      child: ClipOval(
        child: Image.network(
            image,
            fit: BoxFit.cover,
            width: size,
            height: size,
        ),
      ),
    );
  }

}
