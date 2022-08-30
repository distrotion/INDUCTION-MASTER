import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/09-1-INDgetallActual.dart';
import '../data/model.dart';
import 'P9ACTIVECOIL/ACTIVECOILmain.dart';
import 'page0.dart';
import '../data/global.dart';

class Page9 extends StatelessWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page9BlocTableBody();
  }
}

class Page9BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page9BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INDgetallActual_Bloc(),
        child: BlocBuilder<INDgetallActual_Bloc, List<dataset>>(
          builder: (context, data) {
            return Page9Body(
              data: data,
            );
          },
        ));
  }
}

class Page9Body extends StatelessWidget {
  Page9Body({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ACTIVECOILmain(
        data: data,
      ),
    );
  }
}
