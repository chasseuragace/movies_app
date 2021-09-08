import 'package:flutter/material.dart';
import 'package:movies_app/features/homepage/ui/component/popular_listview.dart';
import 'package:movies_app/theme/theme_constants.dart';

class SectionHeaderWithAction extends StatelessWidget {
  final Null Function() action;
  final String heading;
  const SectionHeaderWithAction({
    Key key,
    this.action,
    this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(heading,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .withSize(18)
                .withWeight()),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text("See all", style: AppThemeConstants.appFontAccent),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 12, color: Theme.of(context).colorScheme.primary),
            ],
          ),
        ),
        if (false)
          Ink(
            child: InkWell(
              splashColor: Colors.orange,
              onTap: action,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Text("See all",
                          style: AppThemeConstants.appFontAccent),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}

class SectionHeaderWithTabs extends StatelessWidget {
  final Null Function() action;
  final String heading;
  const SectionHeaderWithTabs({
    Key key,
    this.action,
    this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: 350,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(heading,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .withSize(18)
                          .withWeight()),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: 'Movies',
                      ),
                      Tab(text: 'Tv-Show'),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                PopularTodayTabView(),
                PopularTodayTabView(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
