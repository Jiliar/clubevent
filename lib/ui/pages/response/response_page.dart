import 'package:clubevent/domain/usecases/controllers/theme_controller.dart';
import 'package:clubevent/ui/pages/response/screens/evento_response_screen.dart';
import 'package:clubevent/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResponsePage extends StatelessWidget {
  final ThemeController controller = Get.find();
  ResponsePage({Key? key}) : super(key: key);

  // We create a Scaffold that is used for all the content pages
  // We only define one AppBar, and one scaffold.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        controller: controller,
        tile: const Text("Stateless Widgets"),
        context: context,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: EventoResponseScreen(controller: controller),
        ),
      ),
    );
  }
}