import 'package:cv_online_v2/constants/sections.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/views/competence.dart';
import 'package:cv_online_v2/views/contact.dart';
import 'package:cv_online_v2/views/etudes.dart';
import 'package:cv_online_v2/views/footer.dart';
import 'package:cv_online_v2/views/header.dart';
import 'package:cv_online_v2/views/jobs.dart';
import 'package:cv_online_v2/views/presentation.dart';
import 'package:cv_online_v2/views/reallisation.dart';
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

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  final bool _isShowDrawer = kIsWeb;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width:
                      _isShowDrawer && Responsive.isDesktop(context) ? 180 : 0,
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
                          RealisationSection(
                            key: keyRealisation,
                            isShowDrawer: _isShowDrawer,
                          ),
                          EtudesSection(
                            key: keyEtudes,
                            isShowDrawer: _isShowDrawer,
                          ),
                          RecommandationSection(
                            key: keyRecommandation,
                          ),
                          JobsSection(
                            key: keyJobs,
                            isShowDrawer: _isShowDrawer,
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
            const IconButtonDrawer(),
            CustomDrawer(
              isShowDrawer: _isShowDrawer,
              scrollController: _scrollController,
            ),
            const PopupMenuButtonLanguage(),
          ],
        ),
      ),
    );
  }
}
