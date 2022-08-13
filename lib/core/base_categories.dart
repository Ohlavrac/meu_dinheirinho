import 'package:flutter/material.dart';

import '../data/entities/base_category_model.dart';

List<BaseCategoryModel> baseCategory = baseCategoriesJson.map((object) => BaseCategoryModel.fromJson(object)).toList();

const List<Map<String, dynamic>> baseCategoriesJson = [
  {
    "name": "Streaming",
    "icon": Icon(Icons.play_circle, size: 45,)
  },
  {
    "name": "Comida",
    "icon": Icon(Icons.food_bank, size: 45,)
  },
  {
    "name": "Lazer",
    "icon": Icon(Icons.celebration, size: 45,)
  },
  {
    "name": "Jogos",
    "icon": Icon(Icons.videogame_asset, size: 45,)
  },
  {
    "name": "Educação",
    "icon": Icon(Icons.school, size: 45,)
  },
  {
    "name": "Cartão",
    "icon": Icon(Icons.credit_card, size: 45,)
  },
  {
    "name": "Saúde",
    "icon": Icon(Icons.health_and_safety, size: 45,)
  },
  {
    "name": "Empréstimo",
    "icon": Icon(Icons.request_quote, size: 45,)
  },
  {
    "name": "Transporte",
    "icon": Icon(Icons.directions_car, size: 45,)
  },
  {
    "name": "Salário",
    "icon": Icon(Icons.payments, size: 45,)
  },
  {
    "name": "Outros",
    "icon": Icon(Icons.disabled_by_default, size: 45,)
  },
];