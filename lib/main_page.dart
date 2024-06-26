import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/views/competence.dart';
import 'package:cv_online_v2/views/contact.dart';
import 'package:cv_online_v2/views/etudes.dart';
import 'package:cv_online_v2/views/footer.dart';
import 'package:cv_online_v2/views/header.dart';
import 'package:cv_online_v2/views/jobs.dart';
import 'package:cv_online_v2/views/presentation.dart';
import 'package:cv_online_v2/views/realisation.dart';
import 'package:cv_online_v2/views/recommandation.dart';
import 'package:cv_online_v2/widgets/custom_drawer.dart';
import 'package:cv_online_v2/widgets/icon_button_drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final ValueNotifier<bool> _isShowDrawer = ValueNotifier<bool>(kIsWeb);
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _isShowDrawer.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                ValueListenableBuilder<bool>(
                  valueListenable: _isShowDrawer,
                  builder: (context, isShowDrawer, child) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width:
                        isShowDrawer && Responsive.isDesktop(context) ? 180 : 0,
                  ),
                ),
                Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: Responsive.isDesktop(context),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          HeaderSection(
                            key: CvSections.keyHeader,
                          ),
                          PresentationSection(
                            key: CvSections.keyPresentation,
                            scrollController: _scrollController,
                          ),
                          CompetenceSection(
                            key: CvSections.keyCompetence,
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isShowDrawer,
                            builder: (context, isShowDrawer, child) =>
                                RealisationSection(
                              key: CvSections.keyRealisation,
                              isShowDrawer: isShowDrawer,
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isShowDrawer,
                            builder: (context, isShowDrawer, child) =>
                                EtudesSection(
                              key: CvSections.keyEtudes,
                              isShowDrawer: isShowDrawer,
                            ),
                          ),
                          RecommandationSection(
                            key: CvSections.keyRecommandation,
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isShowDrawer,
                            builder: (context, isShowDrawer, child) =>
                                JobsSection(
                              key: CvSections.keyJobs,
                              isShowDrawer: isShowDrawer,
                            ),
                          ),
                          ContactSection(
                            key: CvSections.keyContact,
                          ),
                          const FooterSection(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isShowDrawer,
              builder: (context, isShowDrawer, child) => IconButtonDrawer(
                isShowDrawer: isShowDrawer,
                onShowDrawer: (isShowDrawer) {
                  _isShowDrawer.value = isShowDrawer;
                },
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isShowDrawer,
              builder: (context, isShowDrawer, child) => CustomDrawer(
                isShowDrawer: isShowDrawer,
                scrollController: _scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
