import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/models/competence.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/models/jobs.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:cv_online_v2/models/recommandation.dart';

class FirestoreBloc extends BlocBase {
  // SECTION - Stream

  late Stream<QuerySnapshot<Map<String, dynamic>>> competencesStream;
  late Stream<QuerySnapshot<Map<String, dynamic>>> contactsStream;
  late Stream<QuerySnapshot<Map<String, dynamic>>> etudesStream;
  late Stream<QuerySnapshot<Map<String, dynamic>>> jobsStream;
  late Stream<QuerySnapshot<Map<String, dynamic>>> realisationsStream;
  late Stream<QuerySnapshot<Map<String, dynamic>>> recommandationsStream;

  // !SECTION - Stream
  // SECTION - Référence

  late CollectionReference<Competence> _competencesReference;
  late CollectionReference<Contact> _contactsReference;
  late CollectionReference<Etude> _etudesReference;
  late CollectionReference<Job> _jobsReference;
  late CollectionReference<Realisation> _realisationsReference;
  late CollectionReference<Recommandation> _recommandationsReference;

  // !SECTION - Référence
  // SECTION - QuerySnapshot & List

  List<Competence> competences = [];
  List<Contact> contacts = [];
  List<Etude> etudes = [];
  List<Job> jobs = [];
  List<Realisation> realisations = [];
  List<Recommandation> recommandations = [];

  // !SECTION - QuerySnapshot & List

  @override
  void dispose() {}

  @override
  void initState() {}

  Future<void> initFirestore() async {
    // SECTION - Stream
    competencesStream = FirebaseFirestore.instance
        .collection('competences')
        .orderBy('label')
        .snapshots();
    contactsStream =
        FirebaseFirestore.instance.collection('contacts').snapshots();
    etudesStream = FirebaseFirestore.instance.collection('etudes').snapshots();
    jobsStream = FirebaseFirestore.instance.collection('jobs').snapshots();
    realisationsStream =
        FirebaseFirestore.instance.collection('realisations').snapshots();
    recommandationsStream =
        FirebaseFirestore.instance.collection('recommandations').snapshots();

    // !SECTION - Stream
    // SECTION - Référence

    _competencesReference = FirebaseFirestore.instance
        .collection('competences')
        .withConverter<Competence>(
          fromFirestore: (snapshot, _) =>
              Competence.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _contactsReference = FirebaseFirestore.instance
        .collection('contacts')
        .withConverter<Contact>(
          fromFirestore: (snapshot, _) =>
              Contact.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _etudesReference = FirebaseFirestore.instance
        .collection('etudes')
        .withConverter<Etude>(
          fromFirestore: (snapshot, _) => Etude.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _jobsReference = FirebaseFirestore.instance
        .collection('jobs')
        .withConverter<Job>(
          fromFirestore: (snapshot, _) => Job.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _realisationsReference = FirebaseFirestore.instance
        .collection('realisations')
        .withConverter<Realisation>(
          fromFirestore: (snapshot, _) =>
              Realisation.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _recommandationsReference = FirebaseFirestore.instance
        .collection('recommandations')
        .withConverter<Recommandation>(
          fromFirestore: (snapshot, _) =>
              Recommandation.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );

    // !SECTION - Référence
    // SECTION - QuerySnapshot & List

    final QuerySnapshot<Competence> queryCompetences =
        await _competencesReference.orderBy('label').get();
    competences = queryCompetences.docs.map((e) => e.data()).toList();
    final QuerySnapshot<Contact> queryContacts = await _contactsReference.get();
    contacts = queryContacts.docs.map((e) => e.data()).toList();
    final QuerySnapshot<Etude> queryEtudes = await _etudesReference.get();
    etudes = queryEtudes.docs.map((e) => e.data()).toList();
    final QuerySnapshot<Job> queryJobs = await _jobsReference.get();
    jobs = queryJobs.docs.map((e) => e.data()).toList();
    final QuerySnapshot<Realisation> queryRealisations =
        await _realisationsReference.get();
    realisations = queryRealisations.docs.map((e) => e.data()).toList();
    final QuerySnapshot<Recommandation> queryRecommandations =
        await _recommandationsReference.get();
    recommandations = queryRecommandations.docs.map((e) => e.data()).toList();

    // !SECTION - QuerySnapshot & List
  }
}
