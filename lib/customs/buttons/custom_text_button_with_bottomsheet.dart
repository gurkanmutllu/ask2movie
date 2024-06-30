import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:flutter/material.dart';

class CustomTextButtonBottomsheet extends StatelessWidget {
  const CustomTextButtonBottomsheet.m1({
    required this.title,
    super.key,
    required this.bottomsheetText,
  })  : mainAxisAlignment = MainAxisAlignment.spaceBetween,
        textFontSize = 15.0;

  const CustomTextButtonBottomsheet.m2({
    required this.title,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.textFontSize = 15.0,
    required this.bottomsheetText,
  });
  final String bottomsheetText;
  final String title;
  final MainAxisAlignment mainAxisAlignment;
  final double textFontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingItems.halfTopPadding,
      child: TextButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SubTitleWidget.m2(
                        title: bottomsheetText,
                        textColor: Colors.white,
                        textMaxline: 3,
                        textFontWeight: FontWeight.bold,
                      ),
                      ElevatedButton(
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.amber),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: textFontSize,
              ),
            ),
            const Icon(
              Icons.chevron_right_outlined,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
