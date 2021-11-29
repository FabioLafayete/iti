import 'package:app/component/page/page_widget.dart';
import 'package:flutter/material.dart';

import 'image_detail.dart';

class ShowImage extends BaseWidget {

  final String image;

  ShowImage({this.image});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
          top: width * 0.01,
          bottom: width * 0.01
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>DetailImage(image: image))
          );
        },
        child: _image(),
      )
    );
  }

  Widget _image(){
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: width * 0.6,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(
                  color: colors.orange,
                  width: 2
              )
          ),
          child: Center(
            child: Icon(
              Icons.pets,
              color: colors.orange,
              size: width * 0.25,
            ),
          ),
        ),
        Image.network(
          image,
          width: width * 0.9,
          height: width * 0.5,
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }
}
