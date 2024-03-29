import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:flutter/material.dart';

class CustomTopFiveCard extends StatelessWidget {
  const CustomTopFiveCard({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: 280,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: deviceHeight * 0.18,
                    width: deviceWidth * 0.64,
                  ),
                  IconButton(
                    color: Colors.amber,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Center(
              child: SizedBox(
                width: 250,
                child: SubTitleWidget(
                  title: 'Denemeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee',
                ),
              ),
            ),
            const Padding(
              padding: PaddingItems.horizontalPadding,
              child: Row(
                children: [
                  SubTitleWidget(
                    title: '3.5 ',
                    textFontWeight: FontWeight.w400,
                  ),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star),
                  Icon(Icons.star_half_outlined),
                  Icon(Icons.star_border_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
