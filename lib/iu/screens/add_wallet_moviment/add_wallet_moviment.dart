import 'package:flutter/material.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/data/db/database.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';
import 'package:meu_dinheirinho/iu/widgets/large_text_field.dart';
import 'package:meu_dinheirinho/iu/widgets/price_input.dart';

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
  DateTime? date;
  bool _repeat = false;
  int months = 0;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  String title = "";
  String? price = "";

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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: isLucro == true ? "Adicionar " : "Adicionar ", style: AppTexts.title,),
                      isLucro == true ? TextSpan(text:  "Lucro", style: AppTexts.titleGreen,) :  TextSpan(text: "Gasto", style: AppTexts.titleRed,)
                    ],
                  ),
                ),
                Text(isLucro == true ? "Preencha os campos abaixo para salavar o valor do seu lucro na sua carteira.":"Preencha os campos abaixo para remover a quantia da sua carteira", style: AppTexts.pageDescription,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: LargeTextField(label: "Titulo", isNumberInput: false, width: double.infinity, onChanged: (String value) {
                    title = value;
                  },)
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
                    PriceInput(label: "Valor", isNumberInput: true, width: 178, onChanged: (String value) {
                      price = value;
                    },)
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
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1.5, color: AppColors.textBlack)
                          ),
                        ),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            firstDate: now,
                            initialDate: now,
                            lastDate: lastDateOfMonth, context: context,
                          );
                          setState(() {
                            newDate == null ? date = null : date = newDate;
                          });
                        }, child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Text(date == null ? "Data" : DateFormat("d 'de' MMMM 'de' y").format(date!), style: AppTexts.normal2,),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    width: 178,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: AppTexts.simple,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelStyle: AppTexts.simple,
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
                        labelText: "Quantos Meses",
                      ),
                      onChanged: (value) {
                        months = int.parse(value);
                      },
                    ),
                  ),
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
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.5, color: AppColors.textBlack)
            ),
          ),
          onPressed: () async {
            var formatPriceString = price?.replaceRange(0, 2, "");
            var formatPricestring2 = formatPriceString?.replaceAll(",", "");
            var priceConverted = double.parse(formatPricestring2!);
            final dao = Database();
            print(priceConverted);
            
            print("Title: $title | Category: $_selectedItem | Price: $priceConverted | Date: $date | Repeat: $_repeat | $isLucro | $months");
            
            var last = date!.add(Duration(days: months * 31));

            final movimentData = MovimentCompanion(
              title: Value(title),
              amount: Value(priceConverted),
              createdAt: Value(date),
              type: Value(isLucro!),
              category: Value(_selectedItem!),
              repeat: Value(_repeat),
              repeatMoths: Value(months),
              monthYearString: Value(DateFormat("MMMM y").format(now)),
              lastMonthYearString: Value(DateFormat("MMMM y").format(last)),
              lastMonth: Value(last),
            );

            // se o mes e ano não existe no db então fazer um novo
            print(">>>> ${DateFormat("MMMM y").format(now)}");
            dao.addMoviment(movimentData);
            Navigator.pop(context);
          }, child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Salvar", style: AppTexts.money,),
          ),
        ),
      ),
    );
  }
}