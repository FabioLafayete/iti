import 'package:app/component/page/page_widget.dart';
import 'package:flutter/material.dart';

class EndImage extends BaseWidget {

  final bool showText;

  EndImage({this.showText = true});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
        top: width * 0.05,
        bottom: width * 0.05
      ),
      child: Column(
        children: [
          _image(),
          if(showText)
            Text(
                'Que pena, \nacabou as fotos 😩',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold
              ),
            )
        ],
      ),
    );
  }

  Widget _image(){
    return Image.asset(
      assets.dog,
      color: Colors.black,
      height: width * 0.3,
    );
  }
}
