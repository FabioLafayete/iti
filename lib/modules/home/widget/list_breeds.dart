import 'package:app/component/page/page_widget.dart';
import 'package:flutter/material.dart';

class ListBreeds extends BaseWidget {

  final String breed;

  ListBreeds({this.breed});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){},
      child: Container(
        width: width,
        padding: EdgeInsets.all(width * 0.05),
        margin: EdgeInsets.only(
            top: width * 0.02,
            bottom: width * 0.02
        ),
        decoration: BoxDecoration(
            color: colors.orange.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: Colors.white,
                width: 0.3
            )
        ),
        child: text(
          '${breed[0].toUpperCase()}${breed.substring(1)}',
          color: Colors.white,
          fontSize: width * 0.05,
        ),
      ),
    );
  }
}
