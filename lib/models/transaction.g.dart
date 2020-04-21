// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    json['title'] as String,
    json['amount'] as String,
    json['place'] as String,
    json['desc'] as String,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'title': instance.title,
      'amount': instance.amount,
      'place': instance.place,
      'desc': instance.desc,
    };
