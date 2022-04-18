part of 'navbarcubit_cubit.dart';

abstract class NavbarCubitState extends Equatable {
  const NavbarCubitState({required this.index});
  final int index;

  @override
  List<Object> get props => [];
}

class NavbarCubitInitial extends NavbarCubitState {
  const NavbarCubitInitial({this.index = 0}) : super(index: index);

  final int index;

  @override
  List<Object> get props => [index];
}

class NavbarCubitSelected extends NavbarCubitState {
  const NavbarCubitSelected({required this.index}) : super(index: index);

  final int index;

  @override
  List<Object> get props => [index];
}
