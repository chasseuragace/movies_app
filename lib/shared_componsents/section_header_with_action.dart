import 'package:flutter/material.dart';
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
        // if (false)
        //   TextButton(
        //     //todo theme for button - splash effect ko lagi
        //     onPressed: () {},
        //     child: Row(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(right: 4.0),
        //           child: Text(
        //             "See All",
        //             style: AppThemeConstants.appFont
        //                 .copyWith(color: Theme.of(context).accentColor),
        //           ),
        //         ),
        //         Icon(Icons.arrow_forward),
        //       ],
        //     ),
        //   ),

        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text("See all", style: AppThemeConstants.appFontAccent),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: Theme.of(context).accentColor,
              ),
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
                // todo refractor make a button out of it
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
                      color: Theme.of(context).accentColor,
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
