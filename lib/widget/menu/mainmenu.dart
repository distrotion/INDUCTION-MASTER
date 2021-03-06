import 'package:flutter/material.dart';

import '../../page/page1.dart';
import '../../page/page2.dart';
import '../../page/page3.dart';
import '../../page/page4.dart';
import '../../page/page5.dart';
import 'sub_widget.dart';

late BuildContext MenuContext;

class MainMenu extends StatefulWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    MenuContext = context;
    //---------------------------------------------------------------

    return Container(
      height: (MediaQuery.of(context).size.height),
      width: 200,
      color: Color(0xff0b1327),
      //color: Colors.red,
      child: ListView(
        children: [
          Center(
            child: Data_Menu_mainmenu(),
          )
        ],
      ),
    );
  }
}

class Data_Menu_mainmenu extends StatelessWidget {
  //const Data_Menu_mainmenu({Key? key},this.pagein) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //Axis-Y
        crossAxisAlignment: CrossAxisAlignment.center, //Axis-X

        children: [
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 40,
                  width: 180,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(1),
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo_tpk.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ))),
          menu_normal(
            name: "IND DASHBOARD",
            page: Page1(),
          ),
          menu_normal(
            name: "IND Report",
            page: Page2(),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          menu_normal(
            name: "JGC DASHBOARD",
            page: Page3(),
          ),
          menu_normal(
            name: "JGC Report",
            page: Page4(),
          ),
          menu_normal(
            name: "JGC Report BY PO",
            page: Page5(),
          ),
          Container(
            height: 1,
            color: Colors.white,
          ),
          // menu_normal(
          //   name: "Page5",
          //   page: Page5(),
          // ),
          Divider(
            color: Color(0x4dffffff),
            height: 12,
          ),
        ],
      ),
    );
  }
}

class Logomenu extends StatelessWidget {
  const Logomenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsetsDirectional.all(1),
        child: Container(
          height: 35,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logo_tpk.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),

      //color: Colors.white,
    );
  }
}
