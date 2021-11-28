import 'package:app/util/app_theme.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectItem extends StatefulWidget {

  final List<String> items;
  final String title;

  SelectItem({
    this.items,
    this.title = 'titulo'
  });

  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {

  String dropValue;

  bool isOpen = false;

  final text = AppTheme().text;
  final AppColors colors = AppColors();

  @override
  void initState() {
    super.initState();
    dropValue = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(widget.title, color: colors.textSecondary, fontSize: 16),
          SizedBox(height: 10),
          InkWell(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              child: _dropDown()
          )
        ],
      ),
    );
  }

  Widget _dropDown(){
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.02),
                  child: text(dropValue, color: colors.text, fontSize: 20),
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation((isOpen ? 270 : 90) / 360),
                  child: Icon(Icons.arrow_forward_ios, color: colors.textSecondary)
                )
              ],
            ),
            Divider(color: colors.text)
          ],
        ),
        if(isOpen)
        Container(
          margin: EdgeInsets.only(top: Get.height * 0.035),
          color: colors.backgroundHorse,
          width: Get.width,
          constraints: BoxConstraints(
            maxHeight: Get.height * 0.15,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(widget.items.length,
                      (index) => Container(
                        margin: EdgeInsets.all(Get.width * 0.02).copyWith(bottom: index == widget.items.length - 1 ? Get.width * 0.02 : 0),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              isOpen = false;
                              dropValue = widget.items[index];
                            });
                          },
                          child: Container(
                            width: Get.width,
                            height: Get.height * 0.03,
                            alignment: Alignment.centerLeft,
                            child: text(
                                widget.items[index],
                                fontSize: 20,
                                color: colors.text,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      )
              ),
            ),
          ),
        )
      ],
    );
  }

}
