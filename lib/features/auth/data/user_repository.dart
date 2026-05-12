import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore;

  UserRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserModel> getOrCreateUser(User firebaseUser) async {
    final userDocument = _firestore.collection('users').doc(firebaseUser.uid);
    final snapshot = await userDocument.get();

    if (!snapshot.exists) {
      final defaultUser = UserModel.fromFirebaseUser(firebaseUser);
      await userDocument.set(defaultUser.toMap());
      return defaultUser;
    }

    final data = snapshot.data();
    if (data == null) {
      throw StateError('user_document_empty');
    }

    return UserModel.fromMap(firebaseUser.uid, data);
  }
}
