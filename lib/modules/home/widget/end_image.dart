import 'package:app/component/page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EndImage extends BaseWidget {

  final bool showText;

  EndImage({this.showText = true});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage(assets.dog), context);
    return Container(
      margin: EdgeInsets.only(
        top: width * 0.05,
        bottom: width * 0.05
      ),
      child: Column(
        children: [
          _image(),
          if(showText)
            text(
              'gallery.endImages'.tr,
                textAlign: TextAlign.center,
                fontSize: width * 0.06,
                color: colors.text,
                fontWeight: FontWeight.bold
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
