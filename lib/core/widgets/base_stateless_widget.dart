import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseStatelessWidget extends StatelessWidget{

  Widget getLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return getLayout(context);
  }

}