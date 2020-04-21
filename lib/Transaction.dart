import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'Transaction.g.dart';

@JsonSerializable()
class Transaction {

  final String title;
  final String amount;
  final String place;
  final String desc;

  Transaction(this.title, this.amount, this.place, this.desc);

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

  static Future<List<Transaction>> getTransactions() async {
    http.Response response = await http.get('http://www.mocky.io/v2/5e9f347e2d00002900cb7a78');
    await Future.delayed(Duration(seconds: 5));
    List txns = json.decode(response.body);
    return txns.map((json) => Transaction.fromJson(json)).toList();
  }
}