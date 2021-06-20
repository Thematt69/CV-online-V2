import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_item_menu.dart';
import 'custom_shared_icon.dart';

enum Section {
  HEADER,
  PRESENTATION,
  COMPETENTCE,
  REALISATION,
  EXPERIENCE,
  CONTACT
}

class CustomDrawer extends StatefulWidget {
  final bool isShowDrawer;
  final ScrollController scrollController;
  final GlobalKey keyHeader;
  final GlobalKey keyPresentation;
  final GlobalKey keyCompetence;
  final GlobalKey keyRealisation;
  final GlobalKey keyExperience;
  final GlobalKey keyContact;

  const CustomDrawer({
    required this.scrollController,
    required this.isShowDrawer,
    Key? key,
    required this.keyHeader,
    required this.keyPresentation,
    required this.keyCompetence,
    required this.keyRealisation,
    required this.keyExperience,
    required this.keyContact,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool hoverAccueil = false;
  bool hoverAPropos = false;
  bool hoverCompetences = false;
  bool hoverRealisations = false;
  bool hoverExperiences = false;
  bool hoverContact = false;

  bool hoverMaps = false;
  bool hoverMail = false;
  bool hoverTel = false;
  bool hoverSeeMore = false;

  void _goTo(Section section) {
    double offset;
    switch (section) {
      case Section.HEADER:
        offset = 0;
        break;
      case Section.PRESENTATION:
        offset = (widget.keyHeader.currentContext?.size?.height ?? 0);
        break;
      case Section.COMPETENTCE:
        offset = (widget.keyHeader.currentContext?.size?.height ?? 0) +
            (widget.keyPresentation.currentContext?.size?.height ?? 0);
        break;
      case Section.REALISATION:
        offset = (widget.keyHeader.currentContext?.size?.height ?? 0) +
            (widget.keyPresentation.currentContext?.size?.height ?? 0) +
            (widget.keyCompetence.currentContext?.size?.height ?? 0);
        break;
      case Section.EXPERIENCE:
        offset = (widget.keyHeader.currentContext?.size?.height ?? 0) +
            (widget.keyPresentation.currentContext?.size?.height ?? 0) +
            (widget.keyCompetence.currentContext?.size?.height ?? 0) +
            (widget.keyRealisation.currentContext?.size?.height ?? 0);
        break;
      case Section.CONTACT:
        offset = (widget.keyHeader.currentContext?.size?.height ?? 0) +
            (widget.keyPresentation.currentContext?.size?.height ?? 0) +
            (widget.keyCompetence.currentContext?.size?.height ?? 0) +
            (widget.keyRealisation.currentContext?.size?.height ?? 0) +
            (widget.keyExperience.currentContext?.size?.height ?? 0);
        break;
      default:
        offset = 0;
        break;
    }
    widget.scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      left: 0,
      top: 0,
      bottom: 0,
      width: widget.isShowDrawer ? 180 : 0,
      child: Material(
        elevation: 20,
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(defaultPadding),
          color: whiteColor,
          child: _buildMenu(context),
        ),
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Visibility(
          visible: constraints.maxWidth > 36,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: MediaQuery.of(context).size.height > 550,
                child: Image.asset(
                  'images/Google_Assistant_logo.webp',
                  width: 140,
                  height: 140,
                ),
              ),
              Spacer(),
              CustomItemMenu(
                hover: hoverAccueil,
                title: 'Accueil',
                onHover: (value) {
                  setState(() {
                    hoverAccueil = !hoverAccueil;
                  });
                },
                onTap: () {
                  _goTo(Section.HEADER);
                },
              ),
              Divider(height: 1),
              CustomItemMenu(
                hover: hoverAPropos,
                title: 'Présenatation',
                onHover: (value) {
                  setState(() {
                    hoverAPropos = !hoverAPropos;
                  });
                },
                onTap: () {
                  _goTo(Section.PRESENTATION);
                },
              ),
              Divider(height: 1),
              CustomItemMenu(
                hover: hoverCompetences,
                title: 'Compétences',
                onHover: (value) {
                  setState(() {
                    hoverCompetences = !hoverCompetences;
                  });
                },
                onTap: () {
                  _goTo(Section.COMPETENTCE);
                },
              ),
              Divider(height: 1),
              CustomItemMenu(
                hover: hoverRealisations,
                title: 'Réalisations',
                onHover: (value) {
                  setState(() {
                    hoverRealisations = !hoverRealisations;
                  });
                },
                onTap: () {
                  _goTo(Section.REALISATION);
                },
              ),
              Divider(height: 1),
              CustomItemMenu(
                hover: hoverExperiences,
                title: 'Expériences',
                onHover: (value) {
                  setState(() {
                    hoverExperiences = !hoverExperiences;
                  });
                },
                onTap: () {
                  _goTo(Section.EXPERIENCE);
                },
              ),
              Divider(height: 1),
              CustomItemMenu(
                hover: hoverContact,
                title: 'Contact',
                onHover: (value) {
                  setState(() {
                    hoverContact = !hoverContact;
                  });
                },
                onTap: () {
                  _goTo(Section.CONTACT);
                },
              ),
              Spacer(),
              Visibility(
                visible: MediaQuery.of(context).size.height > 400,
                child: _buildSharedIcons(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSharedIcons(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        CustomSharedIcon(
          hover: hoverMaps,
          onPressed: () async => await canLaunch(urlMaps)
              ? await launch(urlMaps)
              : debugPrint('Could not launch $urlMaps'),
          title: 'Google Maps',
          iconData: Icons.location_pin,
          onEnter: (event) {
            setState(() {
              hoverMaps = true;
            });
          },
          onExit: (event) {
            setState(() {
              hoverMaps = false;
            });
          },
        ),
        CustomSharedIcon(
          hover: hoverMail,
          onPressed: () async => await canLaunch(urlMail)
              ? await launch(urlMail)
              : debugPrint('Could not launch $urlMail'),
          iconData: Icons.email,
          title: 'Adresse mail',
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
          title: 'Téléphone',
          onPressed: () async => await canLaunch(urlTel)
              ? await launch(urlTel)
              : debugPrint('Could not launch $urlTel'),
          hover: hoverTel,
          iconData: Icons.phone,
          onEnter: (event) {
            setState(() {
              hoverTel = true;
            });
          },
          onExit: (event) {
            setState(() {
              hoverTel = false;
            });
          },
        ),
        CustomSharedIcon(
          title: 'En voir plus',
          onPressed: () {
            _goTo(Section.CONTACT);
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
}
