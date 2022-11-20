// To parse this JSON data, do
//
//     final getHistoryTransaction = getHistoryTransactionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetHistoryTransaction getHistoryTransactionFromJson(String str) => GetHistoryTransaction.fromJson(json.decode(str));

String getHistoryTransactionToJson(GetHistoryTransaction data) => json.encode(data.toJson());

class GetHistoryTransaction {
    GetHistoryTransaction({
        required this.data,
    });

    final Data data;

    factory GetHistoryTransaction.fromJson(Map<String, dynamic> json) => GetHistoryTransaction(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.message,
        required this.transaction,
    });

    final String message;
    final List<Transaction> transaction;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["message"],
        transaction: List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "transaction": List<dynamic>.from(transaction.map((x) => x.toJson())),
    };
}

class Transaction {
    Transaction({
        required this.id,
        required this.merchantsId,
        required this.invoicesId,
        required this.date,
        required this.point,
        required this.paymentTerm,
        required this.merchantId,
        required this.totalcashback,
        required this.userid,
        required this.pdf,
    });

    final int id;
    final String merchantsId;
    final String invoicesId;
    final DateTime date;
    final int point;
    final String paymentTerm;
    final String merchantId;
    final int totalcashback;
    final String userid;
    final String pdf;

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        merchantsId: json["merchants_id"],
        invoicesId: json["invoices_id"],
        date: DateTime.parse(json["date"]),
        point: json["point"],
        paymentTerm: json["payment_term"],
        merchantId: json["merchant_id"],
        totalcashback: json["totalcashback"],
        userid: json["userid"],
        pdf: json["pdf"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merchants_id": merchantsId,
        "invoices_id": invoicesId,
        "date": date.toIso8601String(),
        "point": point,
        "payment_term": paymentTerm,
        "merchant_id": merchantId,
        "totalcashback": totalcashback,
        "userid": userid,
        "pdf": pdf,
    };
}
