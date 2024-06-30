import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:ask2movie/product/constants/string_constants.dart';
import 'package:flutter/material.dart';

class CustomTextButtonBottomsheetWithImage extends StatelessWidget {
  const CustomTextButtonBottomsheetWithImage({
    required this.title,
    super.key,
  })  : mainAxisAlignment = MainAxisAlignment.spaceBetween,
        textFontSize = 15.0;

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
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    aboutUsRow(
                      nameString: StringConstants.aboutUsGurkan,
                      imageUrl:
                          'https://avatars.githubusercontent.com/u/79024035?v=4',
                    ),
                    aboutUsRow(
                      nameString: StringConstants.aboutUsFatih,
                      imageUrl:
                          'https://avatars.githubusercontent.com/u/92013695?v=4',
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

class aboutUsRow extends StatelessWidget {
  const aboutUsRow({
    super.key,
    required this.imageUrl,
    required this.nameString,
  });
  final String imageUrl;
  final String nameString;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SubTitleWidget.m2(
          title: nameString,
          textColor: Colors.white,
          textMaxline: 3,
          textFontWeight: FontWeight.bold,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: 50,
          width: 50,
        ),
      ],
    );
  }
}
