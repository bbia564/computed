

class DCCaculateModel {
  int? id;
  String? type;
  double? amount;
  String? countStr;
  int? createTime;

  DCCaculateModel(
      {this.id, this.type, this.amount, this.countStr, this.createTime});

  DCCaculateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    countStr = json['countStr'];
    createTime = json["createTime"];
  }
}
