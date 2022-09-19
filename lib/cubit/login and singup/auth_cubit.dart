import 'package:bloc/bloc.dart';
import 'package:management_finance/controller/auth_controller.dart';
import 'package:management_finance/cubit/login%20and%20singup/auth_state.dart';
import 'package:management_finance/model/user_model.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String name,
    required String no_telp,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await authcontroller().signUp(
        email: email,
        password: password,
        name: name,
        no_telp: no_telp,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await authcontroller().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await authcontroller().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
