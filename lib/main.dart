import 'package:cv_online_v2/constants/theme_datas.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:cv_online_v2/views/header.dart';
import 'package:cv_online_v2/views/presentation.dart';
import 'package:cv_online_v2/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'constants/colors.dart';
import 'constants/sizes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _controller;
  late final Animation<double> _myAnimation;
  bool isShowDrawer = true;

  final GlobalKey _keyHeader = GlobalKey();
  final GlobalKey _keyPresentation = GlobalKey();
  final GlobalKey _keyCompetence = GlobalKey();
  final GlobalKey _keyRealisation = GlobalKey();
  final GlobalKey _keyExperience = GlobalKey();
  final GlobalKey _keyContact = GlobalKey();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
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
              keyHeader: _keyHeader,
              keyPresentation: _keyPresentation,
              keyCompetence: _keyCompetence,
              keyContact: _keyContact,
              keyExperience: _keyExperience,
              keyRealisation: _keyRealisation,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCursorVisibleDrawer() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      top: defaultPadding,
      left: isShowDrawer ? 180 : 0,
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.only(
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
            Header(
              key: _keyHeader,
            ),
            Presentation(
              key: _keyPresentation,
              scrollController: _scrollController,
              keyHeader: _keyHeader,
              keyPresentation: _keyPresentation,
              keyCompetence: _keyCompetence,
              keyContact: _keyContact,
              keyExperience: _keyExperience,
              keyRealisation: _keyRealisation,
            ),
          ],
        ),
      ),
    );
  }
}
