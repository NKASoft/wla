import 'dart:math';

import 'package:wla/api/api.dart';

class LoanAppMockApi implements LoanAppApi {
  final Duration _artificialCallDelay;
  LoanAppMockApi({int artificialCallDelayMSec = 500})
      : _artificialCallDelay = Duration(milliseconds: artificialCallDelayMSec);

  @override
  Future<List<LoanAppModel>> getAllLoanApps() async {
    await Future.delayed(_artificialCallDelay);
    if (Random().nextInt(100) > 70) {
      throw LoanAppApiException('getAllLoanApps execution error');
    }
    return _loanAppMockList;
  }
}

final _loanAppMockList = [
  LoanAppModel(
      id: 1, borrowerName: 'Иванов Иван', creditAmount: 100000, creditTermInMounths: 12, mounthlyPayment: 5000),
  LoanAppModel(
      id: 2, borrowerName: 'Долганов Игорь', creditAmount: 500000, creditTermInMounths: 24, mounthlyPayment: 10000),
  LoanAppModel(
      id: 3, borrowerName: 'Куликов Андрей', creditAmount: 80000, creditTermInMounths: 12, mounthlyPayment: 3000),
];
