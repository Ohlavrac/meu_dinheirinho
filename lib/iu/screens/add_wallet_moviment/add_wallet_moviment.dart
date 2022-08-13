import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';
import 'package:meu_dinheirinho/iu/widgets/large_text_field.dart';

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
  bool _repeat = false;

  @override
  DataSourceBaseCategory baseCategoryData = DataSourceBaseCategory();
  Widget build(BuildContext context) {
    var items = baseCategoryData.getKeys();
    var isLucro = ModalRoute.of(context)!.settings.arguments as bool?;

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
                Text(isLucro == true ? "Adicionar Lucro" : "Adicionar Gasto", style: AppTexts.title,),
                Text(isLucro == true ? "Preencha os campos abaixo para salavar o valor do seu lucro na sua carteira.":"Preencha os campos abaixo para remover a quantia da sua carteira", style: AppTexts.pageDescription,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: LargeTextField(label: "Titulo", isNumberInput: false, width: double.infinity,)
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
                          elevation: 0,
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
                    const LargeTextField(label: "Valor", isNumberInput: true, width: 178)
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 178,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.5, color: AppColors.textBlack)
                          ),
                        ),
                        onPressed: () async {
                          showDatePicker(
                            firstDate: now,
                            initialDate: now,
                            lastDate: lastDateOfMonth, context: context,
                          );
                        }, child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Text("Data", style: AppTexts.normal2,),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: _repeat,
                          onChanged: (value) {
                            setState(() {
                              _repeat = value!;
                            });
                          },
                          activeColor: AppColors.primary,
                        ),
                        Text("Valor Recorrente", style: AppTexts.simple,)
                      ],
                    ),
                  ],
                ),
                _repeat == true ?
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: LargeTextField(label: "Quantos meses ?", isNumberInput: true, width: double.infinity,)
                ) :
                const Text(""),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.primary,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.5, color: AppColors.textBlack)
            ),
          ),
          onPressed: () async {
                  
          }, child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Salvar", style: AppTexts.money,),
          ),
        ),
      ),
    );
  }
}