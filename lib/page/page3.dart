import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/03-JGC-DASHBOSRD.dart';
import '03JGC-DASHBOARD/JGC-DASHBOARDmain.dart';
import '03JGC-DASHBOARD/JGC-DASHBOARDvar.dart';
import 'page0.dart';
import '../data/global.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocTableBodyDH();
  }
}

class Page3BlocTableBodyDH extends StatelessWidget {
  const Page3BlocTableBodyDH({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => JGCdashboardGET_Bloc(),
        child: BlocBuilder<JGCdashboardGET_Bloc, JGCDASHBOARDclass>(
          builder: (context, dataDH) {
            return Page3Body(
              dataDH: dataDH,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({Key? key, this.dataDH}) : super(key: key);
  JGCDASHBOARDclass? dataDH;
  @override
  Widget build(BuildContext context) {
    return JGC_DASHBOARDmain(
      dataDH: dataDH,
    );
  }
}
