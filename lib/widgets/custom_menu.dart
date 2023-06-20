import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/assets.dart';
import '../constants/sections.dart';
import 'custom_item_menu.dart';
import 'custom_shared_icons.dart';

class CustomMenu extends StatefulWidget {
  final ScrollController scrollController;

  const CustomMenu({
    super.key,
    required this.scrollController,
  });

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  final ValueNotifier<bool> _hoverAPropos = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverAccueil = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverCompetences = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverContact = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverEtudes = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverJobs = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverRealisations = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _hoverRecommandation = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hoverAPropos.dispose();
    _hoverAccueil.dispose();
    _hoverCompetences.dispose();
    _hoverContact.dispose();
    _hoverEtudes.dispose();
    _hoverJobs.dispose();
    _hoverRealisations.dispose();
    _hoverRecommandation.dispose();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: MediaQuery.of(context).size.height > 550,
          child: Image.asset(
            CvAssets.logo1833,
            width: 140,
            height: 140,
            errorBuilder: (_, __, ___) => const SizedBox(
              width: 140,
              height: 140,
            ),
          ),
        ),
        const Spacer(),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverAccueil,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_home,
            onHover: (value) {
              _hoverAccueil.value = value;
            },
            onTap: () {
              _goTo(Section.header);
            },
          ),
        ),
        const Divider(height: 1),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverAPropos,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_presentation,
            onHover: (value) {
              _hoverAPropos.value = value;
            },
            onTap: () {
              _goTo(Section.presentation);
            },
          ),
        ),
        const Divider(height: 1),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverCompetences,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_competence,
            onHover: (value) {
              _hoverCompetences.value = value;
            },
            onTap: () {
              _goTo(Section.competence);
            },
          ),
        ),
        const Divider(height: 1),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverRealisations,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_realisation,
            onHover: (value) {
              _hoverRealisations.value = value;
            },
            onTap: () {
              _goTo(Section.realisation);
            },
          ),
        ),
        const Divider(height: 1),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverEtudes,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_etudes,
            onHover: (value) {
              _hoverEtudes.value = value;
            },
            onTap: () {
              _goTo(Section.etudes);
            },
          ),
        ),
        const Divider(height: 1),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverRecommandation,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_recommandation,
            onHover: (value) {
              _hoverRecommandation.value = value;
            },
            onTap: () {
              _goTo(Section.recommandation);
            },
          ),
        ),
        const Divider(height: 1),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverJobs,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_jobs,
            onHover: (value) {
              _hoverJobs.value = value;
            },
            onTap: () {
              _goTo(Section.jobs);
            },
          ),
        ),
        const Divider(height: 1),
        ValueListenableBuilder<bool>(
          valueListenable: _hoverContact,
          builder: (context, hover, child) => CustomItemMenu(
            hover: hover,
            title: AppLocalizations.of(context)!.drawer_contact,
            onHover: (value) {
              _hoverContact.value = value;
            },
            onTap: () {
              _goTo(Section.contact);
            },
          ),
        ),
        const Spacer(),
        Visibility(
          visible: MediaQuery.of(context).size.height > 445,
          child: CustomSharedIcons(scrollController: widget.scrollController),
        ),
      ],
    );
  }
}
