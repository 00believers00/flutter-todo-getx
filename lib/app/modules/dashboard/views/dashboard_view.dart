import 'package:demo_use/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

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
                      bool status = controller
                          .addTodoList(controller.controllerTodo.text);
                      if (!status) {
                        Get.defaultDialog(
                            title: "Text Empty",
                            middleText: "Please Enter Todo.");
                      }
                    },
                    child: const Text("Add Todo")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ObxValue<RxList>(
                (p0) => Expanded(
                        child: Column(
                      children: p0
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                              key,
                              Text(value),
                            ),
                          )
                          .values
                          .toList(),
                    )),
                controller.todoList),
            // Obx((){
            //   return Text(controller.todoList.length.toString());
            // }),
            ObxValue<RxInt>((p0) => Text(p0.toString()), controller.dex)
          ],
        ),
      ),
    );
  }
}
