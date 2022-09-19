part of 'add_cubit.dart';

abstract class AddState extends Equatable {
  const AddState();

  @override
  List<Object> get props => [];
}

class AddInitial extends AddState {}

class addLoading extends AddState {}

class addSucces extends AddState {
  final AddModel add;

  addSucces(this.add);

  @override
  // TODO: implement props
  List<Object> get props => [add];
}

class addFailed extends AddState {
  final String error;

  addFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
