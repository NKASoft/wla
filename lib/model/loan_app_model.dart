class LoanAppModel {
  final int? id;
  final String borrowerName;
  final int creditAmount;
  final int creditTermInMounths;
  final int mounthlyPayment;

  LoanAppModel({
    this.id,
    required this.borrowerName,
    required this.creditAmount,
    required this.creditTermInMounths,
    required this.mounthlyPayment,
  });
}
