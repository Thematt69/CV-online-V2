import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/controllers/firestore_bloc.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
              text: tr('contactViews_contact'),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              children: <TextSpan>[
                const TextSpan(text: ' '),
                TextSpan(
                  text: tr('contactViews_me'),
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
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
