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
import 'package:cv_online_v2/widgets/popup_menu_button_language.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                    isAlwaysShown: Responsive.isDesktop(context),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          HeaderSection(
                            key: keyHeader,
                          ),
                          PresentationSection(
                            key: keyPresentation,
                            scrollController: _scrollController,
                          ),
                          CompetenceSection(
                            key: keyCompetence,
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isShowDrawer,
                            builder: (context, isShowDrawer, child) =>
                                RealisationSection(
                              key: keyRealisation,
                              isShowDrawer: isShowDrawer,
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isShowDrawer,
                            builder: (context, isShowDrawer, child) =>
                                EtudesSection(
                              key: keyEtudes,
                              isShowDrawer: isShowDrawer,
                            ),
                          ),
                          RecommandationSection(
                            key: keyRecommandation,
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _isShowDrawer,
                            builder: (context, isShowDrawer, child) =>
                                JobsSection(
                              key: keyJobs,
                              isShowDrawer: isShowDrawer,
                            ),
                          ),
                          ContactSection(
                            key: keyContact,
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
            const PopupMenuButtonLanguage(),
          ],
        ),
      ),
    );
  }
}
