import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomCardJobs extends StatefulWidget {
  const CustomCardJobs({
    Key? key,
    required this.widthCard,
    required this.periode,
    required this.poste,
    required this.lieu,
    this.service,
    this.description,
  }) : super(key: key);

  final String? description;
  final String lieu;
  final String periode;
  final String poste;
  final String? service;
  final double widthCard;

  @override
  _CustomCardJobsState createState() => _CustomCardJobsState();
}

class _CustomCardJobsState extends State<CustomCardJobs> {
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
          padding: const EdgeInsets.only(
            top: defaultPadding30,
            left: defaultPadding30,
            bottom: defaultPadding30,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            border: const Border(
              right: BorderSide(
                color: orangeLightColor,
                width: 8,
              ),
            ),
            boxShadow: hover
                ? [
                    BoxShadow(
                      blurRadius: 30,
                      color: Theme.of(context).shadowColor.withOpacity(0.1),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding30 - 8),
                child: Text(
                  widget.periode,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              const SizedBox(height: defaultPadding30 / 2),
              const Divider(
                thickness: 8,
                color: orangeLightColor,
              ),
              const SizedBox(height: defaultPadding30),
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding30 - 8),
                child: Text(
                  widget.poste,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              const SizedBox(height: defaultPadding30 / 2),
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding30 - 8),
                child: Text(
                  widget.lieu,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: greyDarkColor,
                      ),
                ),
              ),
              if (widget.service != null)
                Padding(
                  padding: const EdgeInsets.only(right: defaultPadding30 - 8),
                  child: Text(
                    widget.service!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: greyDarkColor,
                        ),
                  ),
                ),
              if (widget.description != null)
                Padding(
                  padding: const EdgeInsets.only(right: defaultPadding30 - 8),
                  child: Text(
                    widget.description!,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w400,
                          color: greyDarkColor,
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
