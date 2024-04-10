import 'package:cv_online_v2/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCardPresentation extends StatelessWidget {

  const CustomCardPresentation({
    super.key,
    required this.label,
    this.url,
    required this.value,
  });
  final String label;
  final String? url;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CvColors.orangeLight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label : ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Flexible(
            child: InkWell(
              onTap:
                  url != null ? () async => launchUrl(Uri.parse(url!)) : null,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: url != null
                          ? Theme.of(context).colorScheme.primary
                          : CvColors.greyDark,
                      height: 1.6,
                      decoration: url != null ? TextDecoration.underline : null,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
