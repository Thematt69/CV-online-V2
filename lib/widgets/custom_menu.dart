import 'package:cv_online_v2/constants/assets.dart';
import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/widgets/custom_item_menu.dart';
import 'package:cv_online_v2/widgets/custom_shared_icons.dart';
import 'package:flutter/material.dart';

class CustomMenu extends StatefulWidget {
  final ScrollController scrollController;

  const CustomMenu({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

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
            title: translations.text('drawer.home'),
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
            title: translations.text('drawer.presentation'),
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
            title: translations.text('drawer.competence'),
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
            title: translations.text('drawer.realisation'),
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
            title: translations.text('drawer.etudes'),
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
            title: translations.text('drawer.recommandation'),
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
            title: translations.text('drawer.jobs'),
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
            title: translations.text('drawer.contact'),
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
