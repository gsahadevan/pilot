class Transaction {

  final String title;
  final String amount;
  final String place;
  final String desc;

  Transaction(this.title, this.amount, this.place, this.desc);

  Transaction.fromJson(Map<String, dynamic> json) :
      title = json['title'],
      amount = json['amount'],
      place = json['place'],
      desc = json['desc'];

}