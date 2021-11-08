import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/models/jobs.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  final Stream<QuerySnapshot<Map<String, dynamic>>> _contactsStream =
      FirebaseFirestore.instance.collection('contacts').snapshots();
  final Stream<QuerySnapshot<Map<String, dynamic>>> _etudesStream =
      FirebaseFirestore.instance.collection('etudes').snapshots();
  final Stream<QuerySnapshot<Map<String, dynamic>>> _jobsStream =
      FirebaseFirestore.instance.collection('jobs').snapshots();
  final Stream<QuerySnapshot<Map<String, dynamic>>> _realisationsStream =
      FirebaseFirestore.instance.collection('realisations').snapshots();

  late final TabController _tabController;

  DateFormat dateFormat = DateFormat.yMMM('fr');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Text('Contacts'),
            Text('Études'),
            Text('Jobs'),
            Text('Réalisations')
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _contactsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map(
                  (document) {
                    final Contact contact =
                        Contact.fromFireStore(document.data());
                    return ListTile(
                      onTap: () async {
                        if (await canLaunch(contact.url)) {
                          await launch(contact.url);
                        }
                      },
                      leading: FaIcon(contact.icon),
                      title: Text(contact.label.currentLang),
                      subtitle: Text(contact.value),
                    );
                  },
                ).toList(),
              );
            },
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _etudesStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map(
                  (document) {
                    final Etudes etudes = Etudes.fromFireStore(document.data());
                    return ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dateFormat.format(etudes.periode.start)),
                          const SizedBox(height: 4),
                          Text(dateFormat.format(etudes.periode.end)),
                        ],
                      ),
                      title: Text(etudes.diplome.currentLang),
                      subtitle: Text(etudes.ecole.currentLang),
                      trailing: Text(etudes.description.currentLang),
                    );
                  },
                ).toList(),
              );
            },
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _jobsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map(
                  (document) {
                    final Jobs jobs = Jobs.fromFireStore(document.data());
                    return ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(dateFormat.format(jobs.periode.start)),
                          const SizedBox(height: 4),
                          Text(dateFormat.format(jobs.periode.end)),
                        ],
                      ),
                      title: Text(
                        '${jobs.poste.currentLang} - ${jobs.type.currentLang}',
                      ),
                      subtitle: Text(
                        '${jobs.lieu.currentLang} - ${jobs.service?.currentLang}',
                      ),
                      trailing: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 4,
                        ),
                        child: Text(
                          jobs.description.currentLang,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: _realisationsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                debugPrintStack(stackTrace: snapshot.stackTrace);
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map(
                  (document) {
                    final Realisation realisation =
                        Realisation.fromFireStore(document.data());
                    return ListTile(
                      onTap: () async {
                        if (realisation.url != null &&
                            await canLaunch(realisation.url!)) {
                          await launch(realisation.url!);
                        }
                      },
                      leading: Image.asset(realisation.assetImage),
                      title: Text(
                        realisation.name.currentLang,
                      ),
                      subtitle: realisation.url != null
                          ? Text(
                              realisation.url!,
                            )
                          : null,
                      trailing: realisation.urlGitHub != null
                          ? IconButton(
                              onPressed: () async {
                                if (await canLaunch(realisation.urlGitHub!)) {
                                  await launch(realisation.urlGitHub!);
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.github,
                              ),
                            )
                          : null,
                    );
                  },
                ).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
