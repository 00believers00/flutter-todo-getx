import 'package:demo_use/app/data/models/todo_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../services/localization_service.dart';
import '../../../services/location_service.dart';
import '../controllers/dashboard_controller.dart';
import 'widgets/todo_card.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);

  // final LocationService location = Get.find<LocationService>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.nextSettings();
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('hello'.tr, style: const TextStyle(color: Colors.grey),),
            const SizedBox(height: 20),
            DropdownButton(
              icon: const Icon(Icons.arrow_drop_down),
              value: controller.selectedLang.value,
              items: LocalizationService.langs.map((String lang) {
                return DropdownMenuItem(value: lang, child: Text(lang));
              }).toList(),
              onChanged: controller.onChangeLocalization,
            ),
            Text(
              "TODO List",
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              children: [
                const Text("TODO:"),
                Expanded(
                  child: TextField(
                    controller: controller.controllerTodo,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      bool status = controller.addTodoList(controller.controllerTodo.text);
                      if (!status) {
                        Get.defaultDialog(title: "Text Empty", middleText: "Please Enter Todo.");
                      }
                    },
                    child: const Text("Add Todo")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.getTodoList();
                },
                child: const Text("Get Todo List")),
            const SizedBox(
              height: 10,
            ),
            ObxValue<RxList<TodoDetail>>(
                (p0) => Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: p0.reversed
                            .toList()
                            .asMap()
                            .map(
                              (key, value) => MapEntry(
                                  key,
                                  TodoCard(
                                    detail: value,
                                  )),
                            )
                            .values
                            .toList(),
                      ),
                    )),
                controller.todoList),
            // Obx((){
            //   return Text(controller.todoList.length.toString());
            // }),
          ],
        ),
      ),
    );
  }
}
