import 'loan_app_api/loan_app_api.dart';

export 'loan_app_api/loan_app_api_exceptions.dart';
export 'loan_app_api/loan_app_api.dart';

export 'package:wla/model/loan_app_model.dart';

abstract class Api {
  LoanAppApi get loanAppApi;
}
