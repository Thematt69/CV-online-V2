import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/localization/localization.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    Key? key,
  }) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  late final _firestoreBloc = BlocProvider.of<FirestoreBloc>(context);

  @override
  void dispose() {
    _firestoreBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CvColors.white,
      width: MediaQuery.of(context).size.width,
      padding: CvSizes.hor30ver60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: translations.text('views_contact.contact'),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: translations.text('views_contact.me'),
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(height: CvSizes.px30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              _firestoreBloc.contacts.length,
              (index) {
                final Contact _contact = _firestoreBloc.contacts[index];
                return Padding(
                  padding: CvSizes.bottom16,
                  child: Wrap(
                    children: [
                      FaIcon(
                        _contact.icon,
                        color: CvColors.greyDark,
                        size: 16,
                      ),
                      const SizedBox(width: CvSizes.px6),
                      Text(
                        '${_contact.label.currentLang} : ',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                      ),
                      // TODO - Cacher et afficher au clic (pour le mail uniquement) - Eviter le spam robot
                      InkWell(
                        onTap: () async => launch(_contact.url),
                        child: Text(
                          _contact.value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                height: 1,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
