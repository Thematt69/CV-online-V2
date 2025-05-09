import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/extensions/colors_extension.dart';
import 'package:flutter/material.dart';

class CustomCardJobs extends StatefulWidget {
  const CustomCardJobs({
    super.key,
    required this.widthCard,
    required this.periode,
    required this.poste,
    required this.lieu,
    this.service,
    this.description,
  });

  final String? description;
  final String lieu;
  final String periode;
  final String poste;
  final String? service;
  final double widthCard;

  @override
  CustomCardJobsState createState() => CustomCardJobsState();
}

class CustomCardJobsState extends State<CustomCardJobs> {
  final ValueNotifier<bool> _hover = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hover.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _hover.value = true,
      onExit: (event) => _hover.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _hover,
        builder: (context, hover, child) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.widthCard,
          padding: CvSizes.top30Left30Bottom30,
          decoration: BoxDecoration(
            color: CvColors.white,
            border: const Border(
              right: BorderSide(
                color: CvColors.orangeLight,
                width: 8,
              ),
            ),
            boxShadow: hover
                ? [
                    BoxShadow(
                      blurRadius: 30,
                      color: Theme.of(context).shadowColor.adjustOpacity(0.1),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: CvSizes.right22,
                child: Text(
                  widget.periode,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              const SizedBox(height: CvSizes.px15),
              const Divider(
                thickness: 8,
                color: CvColors.orangeLight,
              ),
              const SizedBox(height: CvSizes.px30),
              Padding(
                padding: CvSizes.right22,
                child: SelectableText(
                  widget.poste,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
              const SizedBox(height: CvSizes.px15),
              Padding(
                padding: CvSizes.right22,
                child: SelectableText(
                  widget.lieu,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: CvColors.greyDark,
                      ),
                ),
              ),
              if (widget.service != null)
                Padding(
                  padding: CvSizes.right22,
                  child: SelectableText(
                    widget.service!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: CvColors.greyDark,
                        ),
                  ),
                ),
              if (widget.description != null)
                Padding(
                  padding: CvSizes.right22,
                  child: SelectableText(
                    widget.description!,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          color: CvColors.greyDark,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
