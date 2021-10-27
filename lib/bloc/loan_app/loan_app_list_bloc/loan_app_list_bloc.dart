import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:wla/api/api.dart';

import 'package:wla/di.dart';
import 'loan_app_list_event.dart';
import 'loan_app_list_state.dart';

export 'loan_app_list_event.dart';
export 'loan_app_list_state.dart';

class LoanAppListBloc extends Bloc<LoanAppListEvent, LoanAppListState> {
  LoanAppListBloc() : super(LoanAppListReloading());

  final List<LoanAppModel> loanAppList = [];

  @override
  Stream<LoanAppListState> mapEventToState(LoanAppListEvent event) async* {
    if (event is LoanAppListReload) {
      yield LoanAppListReloading(List.unmodifiable(loanAppList));

      try {
        final loanAppsLoaded = await DI.api.loanAppApi.getAllLoanApps();
        loanAppList.clear();
        loanAppList.addAll(loanAppsLoaded);
        yield LoanAppListReloaded(List.unmodifiable(loanAppList));
      } catch (e) {
        yield LoanAppListReloadingError(List.unmodifiable(loanAppList), e.toString());
      }
    }
  }
}
