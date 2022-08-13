import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/data/entities/base_category_model.dart';
import 'package:meu_dinheirinho/domain/entities/BaseCategory.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';

import '../../../data/data_source/data_source_base_category.dart';
import '../../texts/app_texts.dart';

class AddWalletMoviment extends StatefulWidget {
  const AddWalletMoviment({Key? key}) : super(key: key);

  @override
  State<AddWalletMoviment> createState() => _AddWalletMovimentState();
}

class _AddWalletMovimentState extends State<AddWalletMoviment> {
  String? _selectedItem;
  static DateTime now = DateTime.now();
  DateTime lastDateOfMonth = DateTime(now.year, now.month + 1, 0);

  @override
  DataSourceBaseCategory baseCategoryData = DataSourceBaseCategory();
  Widget build(BuildContext context) {
    var items = baseCategoryData.getKeys();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(backgroundColor: AppColors.backgroundColor, elevation: 0, iconTheme: IconThemeData(color: AppColors.textBlack),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Adicionar Lucro", style: AppTexts.title,),
                Text("Preencha os campos abaixo para salavar o valor do seu lucro na sua carteira.", style: AppTexts.pageDescription,),
                TextField(
                  style: AppTexts.normal,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: AppTexts.normal,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: AppColors.textBlack, width: 1.5)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: AppColors.textBlack, width: 1.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(color: AppColors.primary, width: 1.5)
                    ),
                    labelText: 'Titulo',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 178,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColors.textWhite,
                        border: Border.all(width: 1.5, color: AppColors.textBlack)
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          focusColor: AppColors.textWhite,
                          dropdownColor: AppColors.textWhite,
                          hint: const Text("Categoria"),
                          value: _selectedItem,
                          items : items.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedItem = value;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 178,
                      child: TextField(
                        style: AppTexts.normal,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelStyle: AppTexts.normal,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(color: AppColors.textBlack, width: 1.5)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(color: AppColors.textBlack, width: 1.5)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(color: AppColors.primary, width: 1.5)
                          ),
                          labelText: 'Valor',
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 178,
                      child: ElevatedButton(
                        onPressed: () async {
                          showDatePicker(
                            firstDate: now,
                            initialDate: now,
                            lastDate: lastDateOfMonth, context: context,
                          );
                        }, child: const Text("Data"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}