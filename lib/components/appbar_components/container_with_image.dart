import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app_task2/helpers/colors.dart';
import 'package:trading_app_task2/helpers/config.dart';
import 'package:trading_app_task2/helpers/size_config.dart';
class ContainerWithImage extends StatelessWidget {
  final String image;
  final double padding;
  const ContainerWithImage({Key? key,required  this.image,required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: SizeConfig.blockHeight*6,
      width: SizeConfig.blockWidth*11,
      padding: EdgeInsets.all(SizeConfig.blockWidth*padding),
      decoration: BoxDecoration(
          color:Config.brightness ==Brightness.light?COLORS.blueSecondary:COLORS.blackDark,
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockWidth*2))
      ),
      child: SvgPicture.asset(image,fit: BoxFit.contain,),
    );
  }
}
