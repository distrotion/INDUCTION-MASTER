import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/04-JGCreport.dart';
import '../bloc/cubit/Rebuild.dart';
import '04JGCreport/JGCreportMAIN.dart';
import '04JGCreport/JGCreportVAR.dart';
import 'page0.dart';
import '../data/global.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4REBUILD();
  }
}

class Page4REBUILD extends StatelessWidget {
  const Page4REBUILD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocPageRebuild, bool>(
      builder: (_, e) {
        return Page4BlocTableBody();
      },
    );
  }
}

class Page4BlocTableBody extends StatelessWidget {
  const Page4BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => JGCreportGET_Bloc(),
        child: BlocBuilder<JGCreportGET_Bloc, datain>(
          builder: (context, data) {
            return Page4Body(
              data: data,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({
    Key? key,
    this.data,
  }) : super(key: key);
  datain? data;

  @override
  Widget build(BuildContext context) {
    return JGCreportMAIN(
      data: data,
    );
  }
}
