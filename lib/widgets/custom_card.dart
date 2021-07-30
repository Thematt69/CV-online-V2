import 'package:cv_online_v2/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  final BuildContext? context;
  final String? label;
  final String? value;
  final String? url;

  const CustomCard._({
    this.context,
    this.label,
    this.value,
    this.url,
    Key? key,
  }) : super(key: key);

  factory CustomCard.presentation({
    required BuildContext context,
    required String label,
    required String value,
    String? url,
  }) {
    return CustomCard._(
      context: context,
      label: label,
      value: value,
      url: url,
    );
  }

  factory CustomCard.competence({
    required BuildContext context,
    required String label,
  }) {
    return CustomCard._(
      context: context,
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: orangeLightColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          if (value != null && value!.isNotEmpty)
            Flexible(
              child: InkWell(
                onTap: url != null ? () async => await launch(url!) : null,
                child: Text(
                  value!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: url != null
                            ? Theme.of(context).colorScheme.primary
                            : greyDarkColor,
                        height: 1.6,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
