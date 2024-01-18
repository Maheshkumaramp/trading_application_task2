import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app_task2/helpers/colors.dart';
import 'package:trading_app_task2/helpers/size_config.dart';

class transactionTypeButton extends StatelessWidget {
  final String icon;
  final String text;
  final dynamic color;
  const transactionTypeButton({Key? key,required this.icon,required this.text,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockWidth*2))
      ),
      padding: EdgeInsets.symmetric(vertical:SizeConfig.blockWidth*2,horizontal: SizeConfig.blockWidth*3),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: SizeConfig.blockWidth*2,),
          Text(text,style: TextStyle(color: COLORS.white,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.7,),),


        ],
      ),
    );
  }
}


