import 'package:cv_online_v2/constants/theme_datas.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/views/contact.dart';
import 'package:cv_online_v2/views/etudes.dart';
import 'package:cv_online_v2/views/jobs.dart';
import 'package:cv_online_v2/views/header.dart';
import 'package:cv_online_v2/views/presentation.dart';
import 'package:cv_online_v2/views/reallisation.dart';
import 'package:cv_online_v2/views/recommandation.dart';
import 'package:cv_online_v2/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'constants/colors.dart';
import 'constants/contents.dart';
import 'constants/sections.dart';
import 'constants/sizes.dart';
import 'views/competence.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // Here we set the URL strategy for our web app.
  // It is safe to call this function when running on mobile or desktop as well.
  setPathUrlStrategy();
  initializeDateFormatting();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV en ligne - DEVILLIERS Matthieu',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(),
      locale: const Locale('fr', 'FR'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _controller;
  late final Animation<double> _myAnimation;
  bool isShowDrawer = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 1,
    );

    _myAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: _controller,
    );
  }

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
                      isShowDrawer && Responsive.isDesktop(context) ? 180 : 0,
                ),
                Expanded(
                  child: _buildContents(context),
                ),
              ],
            ),
            _buildCursorVisibleDrawer(),
            CustomDrawer(
              isShowDrawer: isShowDrawer,
              scrollController: _scrollController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCursorVisibleDrawer() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: defaultPadding30,
      left: isShowDrawer ? 180 : 0,
      child: Material(
        elevation: 20,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            onTap: () {
              setState(() {
                if (isShowDrawer) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
                isShowDrawer = !isShowDrawer;
              });
            },
            child: Center(
              child: Tooltip(
                message: isShowDrawer ? 'Cacher le menu' : 'Afficher le menu',
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_arrow,
                  progress: _myAnimation,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    return Scrollbar(
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
              isShowDrawer: isShowDrawer,
            ),
            EtudesSection(
              key: keyEtudes,
              isShowDrawer: isShowDrawer,
            ),
            RecommandationSection(
              key: keyRecommandation,
            ),
            JobsSection(
              key: keyJobs,
              isShowDrawer: isShowDrawer,
            ),
            ContactSection(
              key: keyContact,
            ),
            Container(
              color: darkLightColor,
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding60,
                horizontal: defaultPadding16,
              ),
              child: copyrightFooter,
            ),
          ],
        ),
      ),
    );
  }
}
