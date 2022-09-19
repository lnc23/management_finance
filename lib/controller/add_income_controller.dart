import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:management_finance/model/add_model.dart';

class addIncomeController {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('income');

  Future<void> setAdd(AddModel add) async {
    try {
      _userReference.doc(add.id).set(
        {
          'id': add.id,
          'date': add.date,
          'keterangan': add.keterangan,
          'nominal': add.nominal,
        },
      );
    } catch (e) {
      throw e;
    }
  }
}
