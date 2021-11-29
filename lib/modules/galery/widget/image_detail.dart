import 'package:app/component/page_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailImage extends BaseWidget {

  final String image;
  DetailImage({this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Color(0xFFF5F8FA),
      body: _buildImage(),
    );
  }

  Widget _buildImage() {
    return Container(
      child: PhotoView(
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: 3.0,
        basePosition: Alignment.center,
        imageProvider: NetworkImage(image),
      ),
    );
  }

  Widget _appBar(){
    return AppBar(
      backgroundColor: colors.primary,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset(
        assets.logo,
        width: width * 0.38,
        color: colors.textSecondary,
      ),
    );
  }

}
