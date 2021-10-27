import 'package:wla/model/loan_app_model.dart';

abstract class LoanAppListState {}

class LoanAppListReloading extends LoanAppListState {
  final List<LoanAppModel> loanAppList;

  LoanAppListReloading([this.loanAppList = const []]);
}

class LoanAppListReloaded extends LoanAppListState {
  final List<LoanAppModel> loanAppList;

  LoanAppListReloaded(this.loanAppList);
}

class LoanAppListReloadingError extends LoanAppListState {
  final List<LoanAppModel> loanAppList;
  final String errorMessage;

  LoanAppListReloadingError(this.loanAppList, this.errorMessage);
}
