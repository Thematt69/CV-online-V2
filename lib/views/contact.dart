import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/constants/colors.dart';
import 'package:cv_online_v2/constants/sizes.dart';
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
  final Stream<QuerySnapshot<Map<String, dynamic>>> _contactsStream =
      FirebaseFirestore.instance.collection('contacts').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding30,
        vertical: defaultPadding60,
      ),
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
          const SizedBox(height: defaultPadding30),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _contactsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return Text(
                  'Erreur lors de la récupération des contacts',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.all(4),
                      child: const CircularProgressIndicator(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Récupération des contacts en cours...',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                    ),
                  ],
                );
              }

              final List<Contact> listContacts = snapshot.data!.docs
                  .map((document) => Contact.fromFireStore(document.data()))
                  .toList();

              listContacts.sort(
                (a, b) => a.label.currentLang.compareTo(b.label.currentLang),
              );

              return Column(
                children: List.generate(
                  listContacts.length,
                  (index) {
                    final Contact contact = listContacts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: defaultPadding16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FaIcon(
                            contact.icon,
                            color: greyDarkColor,
                            size: 16,
                          ),
                          const SizedBox(width: defaultPadding6),
                          Text(
                            "${contact.label.currentLang} : ",
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                          ),
                          // TODO - Cacher et afficher au clic (pour le mail uniquement) - Eviter le spam robot
                          Expanded(
                            child: InkWell(
                              onTap: () async => launch(contact.url),
                              child: Text(
                                contact.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      height: 1,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
