import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/05-JGCreportEachPO.dart';
import '../bloc/cubit/Rebuild.dart';
import '05JGCreportEachPO/JGCreportEachPOMAIN.dart';
import '05JGCreportEachPO/JGCreportEachPOVAR.dart';
import 'page0.dart';
import '../data/global.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5REBUILD();
  }
}

class Page5REBUILD extends StatelessWidget {
  const Page5REBUILD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return Page5BlocTableBody();
      },
    );
  }
}

class Page5BlocTableBody extends StatelessWidget {
  const Page5BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => JGCreportEachPO_Bloc(),
        child: BlocBuilder<JGCreportEachPO_Bloc, datainEachPO>(
          builder: (context, data) {
            return Page5Body(
              data: data,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({Key? key, this.data}) : super(key: key);
  datainEachPO? data;
  @override
  Widget build(BuildContext context) {
    return JGCreportEachPOMAIN(
      data: data,
    );
  }
}
