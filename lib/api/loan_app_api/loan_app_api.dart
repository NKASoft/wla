import 'package:wla/model/loan_app_model.dart';

abstract class LoanAppApi {
  Future<List<LoanAppModel>> getAllLoanApps();
}
