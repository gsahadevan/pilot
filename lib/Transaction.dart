import 'package:json_annotation/json_annotation.dart';

part 'Transaction.g.dart';

@JsonSerializable()
class Transaction {

  final String title;
  final String amount;
  final String place;
  final String desc;

  Transaction(this.title, this.amount, this.place, this.desc);

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}