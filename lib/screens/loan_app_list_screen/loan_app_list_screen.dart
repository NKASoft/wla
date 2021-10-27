import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wla/bloc/loan_app/loan_app_list_bloc/loan_app_list_bloc.dart';
import 'package:wla/views/loan_app_list_view/loan_app_list_view.dart';

class LoanAppsScreen extends StatelessWidget {
  static const routeName = 'loan_apps';

  const LoanAppsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => LoanAppListBloc()..add(LoanAppListReload()),
      child: const LoanAppListView(),
    );
  }
}
