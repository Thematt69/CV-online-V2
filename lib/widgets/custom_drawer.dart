import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/constants/urls.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_online_v2/constants/sections.dart';

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
  bool hoverMaps = false;
  bool hoverRealisations = false;
  bool hoverRecommandation = false;
  bool hoverSeeMore = false;
  bool hoverTel = false;

  void _goTo(Section section) {
    widget.scrollController.animateTo(
      positionToSection(section),
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
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
              const Spacer(),
              CustomItemMenu(
                hover: hoverAccueil,
                title: 'Accueil',
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
                title: 'Présentation',
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
                title: 'Compétences',
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
                title: 'Réalisations',
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
                title: 'Études',
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
                title: 'Recommandation',
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
                title: 'Jobs',
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
                title: 'Contact',
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
          onPressed: () async => await launch(urlMaps),
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
          onPressed: () async => await launch(urlMail),
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
          onPressed: () async => await launch(urlTel),
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
      left: 0,
      top: 0,
      bottom: 0,
      width: widget.isShowDrawer ? 180 : 0,
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
