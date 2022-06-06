import 'package:demo_use/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardController extends GetxController {

  RxInt dex = 99.obs;
  // late RxList todoList;
  RxList todoList = <String>[].obs;
  final TextEditingController controllerTodo = TextEditingController();

  @override
  void onInit() {
    super.onInit();

  }

  void nextSettings(){
    Get.toNamed(AppRoutes.settings);
  }

  bool addTodoList(String data){
    if(data.isNotEmpty){
      todoList.add(data);
      return true;
    }
    return false;
  }


}