import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/texts/subtitle_widget.dart';
import 'package:flutter/material.dart';

class CustomSliverListContainer extends StatelessWidget {
  const CustomSliverListContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: PaddingItems.allPadding,
      child: InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
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
                      height: deviceHeight * 0.36,
                      width: deviceWidth,
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
            ),
            const Expanded(
              child: Padding(
                padding: PaddingItems.leftPadding,
                child: Column(
                  children: [
                    SubTitleWidget(
                      title: "Hitman's Wife's BodyGuard",
                      textMaxline: 2,
                    ),
                    Row(
                      children: [
                        SubTitleWidget(title: '3.5 '),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star_half_outlined),
                        Icon(Icons.star_border_outlined),
                      ],
                    ),
                    Text(
                      'Action, Comedy, Crime',
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'sdasdassss ssssssssssssssssssssssss aaaaaaaaaaaaaaa aaaaaaaaaaaaaaa aaaaassssssssss sssssssssss sssssssssssss ssssssssssssss ss bbbbbbbb',
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
