import 'package:ask2movie/core/init/locale_keys.g.dart';
import 'package:ask2movie/core/project_items/padding_items.dart';
import 'package:ask2movie/customs/cards/custom_top_five_card.dart';
import 'package:ask2movie/customs/containers/custom_sliver_list_container.dart';
import 'package:ask2movie/customs/texts/title_widget.dart';
import 'package:ask2movie/models/movie_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({this.movie, super.key});
  final Movie? movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: PaddingItems.topPadding,
          child: TitleWidget(title: LocaleKeys.home_homeTitle.tr()),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: PaddingItems.topPadding2x,
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SizedBox(
                        width: 300,
                        child: CustomTopFiveCard(movie: movie ?? Movie()),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: PaddingItems.horizontalPadding,
              child: TitleWidget(
                title: LocaleKeys.home_latest.tr(),
                padding: PaddingItems.zeroPadding,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return CustomSliverListContainer(
                movie: movie ?? Movie(),
              );
            },
          ),
        ],
      ),
    );
  }
}
