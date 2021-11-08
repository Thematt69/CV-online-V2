import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_item_menu.dart';
import 'custom_shared_icon.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    required this.scrollController,
    required this.isShowDrawer,
    Key? key,
  }) : super(key: key);

  final bool isShowDrawer;
  final ScrollController scrollController;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool hoverAPropos = false;
  bool hoverAccueil = false;
  bool hoverCompetences = false;
  bool hoverContact = false;
  bool hoverEtudes = false;
  bool hoverJobs = false;
  bool hoverMail = false;
  bool hoverGitHub = false;
  bool hoverRealisations = false;
  bool hoverRecommandation = false;
  bool hoverSeeMore = false;
  bool hoverLinkedin = false;

  void _goTo(Section section) {
    widget.scrollController.animateTo(
      positionToSection(section),
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: MediaQuery.of(context).size.height > 550,
          child: Image.asset(
            'assets/images/Google_Assistant_logo.webp',
            width: 140,
            height: 140,
          ),
        ),
        const Spacer(),
        CustomItemMenu(
          hover: hoverAccueil,
          title: translations.text('drawer.home'),
          onHover: (value) {
            setState(() {
              hoverAccueil = !hoverAccueil;
            });
          },
          onTap: () {
            _goTo(Section.header);
          },
        ),
        const Divider(height: 1),
        CustomItemMenu(
          hover: hoverAPropos,
          title: translations.text('drawer.presentation'),
          onHover: (value) {
            setState(() {
              hoverAPropos = !hoverAPropos;
            });
          },
          onTap: () {
            _goTo(Section.presentation);
          },
        ),
        const Divider(height: 1),
        CustomItemMenu(
          hover: hoverCompetences,
          title: translations.text('drawer.competence'),
          onHover: (value) {
            setState(() {
              hoverCompetences = !hoverCompetences;
            });
          },
          onTap: () {
            _goTo(Section.competence);
          },
        ),
        const Divider(height: 1),
        CustomItemMenu(
          hover: hoverRealisations,
          title: translations.text('drawer.realisation'),
          onHover: (value) {
            setState(() {
              hoverRealisations = !hoverRealisations;
            });
          },
          onTap: () {
            _goTo(Section.realisation);
          },
        ),
        const Divider(height: 1),
        CustomItemMenu(
          hover: hoverEtudes,
          title: translations.text('drawer.etudes'),
          onHover: (value) {
            setState(() {
              hoverEtudes = !hoverEtudes;
            });
          },
          onTap: () {
            _goTo(Section.etudes);
          },
        ),
        const Divider(height: 1),
        CustomItemMenu(
          hover: hoverRecommandation,
          title: translations.text('drawer.recommandation'),
          onHover: (value) {
            setState(() {
              hoverRecommandation = !hoverRecommandation;
            });
          },
          onTap: () {
            _goTo(Section.recommandation);
          },
        ),
        const Divider(height: 1),
        CustomItemMenu(
          hover: hoverJobs,
          title: translations.text('drawer.jobs'),
          onHover: (value) {
            setState(() {
              hoverJobs = !hoverJobs;
            });
          },
          onTap: () {
            _goTo(Section.jobs);
          },
        ),
        const Divider(height: 1),
        CustomItemMenu(
          hover: hoverContact,
          title: translations.text('drawer.contact'),
          onHover: (value) {
            setState(() {
              hoverContact = !hoverContact;
            });
          },
          onTap: () {
            _goTo(Section.contact);
          },
        ),
        const Spacer(),
        Visibility(
          visible: MediaQuery.of(context).size.height > 445,
          child: _buildSharedIcons(context),
        ),
      ],
    );
  }

  Widget _buildSharedIcons(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        CustomSharedIcon(
          hover: hoverMail,
          onPressed: () async => launch(urlMail),
          iconData: Icons.email,
          title: translations.text('drawer.email'),
          onEnter: (event) {
            setState(() {
              hoverMail = true;
            });
          },
          onExit: (event) {
            setState(() {
              hoverMail = false;
            });
          },
        ),
        CustomSharedIcon(
          title: translations.text('drawer.linkedin'),
          onPressed: () async => launch(urlLinkedin),
          hover: hoverLinkedin,
          iconData: FontAwesomeIcons.linkedinIn,
          onEnter: (event) {
            setState(() {
              hoverLinkedin = true;
            });
          },
          onExit: (event) {
            setState(() {
              hoverLinkedin = false;
            });
          },
        ),
        CustomSharedIcon(
          title: translations.text('drawer.github'),
          onPressed: () async => launch(urlGithub),
          hover: hoverGitHub,
          iconData: FontAwesomeIcons.github,
          onEnter: (event) {
            setState(() {
              hoverGitHub = true;
            });
          },
          onExit: (event) {
            setState(() {
              hoverGitHub = false;
            });
          },
        ),
        CustomSharedIcon(
          title: translations.text('drawer.see_more'),
          onPressed: () {
            _goTo(Section.contact);
          },
          hover: hoverSeeMore,
          iconData: Icons.add_box_outlined,
          onEnter: (event) {
            setState(() {
              hoverSeeMore = true;
            });
          },
          onExit: (event) {
            setState(() {
              hoverSeeMore = false;
            });
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      left: widget.isShowDrawer ? 0 : -180,
      top: 0,
      bottom: 0,
      width: 180,
      child: Material(
        elevation: 20,
        child: Container(
          width: 180,
          padding: EdgeInsets.symmetric(
            horizontal: defaultPadding30,
            vertical: MediaQuery.of(context).size.height > 390
                ? defaultPadding30
                : defaultPadding10,
          ),
          color: whiteColor,
          child: _buildMenu(context),
        ),
      ),
    );
  }
}
