class AmountModel {
  final int amount;

  AmountModel({required this.amount});

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(amount: json['amount']);
  }

  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }
}
