import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trading_app_task2/helpers/colors.dart';
import 'package:trading_app_task2/helpers/size_config.dart';
import 'package:trading_app_task2/ui/empty_screen.dart';
import 'package:trading_app_task2/ui/home_screen.dart';
import 'package:trading_app_task2/ui/wallet_screen.dart';
class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _cindex=0;
  final List _Navigate=[const HomeScreen(),const MyWalletScreen(), const EmptySvreen(),const EmptySvreen()];
  void onTappedBar(int index)
  {
    setState(() {
      _cindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Navigate[_cindex],

      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: COLORS.backgroundColor(),
        selectedItemColor:Colors.blue,
        unselectedItemColor: COLORS.whiteLight,

        onTap: onTappedBar,
        currentIndex: _cindex,
        type: BottomNavigationBarType.fixed,

        items:
        [
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset("assets/images/common/navbar_home.png"),
            activeIcon: Image.asset("assets/images/common/navbar_home_active.png"),

          ),
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset("assets/images/common/navbar_wallet.png"),
            activeIcon:Image.asset("assets/images/common/navbar_wallet_active.png"),

          ),
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset("assets/images/common/navbar_convert.png"),
            activeIcon: Image.asset("assets/images/common/navbar_convert_active.png"),

          ),
          BottomNavigationBarItem(
            label: "",
            icon: Image.asset("assets/images/common/navbar_account.png"),
            activeIcon: Image.asset("assets/images/common/navbar_account_active.png"),

          ),
        ],
      ),

    );
  }
}
