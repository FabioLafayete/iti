import 'package:app/component/page_widget.dart';
import 'package:flutter/material.dart';

class ListBreeds extends BaseWidget {

  final String breed;
  final Function onTap;

  ListBreeds({this.breed, this.onTap});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(width * 0.05),
        margin: EdgeInsets.only(
            top: width * 0.02,
            bottom: width * 0.02
        ),
        decoration: BoxDecoration(
            color: colors.primary.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
                color: colors.background,
                width: 0.3
            )
        ),
        child: text(
          '${breed[0].toUpperCase()}${breed.substring(1)}',
          color: colors.textSecondary,
          fontSize: width * 0.05,
        ),
      ),
    );
  }
}
