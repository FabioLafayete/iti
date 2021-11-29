import 'package:app/component/page/page_widget.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class DetailImage extends BaseWidget {

  final String image;
  DetailImage({Key key, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Color(0xFFF5F8FA),
      body: this._buildImage(),
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
      backgroundColor: colors.orange,
      elevation: 0.0,
      centerTitle: true,
      title: Image.asset(
        assets.logo,
        width: width * 0.38,
        color: Colors.white,
      ),
      // actions: [
      //   IconButton(
      //       icon: Icon(
      //           Icons.share,
      //           size: width * 0.07,
      //           color: Colors.white
      //       ),
      //     onPressed: () => _onTapShare(context),
      //   )
      // ],
    );
  }

  // void _onTapShare(BuildContext context) async {
  //
  //   LoadingOverlay loading = LoadingOverlay(context);
  //   await loading.show();
  //
  //   try {
  //     Response response = await get(widget.image);
  //
  //     await ShareFile.EsysFlutterShare.shareImage(
  //       'Iti Malia',
  //       _getFile(),
  //       response.bodyBytes,
  //       'application/jpg',
  //     );
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     await loading.hide();
  //   }
  // }

  String _getFile(){
    String name;
    int index = image.length - 1;
    bool out = false;

    while(!out){
      if(image[index] == '/'){
        if(name == null){
          name = image.substring(index+1, image.length);
          out = true;
        }
      }
      index --;
    }
    return '/Iti_Malia_' + name.replaceAll('%20', ' ');
  }

}
