import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/data/db/database.dart';
import 'package:meu_dinheirinho/data/entities/base_category_model.dart';

import '../colors/app_colors.dart';
import '../texts/app_texts.dart';

class HistoryCard extends StatelessWidget {
  final MovimentData item;
  final BaseCategoryModel icon;

  const HistoryCard({Key? key, required this.item, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, "/movimentDetails", arguments: item.id),
      },
      child: Card(
        elevation: 5,
        child: ListTile(
          tileColor: AppColors.primary,
          leading: icon.icon,
          title: Text(item.title, style: AppTexts.normal2,),
          subtitle: Text(item.category, style: AppTexts.category,),
          trailing: item.type == true ? Text("R\$ ${item.amount}", style: AppTexts.positive,) : 
            Text("- R\$ ${item.amount}", style: AppTexts.negative,)
        ),
      ),
    );
  }
}