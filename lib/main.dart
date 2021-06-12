import 'package:cv_online_v2/constants/theme_datas.dart';
import 'package:cv_online_v2/responsive.dart';
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

class MyHomePage extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            _buildDrawer(),
            Expanded(
              child: _buildContents(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        // FIXME : Ne s'affiche pas correctement
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.09),
            spreadRadius: 4,
            blurRadius: 20,
            offset: Offset(15, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'images/Google_Assistant_logo.webp',
            width: 140,
            height: 140,
          ),
          Spacer(),
          Text('Accueil'),
          Divider(),
          Text('A propos'),
          Divider(),
          Text('Compétences'),
          Divider(),
          Text('Réalisations'),
          Divider(),
          Text('Expériences'),
          Divider(),
          Text('Contact'),
          Spacer(),
          _buildSharedIcons(),
        ],
      ),
    );
  }

  Widget _buildSharedIcons() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.location_pin),
          splashRadius: defaultSplashRadius,
          iconSize: defaultIconSize,
          tooltip: 'Google Maps',
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.email),
          splashRadius: defaultSplashRadius,
          iconSize: defaultIconSize,
          tooltip: 'Adresse mail',
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.phone),
          splashRadius: defaultSplashRadius,
          iconSize: defaultIconSize,
          tooltip: 'Téléphone',
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_box_outlined),
          splashRadius: defaultSplashRadius,
          iconSize: defaultIconSize,
          tooltip: 'En voir plus',
        ),
      ],
    );
  }

  Widget _buildContents(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: Responsive.isDesktop(context),
      child: SingleChildScrollView(
        controller: scrollController,
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
        children: [
          Container(
            width: 260,
            height: 260,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(130),
              image: DecorationImage(
                image: AssetImage(
                  'images/IMG_20180831_004109_835.webp',
                ),
              ),
            ),
          ),
          Divider(
            color: whiteDarkerColor,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
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
                Text(
                  'Je suis Développeur Flutter',
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                ),
              ],
            ),
          ),
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
        children: [
          Text(
            'Je suis DEVILLIERS Matthieu et Développeur Flutter',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: defaultPadding),
          Text(
            "Mon nom est DEVILLIERS Matthieu. Je suis développeur web et Android, passionné et dévoué pour mes études et mon avenir. Avec 29 semaines de stage en entreprise, j'ai acquis les compétences et les connaissances nécessaires pour finaliser mes études et intégrer le monde du travail via l'alternance ou l'apprentissage.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
