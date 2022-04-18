import 'package:final_year_project_mobile_app/pages/tabs/chats_tab.dart';
import 'package:final_year_project_mobile_app/pages/tabs/diagnosis_tab.dart';
import 'package:final_year_project_mobile_app/pages/tabs/home_tab.dart';
import 'package:final_year_project_mobile_app/pages/tabs/settings_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/navbarcubit_cubit.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const tabView = [HomeTab(), ChatTab(), DiagnosisTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NavbarCubit, NavbarCubitState>(
            builder: (context, state) => Text(tabView[state.index].title)),
      ),
      body: BlocBuilder<NavbarCubit, NavbarCubitState>(
        builder: (context, state) {
          return tabView[state.index];
        },
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BlocBuilder<NavbarCubit, NavbarCubitState>(
            builder: (context, state) {
              return BottomNavigationBar(
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: state.index,
                onTap: (i) {
                  BlocProvider.of<NavbarCubit>(context).changeIndex(i);
                },
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: '', icon: Icon(Icons.chat)),
                  BottomNavigationBarItem(label: '', icon: Icon(Icons.sick)),
                  BottomNavigationBarItem(
                      label: '', icon: Icon(Icons.settings)),
                ],
              );
            },
          )),
    );
  }
}
