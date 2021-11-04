import 'package:flutter/material.dart';
import 'package:kopamain/core/constant/colors.dart';
import 'package:kopamain/core/widgets/base_stateless_widget.dart';

abstract class BaseStatelessScreen extends BaseStatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget getLayout(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      appBar: buildHeader(context),
      key: scaffoldKey,
      body: SafeArea(child: buildBody(context)),
      bottomNavigationBar: buildFooter(context),
      floatingActionButton: buildFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildHeader(BuildContext context);

  Widget buildFooter(BuildContext context);

  Widget buildBody(BuildContext context);

  Widget buildFloatingButton(BuildContext context);

}
