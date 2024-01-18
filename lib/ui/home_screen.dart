import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app_task2/components/appbar_components/container_with_image.dart';
import 'package:trading_app_task2/components/button_component/transaction_type_button.dart';
import 'package:trading_app_task2/helpers/colors.dart';
import 'package:trading_app_task2/helpers/config.dart';
import 'package:trading_app_task2/helpers/size_config.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCurrencyType="USD";
  List <String>  currencyType=["USD"];
  List<Map<String,dynamic>> recommendedList=[
    {
      "icon":"assets/images/common/crypto_logo.png",
      "name":"BNB",
      "rate":"+1.37",
      "amount":"216.3"
    },
    {
      "icon":"assets/images/common/adl_logo.png",
      "name":"ADL",
      "rate":"+2.72",
      "amount":"0.4976"
    }
  ];
  List<Map<String,dynamic>> myAssetsList=[
    {
      "icon":"assets/images/common/bitcoin_logo.svg",
      "name":"Bitcoin",
      "rate":"4.5%",
      "amount":"\$4,500.00",
      "lostAmount":"\$12.5",
      "btc":"0000056"
    },
    {
      "icon":"assets/images/common/tether_logo.svg",
      "name":"Tether",
      "rate":"3.5%",
      "amount":"\$2,200.00",
      "lostAmount":"\$10.5",
      "btc":"0000046"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.backgroundColor(),
        appBar: PreferredSize(
            preferredSize:Size( SizeConfig.screenWidth,SizeConfig.blockHeight*8),child: Container(
          color: COLORS.backgroundColor(),
          padding:EdgeInsets.only(top: SizeConfig.blockHeight*6,right: SizeConfig.blockWidth*5,left: SizeConfig.blockWidth*5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContainerWithImage(image: "assets/images/common/profile.svg",padding: 1),
              Spacer(),
              SvgPicture.asset("assets/images/common/setting.svg",height: SizeConfig.blockHeight*3.5,color: Config.brightness ==Brightness.light?COLORS.blueSecondary:COLORS.blackExtraLight,),
              SizedBox(width: SizeConfig.blockWidth*6,),
              ContainerWithImage(image: "assets/images/common/notification.svg",padding: 2.5,),

            ],
          ),
        )),
      body: SafeArea(child: Container(
        padding: EdgeInsets.all(SizeConfig.blockWidth*5),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(SizeConfig.blockWidth*5,),
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(SizeConfig.blockWidth*4)) ,
                  image: DecorationImage(image: AssetImage("assets/images/common/background_image.png",),fit: BoxFit.fill)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("My Wallet",style: TextStyle(color: COLORS.white,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2.2,),),
                        Spacer(),
                        SizedBox(
                          height: SizeConfig.blockHeight*4,
                          width: SizeConfig.blockWidth*25,
                          child:  DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              dropdownDecoration: BoxDecoration(color: COLORS.blackLight),
                              style: TextStyle(
                                  color: COLORS.white,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeConfig.blockWidth * 3.8),
                              isExpanded: true,
                              items: currencyType.map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      color: COLORS.white,
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockWidth * 3.8),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )).toList(),
                              value: selectedCurrencyType,
                              onChanged: (value) {
                                setState(() {
                                  selectedCurrencyType = value.toString();
                                });
                              },
          
                              buttonDecoration: BoxDecoration(
                                color: COLORS.white.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.circular(SizeConfig.blockWidth * 3),
                                border: Border.all(color: COLORS.white.withOpacity(0.2), width: 1.5),
                              ),
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: COLORS.white,
                                size: SizeConfig.blockWidth * 6,),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig.blockHeight*4,),
                    Text("\$8,540.00",style: TextStyle(color: COLORS.white,fontWeight: FontWeight.w500,fontFamily: "TsukimiRounded",fontSize: SizeConfig.blockHeight*3,),),
                    SizedBox(height: SizeConfig.blockHeight*4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        transactionTypeButton(icon:"assets/images/common/money_send.svg", text: "Transfer", color:COLORS.black),
                        transactionTypeButton(icon:"assets/images/common/money_recive.svg", text: "Deposit", color:COLORS.white.withOpacity(0.2)),
                        transactionTypeButton(icon:"assets/images/common/bitcoin_convert.svg", text: "Swap", color:COLORS.white.withOpacity(0.2)),
          
                      ],
                    )
          
          
                  ],
                ),
          
              ),
              SizedBox(height: SizeConfig.blockHeight*3,),
              Container(
                decoration: BoxDecoration(
                    color:COLORS.cardColor(),
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockWidth*2))
                ),
                padding: EdgeInsets.symmetric(vertical:SizeConfig.blockWidth*2,horizontal: SizeConfig.blockWidth*3),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/common/bitcoin_logo.svg"),
                    SizedBox(width: SizeConfig.blockWidth*2,),
                    Text("BTC",style: TextStyle(color: COLORS.textColor(),fontWeight: FontWeight.w600,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
                    Spacer(),
                    Text("0.00000045",style: TextStyle(color: COLORS.greenLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
                    SizedBox(width: SizeConfig.blockWidth*2,),
                    SvgPicture.asset("assets/images/common/profit_grap.svg"),
                    SizedBox(width: SizeConfig.blockWidth*4,),
                    Text("3.8%",style: TextStyle(color: COLORS.greenLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
          
                  ],
                ),
              ),
              SizedBox(height: SizeConfig.blockHeight*4,),
              Text("Recommended",style: TextStyle(color: COLORS.blackExtraLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
              SizedBox(height: SizeConfig.blockHeight*3.5,),
              SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.blockHeight*13,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: recommendedList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return Container(
                    height: SizeConfig.blockHeight*12,
                    width: SizeConfig.blockWidth*43.5,
                    decoration: BoxDecoration(
                        color:COLORS.cardColor(),
                        borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockWidth*3))
                    ),
                    margin: EdgeInsets.only(right: SizeConfig.blockWidth*3),
                    padding: EdgeInsets.symmetric(vertical:SizeConfig.blockWidth*2,horizontal: SizeConfig.blockWidth*3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(recommendedList[index]["icon"]),
                            SizedBox(width: SizeConfig.blockWidth*2,),
                            Text(recommendedList[index]["name"],style: TextStyle(color: COLORS.textColor(),fontWeight: FontWeight.w600,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
                            Spacer(),
                            SvgPicture.asset("assets/images/common/profit_grap.svg",height: SizeConfig.blockHeight*4,),
          
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(recommendedList[index]["rate"],style: TextStyle(color: COLORS.greenLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
                            Text(recommendedList[index]["amount"],style: TextStyle(color: COLORS.whiteLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
          
                          ],
                        )
                      ],
                    ),
                  );
                },),
              ),
              SizedBox(height: SizeConfig.blockHeight*4,),
              Text("My Assets",style: TextStyle(color: COLORS.blackExtraLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
              SizedBox(height: SizeConfig.blockHeight*3.5,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: myAssetsList.length,
            itemBuilder: (context, index) {
            return Container(
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color:COLORS.cardColor(),
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockWidth*2.5))
              ),
              margin: EdgeInsets.only(bottom: SizeConfig.blockWidth*3),
              padding: EdgeInsets.symmetric(vertical:SizeConfig.blockWidth*2,horizontal: SizeConfig.blockWidth*3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(myAssetsList[index]["icon"]),
                      SizedBox(width: SizeConfig.blockWidth*2,),
                      Text(myAssetsList[index]["name"],style: TextStyle(color: COLORS.textColor(),fontWeight: FontWeight.w600,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
                      Spacer(),
                      Text(myAssetsList[index]["amount"],style: TextStyle(color: COLORS.textColor(),fontWeight: FontWeight.w600,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
          
          
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockHeight*3,),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/common/loss_grap.svg",height: SizeConfig.blockHeight*4,),
                      Text(myAssetsList[index]["rate"],style: TextStyle(color: COLORS.redLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),
                      SizedBox(width: SizeConfig.blockWidth*1,),
                      Text(myAssetsList[index]["lostAmount"],style: TextStyle(color: COLORS.whiteLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),
                      Spacer(),
                      Text("${myAssetsList[index]["btc"]} BTC",style: TextStyle(color: COLORS.blackExtraLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),
          
                    ],
                  )
          
                ],
              ),
            );
          },)
          
          
          
          
            ],
          ),
        ) ,
      )),
    );
  }

}
