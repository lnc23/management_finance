import 'package:firebase_auth/firebase_auth.dart';
import 'package:management_finance/controller/user_controller.dart';
import 'package:management_finance/model/user_model.dart';

class authcontroller {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user =
          await usercontroller().getuserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String name,
    required String no_telp,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        email: email,
        password: password,
        name: name,
        no_telp: no_telp,
      );

      await usercontroller().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
