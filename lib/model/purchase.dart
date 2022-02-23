import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kozarni_ecome/model/township.dart';

class PurchaseModel {
  final String? id;
  final List items;
  final String name;
  final String email;
  final int phone;
  final String address;
  final String? bankSlipImage;
  final Township township;
  final DateTime? dateTime;

  PurchaseModel({
    this.id,
    required this.items,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.township,
    required this.bankSlipImage,
    this.dateTime,
  });

  //Object Clone
  PurchaseModel copyWith({
    String? id,
    List? items,
    String? name,
    String? email,
    int? phone,
    String? address,
    String? bankSlipImage,
    Township? township,
    DateTime? dateTime,
  }) =>
      PurchaseModel(
        items: items ?? this.items,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        township: township ?? this.township,
        bankSlipImage: bankSlipImage ?? this.bankSlipImage,
      );

  factory PurchaseModel.fromJson(Map<String, dynamic> json, String id) =>
      PurchaseModel(
        id: id,
        items: json['items'] as List,
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as int,
        address: json['address'] as String,
        bankSlipImage: json['bankSlipImage'] as String?,
        township: Township.fromJson(json['township']),
        dateTime: (json['dateTime'] as Timestamp).toDate(),
      );

  @override
  String toString() {
    return "$id,$items,$name,$email,$phone,$address,$bankSlipImage,$dateTime";
  }

  Map<String, dynamic> toJson() => {
        'items': items,
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'bankSlipImage': bankSlipImage,
        'township': township.toJson(),
        'dateTime': dateTime ?? DateTime.now(),
      };
}
