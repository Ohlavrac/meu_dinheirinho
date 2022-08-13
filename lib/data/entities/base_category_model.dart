import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/domain/entities/BaseCategory.dart';

class BaseCategoryModel extends BaseCategory {
  String? name;
  Icon? icon;

  BaseCategoryModel({this.name, this.icon});

  BaseCategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    return data;
  }
}
