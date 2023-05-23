import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hire2_master/controller/my_controller.dart';
import 'package:hire2_master/utils/utils.dart';
import 'package:rive/rive.dart';

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Obx(() {
            if (controller.isLoading.value) {
              return const SizedBox(
                height: 300,
                width: 300,
                child: RiveAnimation.asset(
                  'assets/loading_new.riv',
                  fit: BoxFit.cover,
                ),
              );
            } else if (controller.hasData.value) {
              return Container(
                color: Colors.grey,
                height: 300,
                width: 300,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "${controller.data['avatar']}",
                      width: 150,
                      height: 150,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      " ${controller.data['first_name']} ${controller.data['last_name']}",
                      style: ThemeData().textTheme.labelLarge,
                    ),
                    Text(
                      " ${controller.data['phone_number']} ",
                      style: ThemeData().textTheme.labelLarge,
                    ),
                    Text(
                      ' ${Utils.formatDate('${controller.data['date_of_birth']}')}',
                      style: ThemeData().textTheme.labelLarge,
                    ),
                  ],
                ),
              );
            } else {
              return const Text('No data');
            }
          }),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            controller.apiGet();
          },
        ),
      ),
    );
  }
}
