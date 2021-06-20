import 'package:cv_online_v2/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomCard extends StatelessWidget {
  final BuildContext context;
  final String label;
  final String value;
  final String? url;

  const CustomCard({
    required this.context,
    required this.label,
    required this.value,
    this.url,
    Key? key,
  }) : super(key: key);

  // TODO - Faire des factory pour avoir deux formats de card

  @override
  Widget build(BuildContext context) {
    return Container(
      color: orangeLightColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label : ',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          Flexible(
            child: InkWell(
              onTap: url != null
                  ? () async => await canLaunch(url!)
                      ? await launch(url!)
                      : debugPrint('Could not launch ${url!}')
                  : null,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: url != null
                          ? Theme.of(context).colorScheme.primary
                          : greyColor,
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
