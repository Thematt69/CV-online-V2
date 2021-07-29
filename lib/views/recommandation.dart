import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/contents.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class RecommandationSection extends StatefulWidget {
  RecommandationSection({
    Key? key,
  }) : super(key: key);

  @override
  _RecommandationSectionState createState() => _RecommandationSectionState();
}

class _RecommandationSectionState extends State<RecommandationSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkLightColor,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: whiteDarkerColor.withOpacity(0.2),
            width: 10,
          ),
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: defaultPadding40,
          vertical: defaultPadding150,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: defaultPadding61,
            right: defaultPadding150,
            top: defaultPadding61,
            bottom: defaultPadding61,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/double_quote.png',
                width: 60,
                cacheWidth: 60,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 60,
                ),
              ),
              const SizedBox(width: defaultPadding30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommandation,
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            letterSpacing: 0,
                            height: 1.6,
                            fontWeight: FontWeight.w300,
                            color: whiteDarkerColor,
                          ),
                    ),
                    const SizedBox(height: defaultPadding30),
                    Text(
                      auteurRecommandation,
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            letterSpacing: 0,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                            color: greyColor,
                          ),
                    ),
                    const SizedBox(height: defaultPadding6),
                    Text(
                      posteRecommandation,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: orangeColor,
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      entrepriseRecommandation,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            color: orangeColor,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
