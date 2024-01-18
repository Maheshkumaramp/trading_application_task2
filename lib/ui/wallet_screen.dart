import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trading_app_task2/components/appbar_components/container_with_image.dart';
import 'package:trading_app_task2/components/button_component/transaction_type_button.dart';
import 'package:trading_app_task2/helpers/colors.dart';
import 'package:trading_app_task2/helpers/config.dart';
import 'package:trading_app_task2/helpers/size_config.dart';
class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  String selectedCurrencyType="USD";
  List <String>  currencyType=["USD"];
  List<Map<String,dynamic>> transactionHistoryList=[
    {
      "icon":"assets/images/common/send.png",
      "name":"Janet Doe",
      "rate":"4.5%",
      "amount":"\$4,500.00",
      "btc":"0000056"
    },
    {
      "icon":"assets/images/common/recive.png",
      "name":"Janet Doe",
      "rate":"3.5%",
      "amount":"\$2,200.00",
      "btc":"0000046"
    },
    {
      "icon":"assets/images/common/recive.png",
      "name":"Janet Doe",
      "rate":"3.5%",
      "amount":"\$2,200.00",
      "btc":"0000046"
    },
    {
      "icon":"assets/images/common/send.png",
      "name":"Janet Doe",
      "rate":"3.5%",
      "amount":"\$4,500.00",
      "btc":"0000046"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.backgroundColor(),
      appBar: PreferredSize(
          preferredSize:Size( SizeConfig.screenWidth,SizeConfig.blockHeight*13),child: Container(
        color: COLORS.backgroundColor(),
        padding:EdgeInsets.only(top: SizeConfig.blockHeight*8,right: SizeConfig.blockWidth*5,left: SizeConfig.blockWidth*5),
        child: Text("MY Wallet",style: TextStyle(color: COLORS.textColor(),fontWeight: FontWeight.w700,fontFamily: "TsukimiRounded",fontSize: SizeConfig.blockHeight*5.5,),)
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
                    image: DecorationImage(image: AssetImage("assets/images/common/background_image_black.png",),fit: BoxFit.fill,)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Wallet Balance",style: TextStyle(color: COLORS.white,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2.2,),),
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
                        transactionTypeButton(icon:"assets/images/common/money_send.svg", text: "Transfer", color:COLORS.blueLight),
                        transactionTypeButton(icon:"assets/images/common/money_recive.svg", text: "Deposit", color:COLORS.white.withOpacity(0.2)),
                        transactionTypeButton(icon:"assets/images/common/bitcoin_convert.svg", text: "Swap", color:COLORS.white.withOpacity(0.2)),

                      ],
                    )


                  ],
                ),

              ),
              SizedBox(height: SizeConfig.blockHeight*3,),
              Row(
                children: [
                  Text("Transaction History",style: TextStyle(color: COLORS.blackExtraLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*2,),),
                  Spacer(),
                  SvgPicture.asset("assets/images/common/setting.svg",height: SizeConfig.blockHeight*3.5,color: Config.brightness ==Brightness.light?COLORS.blueSecondary:COLORS.blackExtraLight,),
                  SizedBox(width: SizeConfig.blockWidth*6,),
                  ContainerWithImage(image: "assets/images/common/setting_new.svg",padding: 2.5,),
                ],
              ),
              SizedBox(height: SizeConfig.blockHeight*3.5,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: transactionHistoryList.length,
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
                            Image.asset(transactionHistoryList[index]["icon"]),
                            SizedBox(width: SizeConfig.blockWidth*2,),
                            Text(transactionHistoryList[index]["name"],style: TextStyle(color: COLORS.textColor(),fontWeight: FontWeight.w600,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),
                            Spacer(),
                            Text(transactionHistoryList[index]["amount"],style: TextStyle(color: COLORS.textColor(),fontWeight: FontWeight.w600,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),


                          ],
                        ),
                        SizedBox(height: SizeConfig.blockHeight*3,),
                        Row(
                          children: [
                            Text("BTC",style: TextStyle(color: COLORS.whiteLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),
                            SizedBox(width: SizeConfig.blockWidth*1,),
                            Text("BNB",style: TextStyle(color: COLORS.blackExtraLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),
                            Spacer(),
                            Text("${transactionHistoryList[index]["btc"]} BTC",style: TextStyle(color: COLORS.blackExtraLight,fontWeight: FontWeight.w400,fontFamily: "OpenSans",fontSize: SizeConfig.blockHeight*1.8,),),

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
