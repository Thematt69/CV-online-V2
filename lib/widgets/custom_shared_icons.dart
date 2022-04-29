import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/widgets/custom_shared_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomSharedIcons extends StatefulWidget {
  final ScrollController scrollController;

  const CustomSharedIcons({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<CustomSharedIcons> createState() => _CustomSharedIconsState();
}

class _CustomSharedIconsState extends State<CustomSharedIcons> {
  final ValueNotifier<bool> _hoverMail = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverGitHub = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverSeeMore = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverLinkedin = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hoverMail.dispose();
    _hoverGitHub.dispose();
    _hoverSeeMore.dispose();
    _hoverLinkedin.dispose();
    super.dispose();
  }

  void _goTo(Section section) {
    widget.scrollController.animateTo(
      CvSections.positionToSection(section),
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: _hoverMail,
          builder: (context, hover, child) => CustomSharedIcon(
            hover: hover,
            onPressed: () async => launch(CvUrls.urlMail),
            iconData: Icons.email,
            title: translations.text('drawer.email'),
            onEnter: (event) {
              _hoverMail.value = true;
            },
            onExit: (event) {
              _hoverMail.value = false;
            },
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverLinkedin,
          builder: (context, hover, child) => CustomSharedIcon(
            title: translations.text('drawer.linkedin'),
            onPressed: () async => launch(CvUrls.urlLinkedin),
            hover: hover,
            iconData: FontAwesomeIcons.linkedinIn,
            onEnter: (event) {
              _hoverLinkedin.value = true;
            },
            onExit: (event) {
              _hoverLinkedin.value = false;
            },
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverGitHub,
          builder: (context, hover, child) => CustomSharedIcon(
            title: translations.text('drawer.github'),
            onPressed: () async => launch(CvUrls.urlGithub),
            hover: hover,
            iconData: FontAwesomeIcons.github,
            onEnter: (event) {
              _hoverGitHub.value = true;
            },
            onExit: (event) {
              _hoverGitHub.value = false;
            },
          ),
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverSeeMore,
          builder: (context, hover, child) => CustomSharedIcon(
            title: translations.text('drawer.see_more'),
            onPressed: () {
              _goTo(Section.contact);
            },
            hover: hover,
            iconData: Icons.add_box_outlined,
            onEnter: (event) {
              _hoverSeeMore.value = true;
            },
            onExit: (event) {
              _hoverSeeMore.value = false;
            },
          ),
        ),
      ],
    );
  }
}
