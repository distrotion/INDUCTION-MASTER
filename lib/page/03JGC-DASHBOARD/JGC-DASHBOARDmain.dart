import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/03-JGC-DASHBOSRD.dart';
import '../../data/global.dart';
import '../../styles/TextStyle.dart';
import 'JGC-DASHBOARDvar.dart';
import 'piechart2_D.dart';

late BuildContext JGC_DASHBOARDcontext;

class JGC_DASHBOARDmain extends StatefulWidget {
  JGC_DASHBOARDmain({Key? key, this.dataDH}) : super(key: key);
  JGCDASHBOARDclass? dataDH;

  @override
  State<JGC_DASHBOARDmain> createState() => _JGC_DASHBOARDmainState();
}

class _JGC_DASHBOARDmainState extends State<JGC_DASHBOARDmain> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (timmer) {
      context.read<JGCdashboardGET_Bloc>().add(JGCdashboardGET_READ());

      JGC_DASHBOARDtimer = timmer;
    });

    //----------
    // timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    JGC_DASHBOARDcontext = context;
    Pagememory = 3;
    if (widget.dataDH != null) {
      if (widget.dataDH!.statusin == 'OK') {
        JGC_DASHBOARD.currentPIC = widget.dataDH!.currentPIC;
        JGC_DASHBOARD.datedataMEM = widget.dataDH!.datedataMEM;
        JGC_DASHBOARD.datedataMEM2 = widget.dataDH!.datedataMEM2;

        JGC_DASHBOARD.ALL_AUTO = widget.dataDH!.ALL_AUTO;
        JGC_DASHBOARD.OK = widget.dataDH!.OK;
        JGC_DASHBOARD.WNG = widget.dataDH!.WNG;
        JGC_DASHBOARD.NG = widget.dataDH!.NG;
        JGC_DASHBOARD.AENG = widget.dataDH!.AENG;
        widget.dataDH!.statusin = '';
      }
    }

    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 500,
              width: 300,
              decoration: BoxDecoration(
                // color: Color(0x00b23127),
                // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                // image: DecorationImage(
                //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                //   fit: BoxFit.fitWidth,
                // ),
                border: Border.all(color: Colors.black),
                // borderRadius:
                //     const BorderRadius.only(
                //   topLeft: Radius.circular(8.0),
                //   topRight: Radius.circular(8.0),
                //   bottomLeft:
                //       Radius.circular(8.0),
                //   bottomRight:
                //       Radius.circular(8.0),
                // ),
              ),
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 500,
                      color: const Color.fromARGB(255, 4, 71, 126),
                      child: const Center(
                        child: Text(
                          "ACTUAL DATA",
                          style: TxtStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 500,
                      color: Colors.blue,
                      child: _datainside(
                          text: "COUTER",
                          data: JGC_DASHBOARD.currentPIC.toString()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 500,
                      color: Colors.green,
                      child: _datainside(
                          text: "Lot",
                          data: JGC_DASHBOARD.datedataMEM.toString()),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 500,
                      color: Colors.red.shade200,
                      child: _datainside(
                          text: "BARCODE",
                          data: JGC_DASHBOARD.datedataMEM2.toString()),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                // color: Color(0x00b23127),
                // color: LOGOorCLOSE ? Colors.transparent : Colors.transparent,

                // image: DecorationImage(
                //   image: AssetImage("assets/icons/groupNEW@3x.png"),
                //   fit: BoxFit.fitWidth,
                // ),
                border: Border.all(color: Colors.black),
                // borderRadius:
                //     const BorderRadius.only(
                //   topLeft: Radius.circular(8.0),
                //   topRight: Radius.circular(8.0),
                //   bottomLeft:
                //       Radius.circular(8.0),
                //   bottomRight:
                //       Radius.circular(8.0),
                // ),
              ),
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 500,
                      color: const Color.fromARGB(255, 4, 71, 126),
                      child: const Center(
                        child: Text(
                          "DETAIL ",
                          style: TxtStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: PieChart3(
                              datainput1: double.parse(JGC_DASHBOARD.OK),
                              datainput2: double.parse(JGC_DASHBOARD.WNG),
                              datainput3: double.parse(JGC_DASHBOARD.NG),
                              datainput4: double.parse(JGC_DASHBOARD.AENG),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            child: Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 500,
                                  color: Colors.blue,
                                  child: _datainside(
                                      text: "ALL",
                                      data: JGC_DASHBOARD.ALL_AUTO),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 500,
                                  color: Colors.green,
                                  child: _datainside(
                                      text: "OK", data: JGC_DASHBOARD.OK),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 500,
                                  color: Colors.red.shade200,
                                  child: _datainside(
                                      text: "WNG", data: JGC_DASHBOARD.WNG),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 500,
                                  color: Colors.red.shade500,
                                  child: _datainside(
                                      text: "NG", data: JGC_DASHBOARD.NG),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 50,
                                  width: 500,
                                  color: Colors.red.shade800,
                                  child: _datainside(
                                      text: "AENG", data: JGC_DASHBOARD.AENG),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _selectBUTTON extends StatelessWidget {
  _selectBUTTON({
    Key? key,
    this.select,
    this.selectfn,
    this.tabCOLOR,
    this.text,
  }) : super(key: key);
  bool? select;
  Function(bool)? selectfn;
  Color? tabCOLOR;
  String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        bool dataout = false;
        if (select ?? false) {
          select = false;
          dataout = false;
        } else {
          select = true;
          dataout = true;
        }
        selectfn!(dataout);
      },
      child: Container(
        decoration: BoxDecoration(
          // color: Color(0x00b23127),
          color: select ?? false ? tabCOLOR ?? Colors.black : Colors.white,

          // image: DecorationImage(
          //   image: AssetImage("assets/icons/groupNEW@3x.png"),
          //   fit: BoxFit.fitWidth,
          // ),
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0),
            bottomLeft: Radius.circular(8.0),
            bottomRight: Radius.circular(8.0),
          ),
        ),
        height: 40,
        width: 500,
        child: Center(
          child: Text(text ?? "",
              style: TxtStyle(
                  color: select ?? false ? Colors.white : Colors.black)),
        ),
      ),
    );
  }
}

class _datainside extends StatelessWidget {
  _datainside({
    Key? key,
    this.text,
    this.data,
  }) : super(key: key);
  String? text;
  String? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 30,
          child: Center(
            child: Text(
              text ?? "",
              style: TxtStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            // color: Colors.white,
            child: const Text(
              ":",
              style: TxtStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        Expanded(
          flex: 60,
          child: Center(
            child: Text(
              data ?? "",
              style: const TxtStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
