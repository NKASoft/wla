import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wla/bloc/loan_app/loan_app_list_bloc/loan_app_list_bloc.dart';

class LoanAppListView extends StatelessWidget {
  const LoanAppListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanAppListBloc = BlocProvider.of<LoanAppListBloc>(context);

    return BlocConsumer<LoanAppListBloc, LoanAppListState>(listener: (ctx, state) {
      if (state is LoanAppListReloadingError) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            action: SnackBarAction(
                label: 'Повторить загрузку',
                onPressed: () => loanAppListBloc.add(
                      LoanAppListReload(),
                    ))));
      } else if (state is LoanAppListReloading) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    }, builder: (ctx, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Кредитные заявки'), actions: [
          IconButton(
              onPressed: state is! LoanAppListReloading
                  ? () {
                      loanAppListBloc.add(LoanAppListReload());
                    }
                  : null,
              icon: const Icon(Icons.refresh))
        ]),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: loanAppListBloc.loanAppList.length,
              itemBuilder: (ctx, index) {
                return ListTile(title: Text(loanAppListBloc.loanAppList[index].borrowerName));
              },
            ),
            if (state is LoanAppListReloading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      );
    });
  }
}
