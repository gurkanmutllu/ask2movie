import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/containers/custom_sliver_list_container.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BookmarksView extends StatelessWidget {
  const BookmarksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.chevron_left_outlined),
        title: Padding(
          padding: PaddingItems.topPadding,
          child: TitleWidget(title: LocaleKeys.bookmarks_bookmarksTitle.tr()),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemBuilder: (BuildContext context, int index) {
              return const CustomSliverListContainer();
            },
          ),
        ],
      ),
    );
  }
}
