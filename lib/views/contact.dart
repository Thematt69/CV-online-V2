import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';
import '../constants/sizes.dart';
import '../controllers/bloc_provider.dart';
import '../controllers/firestore_bloc.dart';
import '../models/contact.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

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
              text: AppLocalizations.of(context)!.contactViews_contact,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: AppLocalizations.of(context)!.contactViews_me,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
                final Contact contact = _firestoreBloc.contacts[index];
                return Padding(
                  padding: CvSizes.bottom16,
                  child: Wrap(
                    children: [
                      FaIcon(
                        contact.icon,
                        color: CvColors.greyDark,
                        size: 16,
                      ),
                      const SizedBox(width: CvSizes.px6),
                      Text(
                        '${contact.label.currentLang(context)} : ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                      ),
                      InkWell(
                        onTap: () async => launchUrl(Uri.parse(contact.url)),
                        child: Text(
                          contact.value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
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
