import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv_online_v2/controllers/bloc_provider.dart';
import 'package:cv_online_v2/extensions/iterable_extension.dart';
import 'package:cv_online_v2/models/competence.dart';
import 'package:cv_online_v2/models/contact.dart';
import 'package:cv_online_v2/models/etudes.dart';
import 'package:cv_online_v2/models/jobs.dart';
import 'package:cv_online_v2/models/presentation.dart';
import 'package:cv_online_v2/models/realisation.dart';
import 'package:cv_online_v2/models/recommandation.dart';

class FirestoreBloc extends BlocBase {
  // SECTION - Référence

  late CollectionReference<Presentation> _presentationsReference;
  late CollectionReference<Competence> _competencesReference;
  late CollectionReference<Contact> _contactsReference;
  late CollectionReference<Etude> _etudesReference;
  late CollectionReference<Job> _jobsReference;
  late CollectionReference<Realisation> _realisationsReference;
  late CollectionReference<Recommandation> _recommandationsReference;

  // !SECTION - Référence
  // SECTION - QuerySnapshot & List

  Presentation? description;
  List<Presentation> presentations = [];
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
    // SECTION - Référence

    _presentationsReference = FirebaseFirestore.instance
        .collection(Presentation.collectionName)
        .withConverter<Presentation>(
          fromFirestore: (snapshot, _) =>
              Presentation.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _competencesReference = FirebaseFirestore.instance
        .collection(Competence.collectionName)
        .withConverter<Competence>(
          fromFirestore: (snapshot, _) =>
              Competence.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _contactsReference = FirebaseFirestore.instance
        .collection(Contact.collectionName)
        .withConverter<Contact>(
          fromFirestore: (snapshot, _) =>
              Contact.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _etudesReference = FirebaseFirestore.instance
        .collection(Etude.collectionName)
        .withConverter<Etude>(
          fromFirestore: (snapshot, _) => Etude.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _jobsReference = FirebaseFirestore.instance
        .collection(Job.collectionName)
        .withConverter<Job>(
          fromFirestore: (snapshot, _) => Job.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _realisationsReference = FirebaseFirestore.instance
        .collection(Realisation.collectionName)
        .withConverter<Realisation>(
          fromFirestore: (snapshot, _) =>
              Realisation.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );
    _recommandationsReference = FirebaseFirestore.instance
        .collection(Recommandation.collectionName)
        .withConverter<Recommandation>(
          fromFirestore: (snapshot, _) =>
              Recommandation.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toJson(),
        );

    // !SECTION - Référence
    // SECTION - QuerySnapshot & List

    final QuerySnapshot<Presentation> queryPresentations =
        await _presentationsReference.orderBy('label').get();
    description = queryPresentations.docs
        .map((e) => e.data())
        .firstWhereOrNull((e) => e.label == null);
    presentations = queryPresentations.docs
        .map((e) => e.data())
        .where((e) => e.label != null)
        .toList();
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
