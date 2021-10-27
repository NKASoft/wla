import 'package:wla/api/api.dart';

import 'loan_app_mock_api/loan_app_mock_api.dart';

class MockApi implements Api {
  late final LoanAppApi _loanAppApi;

  MockApi({int artificialCallDelayMSec = 500}) {
    _loanAppApi = LoanAppMockApi(artificialCallDelayMSec: artificialCallDelayMSec);
  }

  @override
  LoanAppApi get loanAppApi => _loanAppApi;
}
