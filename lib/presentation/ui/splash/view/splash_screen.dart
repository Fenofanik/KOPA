import 'package:flutter/services.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/constant/constant.dart';
import 'package:kopamain/core/constant/images.dart';
import 'package:kopamain/core/states/base_stateless_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopamain/presentation/ui/splash/splash_controller.dart';
import 'package:yaml/yaml.dart';


class SplashScreen extends BaseStatelessScreen {

  final SplashController splashController = Get.find();

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        Center(
            child: Image.asset(SplashLogo)
        ),
        Positioned(
            bottom: 15,
            right: 15,
            child: Text(AppStrings.CompanyName)),
        FutureBuilder(
            future: rootBundle.loadString(AppStrings.PubSpecYaml),
            builder: (context, snapshot) {
              String version = " ";
              if (snapshot.hasData) {
                var yaml = loadYaml(snapshot.data);
                version = yaml[AppStrings.LittleVersion];
              }
              return Positioned(bottom: 15, left: 15,
                  child: Text("${AppStrings.Version} $version"));
            }
        ),
      ],
    );
  }

  @override
  Widget buildFloatingButton(BuildContext context) {
    return null;
  }

  @override
  Widget buildFooter(BuildContext context) {
    return null;
  }

  @override
  Widget buildHeader(BuildContext context) {
    return null;
  }
}
