import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
//get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

// ekle
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

// oku
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy('timestamp', descending: false).snapshots();
    //notları en son girilene göre sıralar en son en üste
    return notesStream;
  }

//yenile
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

// sil
  Future<void> deleteNote(String docID) {
    return notes.doc(docID).delete();
  }
}
