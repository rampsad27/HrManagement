import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hr_management/data/models/user/user_model.dart';
import 'package:hr_management/domain/repository/iuser_repository.dart';

class UserRepository implements IUserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Future<List<UserModel>?> getUser() async {
    CollectionReference collectionReference = _firestore.collection('user');
    QuerySnapshot querySnapshot = await collectionReference.get();

    var list = querySnapshot.docs
        .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
    return list;
  }

  @override
  Future<UserModel?> getUserById(String email) async {
    CollectionReference collectionReference = _firestore.collection('user');
    var res = await collectionReference.doc(email).get();
    return UserModel.fromJson(res.data() as Map<String, dynamic>);
  }

  @override
  Stream<List<UserModel>> getRealTimeStreamData() {
    CollectionReference collectionReference = _firestore.collection('user');

    return collectionReference.snapshots().map((user) => user.docs
        .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
        .toList());
  }
}
