import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/08-INCOILBYDATEb.dart';
import '../data/model.dart';
import 'P8INCOILBYDATE/INCOILBYDATEmain.dart';
import 'page0.dart';
import '../data/global.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page8BlocTableBody();
  }
}

class Page8BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page8BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => INCOILBYDATEb_Bloc(),
        child: BlocBuilder<INCOILBYDATEb_Bloc, List<dataset>>(
          builder: (context, data) {
            return Page8Body(
              data: data,
            );
          },
        ));
  }
}

class Page8Body extends StatelessWidget {
  Page8Body({Key? key, this.data}) : super(key: key);
  List<dataset>? data;
  @override
  Widget build(BuildContext context) {
    return INCOILBYDATEmain(
      data: data,
    );
  }
}
