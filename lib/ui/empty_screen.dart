import 'package:flutter/material.dart';
import 'package:trading_app_task2/helpers/colors.dart';
class EmptySvreen extends StatelessWidget {
  const EmptySvreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.backgroundColor(),
    );
  }
}
