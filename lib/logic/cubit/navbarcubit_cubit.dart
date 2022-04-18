import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'navbarcubit_state.dart';

class NavbarCubit extends HydratedCubit<NavbarCubitState> {
  NavbarCubit() : super(NavbarCubitInitial());

  void changeIndex(int index) {
    emit(NavbarCubitSelected(index: index));
  }

  @override
  NavbarCubitState? fromJson(Map<String, dynamic> json) {
    try {
      return NavbarCubitSelected(index: json['index']);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(NavbarCubitState state) => {
        'index': state.index,
      };
}
