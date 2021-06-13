import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cv_online_v2/constants/theme_datas.dart';
import 'package:cv_online_v2/responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constants/colors.dart';
import 'constants/sizes.dart';
import 'constants/urls.dart';

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
            _buildDrawer(),
          ],
        ),
      ),
    );
  }

  void _goTo(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.linear,
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

  Widget _buildDrawer() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      left: 0,
      top: 0,
      bottom: 0,
      width: isShowDrawer ? 180 : 0,
      child: Material(
        elevation: 20,
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(defaultPadding),
          color: whiteColor,
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
              InkWell(
                onHover: (value) {
                  setState(() {
                    hoverAccueil = !hoverAccueil;
                  });
                },
                onTap: () {
                  _goTo(0);
                },
                child: Container(
                  width: 180 - (defaultPadding * 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 3),
                  child: Text(
                    'Accueil',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: hoverAccueil
                              ? Theme.of(context).colorScheme.primary
                              : blackColor,
                        ),
                  ),
                ),
              ),
              Divider(height: 1),
              InkWell(
                onHover: (value) {
                  setState(() {
                    hoverAPropos = !hoverAPropos;
                  });
                },
                onTap: () {
                  _goTo(MediaQuery.of(context).size.height);
                },
                child: Container(
                  width: 180 - (defaultPadding * 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 3),
                  child: Text(
                    'A propos',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: hoverAPropos
                              ? Theme.of(context).colorScheme.primary
                              : blackColor,
                        ),
                  ),
                ),
              ),
              Divider(height: 1),
              InkWell(
                onHover: (value) {
                  setState(() {
                    hoverCompetences = !hoverCompetences;
                  });
                },
                onTap: () {
                  // TODO - Rédiriger à la section [Compétences]
                },
                child: Container(
                  width: 180 - (defaultPadding * 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 3),
                  child: Text(
                    'Compétences',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: hoverCompetences
                              ? Theme.of(context).colorScheme.primary
                              : blackColor,
                        ),
                  ),
                ),
              ),
              Divider(height: 1),
              InkWell(
                onHover: (value) {
                  setState(() {
                    hoverRealisations = !hoverRealisations;
                  });
                },
                onTap: () {
                  // TODO - Rédiriger à la section [Réalisations]
                },
                child: Container(
                  width: 180 - (defaultPadding * 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 3),
                  child: Text(
                    'Réalisations',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: hoverRealisations
                              ? Theme.of(context).colorScheme.primary
                              : blackColor,
                        ),
                  ),
                ),
              ),
              Divider(height: 1),
              InkWell(
                onHover: (value) {
                  setState(() {
                    hoverExperiences = !hoverExperiences;
                  });
                },
                onTap: () {
                  // TODO - Rédiriger à la section [Expériences]
                },
                child: Container(
                  width: 180 - (defaultPadding * 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 3),
                  child: Text(
                    'Expériences',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: hoverExperiences
                              ? Theme.of(context).colorScheme.primary
                              : blackColor,
                        ),
                  ),
                ),
              ),
              Divider(height: 1),
              InkWell(
                onHover: (value) {
                  setState(() {
                    hoverContact = !hoverContact;
                  });
                },
                onTap: () {
                  // TODO - Rédiriger à la section [Contact]
                },
                child: Container(
                  width: 180 - (defaultPadding * 2),
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 3),
                  child: Text(
                    'Contact',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: hoverContact
                              ? Theme.of(context).colorScheme.primary
                              : blackColor,
                        ),
                  ),
                ),
              ),
              Spacer(),
              Visibility(
                visible: MediaQuery.of(context).size.height > 400,
                child: _buildSharedIcons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSharedIcons() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        MouseRegion(
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
          child: IconButton(
            onPressed: () async => await canLaunch(urlMaps)
                ? await launch(urlMaps)
                : debugPrint('Could not launch $urlMaps'),
            icon: Icon(
              Icons.location_pin,
              color: hoverMaps ? Theme.of(context).hoverColor : blackColor,
            ),
            splashRadius: defaultSplashRadius,
            iconSize: defaultIconSize,
            tooltip: 'Google Maps',
          ),
        ),
        MouseRegion(
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
          child: IconButton(
            onPressed: () async => await canLaunch(urlMail)
                ? await launch(urlMail)
                : debugPrint('Could not launch $urlMail'),
            icon: Icon(
              Icons.email,
              color: hoverMail ? Theme.of(context).hoverColor : blackColor,
            ),
            splashRadius: defaultSplashRadius,
            iconSize: defaultIconSize,
            tooltip: 'Adresse mail',
          ),
        ),
        MouseRegion(
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
          child: IconButton(
            onPressed: () async => await canLaunch(urlTel)
                ? await launch(urlTel)
                : debugPrint('Could not launch $urlTel'),
            icon: Icon(
              Icons.phone,
              color: hoverTel ? Theme.of(context).hoverColor : blackColor,
            ),
            splashRadius: defaultSplashRadius,
            iconSize: defaultIconSize,
            tooltip: 'Téléphone',
          ),
        ),
        MouseRegion(
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
          child: IconButton(
            onPressed: () {
              // TODO - Amener à la section [CONTACT]
            },
            icon: Icon(
              Icons.add_box_outlined,
              color: hoverSeeMore ? Theme.of(context).hoverColor : blackColor,
            ),
            splashRadius: defaultSplashRadius,
            iconSize: defaultIconSize,
            tooltip: 'En voir plus',
          ),
        ),
      ],
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
            _buildHeader(context),
            _buildPresentation(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: darkLightColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: Responsive.isDesktop(context),
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(130),
                image: DecorationImage(
                  image: AssetImage(
                    'images/IMG_20180831_004109_835.webp',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: defaultPadding * 2),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: !Responsive.isDesktop(context),
                  child: Container(
                    width: 260,
                    height: 260,
                    margin: const EdgeInsets.only(bottom: defaultPadding * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(130),
                      image: DecorationImage(
                        image: AssetImage(
                          'images/IMG_20180831_004109_835.webp',
                        ),
                      ),
                    ),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'DEVILLIERS ',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    Text(
                      'Matthieu',
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Je suis ',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                      overflow: TextOverflow.ellipsis,
                      child: _buildAnimatedTextKit(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: defaultPadding * 2),
        ],
      ),
    );
  }

  Widget _buildPresentation(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Je suis DEVILLIERS Matthieu et ',
                style: Theme.of(context).textTheme.headline2,
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                overflow: TextOverflow.ellipsis,
                child: _buildAnimatedTextKit(),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          RichText(
            text: TextSpan(
              text: 'Mon nom est ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: greyColor,
                  ),
              children: <TextSpan>[
                TextSpan(
                  text: 'DEVILLIERS Matthieu',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                TextSpan(
                  text:
                      ". Je suis développeur web et Android, passionné et dévoué pour mes études et mon avenir. Avec 29 semaines de stage en entreprise, j'ai acquis les compétences et les connaissances nécessaires pour finaliser mes études et intégrer le monde du travail via l'alternance ou l'apprentissage.",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: greyColor,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildCardPresentation(
                  context: context,
                  label: 'Date de naissance',
                  value: '29/09/2000',
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Age',
                  value:
                      '${DateTime.now().difference(DateTime(2000, 09, 29)).inDays ~/ 365.25} ans',
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Mobilité',
                  value: 'Permis B',
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Localisation',
                  value: '2 Rue Jean Jacques Rousseau, Corbas 69960, France',
                  url: urlMaps,
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Intérêts',
                  value:
                      'Jeux vidéo, Photographie, Streaming & Vidéo, Musique, Rollers, Vélo, Informatique',
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Diplôme',
                  value:
                      'BAC Système Electronique et Numérique & BTS Système Numérique, option Informatique et Réseaux',
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'École',
                  value: 'XEFI ACADEMY en partenariat avec EPSI',
                  url: urlXefiAcademy,
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Formation',
                  value: "Concepteur Développeur d'Application",
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Entreprise',
                  value: 'XEFI Software',
                  url: urlXefi,
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Adresse mail',
                  value: 'devilliers.matthieu@gmail.com',
                  url: urlMail,
                ),
                _buildCardPresentation(
                  context: context,
                  label: 'Téléphone',
                  value: '06 45 56 48 45',
                  url: urlTel,
                ),
              ],
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async => await canLaunch(urlCV)
                    ? await launch(urlCV)
                    : debugPrint('Could not launch $urlCV'),
                child: Text('Télécharger CV'),
              ),
              const SizedBox(width: defaultPadding * 2),
              ElevatedButton(
                onPressed: () {
                  // TODO - Déplacer vers la section [CONTACT]
                },
                child: Text('Me contacter'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardPresentation({
    required BuildContext context,
    required String label,
    required String value,
    String? url,
  }) {
    return Container(
      color: orangeLightColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label : ',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Flexible(
            child: InkWell(
              onTap: url != null
                  ? () async => await canLaunch(url)
                      ? await launch(url)
                      : debugPrint('Could not launch $url')
                  : null,
              child: Text(
                value,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: url != null
                          ? Theme.of(context).colorScheme.primary
                          : greyColor,
                      height: 1.6,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedTextKit _buildAnimatedTextKit() {
    return AnimatedTextKit(
      totalRepeatCount: 100,
      pause: const Duration(seconds: 1),
      animatedTexts: [
        TypewriterAnimatedText(
          'Développeur Flutter',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Joueur amateur',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Développeur Web',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Photographe amateur',
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Développeur Android',
          speed: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
