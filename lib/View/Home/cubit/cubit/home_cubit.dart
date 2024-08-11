import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  bool list_view = false;
    final advancedDrawerController = AdvancedDrawerController();

 void openMenuDrawer() {
    emit(HomeMenuDrawerOpen());
    advancedDrawerController.showDrawer();
  }

  void openProfileDrawer() {
    emit(HomeProfileDrawerOpen());
    advancedDrawerController.showDrawer();
  }


}
