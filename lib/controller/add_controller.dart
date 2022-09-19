import 'package:management_finance/controller/add_income_controller.dart';
import 'package:management_finance/model/add_model.dart';

class AddController {
  Future<AddModel> addIncome({
    required String id,
    required DateTime date,
    required String keterangan,
    required String nominal,
  }) async {
    try {
      AddModel add = AddModel(
          id: id, date: date, keterangan: keterangan, nominal: nominal);

      await addIncomeController().setAdd(add);

      return add;
    } catch (e) {
      throw e;
    }
  }
}
