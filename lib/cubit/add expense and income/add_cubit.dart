import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:management_finance/controller/add_controller.dart';
import 'package:management_finance/model/add_model.dart';
part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());

  void addIncome({
    required String id,
    required DateTime date,
    required String keterangan,
    required String nominal,
  }) async {
    try {
      emit(addLoading());

      AddModel add = await AddController().addIncome(
        id: id,
        date: date,
        keterangan: keterangan,
        nominal: nominal,
      );
      emit(addSucces(add));
    } catch (e) {
      emit(addFailed(e.toString()));
    }
  }
}
