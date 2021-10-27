class LoanAppApiException {
  final String? errorText;

  LoanAppApiException([this.errorText]);

  @override
  String toString() {
    return errorText ?? super.toString();
  }
}
