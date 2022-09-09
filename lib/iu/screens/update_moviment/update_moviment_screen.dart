import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/iu/widgets/text_field.dart';
import 'package:meu_dinheirinho/iu/widgets/value_input.dart';

import '../../../data/data_source/data_source_base_category.dart';
import '../../../data/db/database.dart';
import '../../colors/app_colors.dart';
import '../../texts/app_texts.dart';


class UpdateMovimentScreen extends StatefulWidget {
  const UpdateMovimentScreen({Key? key}) : super(key: key);

  @override
  State<UpdateMovimentScreen> createState() => _UpdateMovimentScreenState();
}

class _UpdateMovimentScreenState extends State<UpdateMovimentScreen> {
  String? _selectedItem;
  static DateTime now = DateTime.now();
  DateTime lastDateOfMonth = DateTime(now.year, now.month + 1, 0);
  DateTime? date;
  bool? repeat;
  int months = 0;
  int newmonth = 0;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  String title = "";
  String? price = "";

  DataSourceBaseCategory baseCategoryData = DataSourceBaseCategory();

  @override
  Widget build(BuildContext context) {
    var items = baseCategoryData.getKeys();
    var isLucro = false;
    var movimentID = ModalRoute.of(context)!.settings.arguments as int;
    Database db = Database();

    return FutureBuilder(
      future: db.getMovimentById(movimentID),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var moviment = snapshot.data as List<MovimentData>;
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
                            Text("Atualizar Dados", style: AppTexts.title,),
                            Text("Informe os campos abaixo para atualizar os dados desta movimentação.", style: AppTexts.pageDescription,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: MyTextField(defaultText: moviment[0].title, label: "Titulo", isNumberInput: false, width: double.infinity, onChanged: (String value) {
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
                                      value: _selectedItem ?? moviment[0].category,
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
                                ValueInput(defaultText: moviment[0].amount.toString(), label: "Valor", isNumberInput: true, width: 178, onChanged: (String value) {
                                  price = value;
                                },)
                              ],
                            ),
                            const SizedBox(height: 15,),
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
                  if (price == "") {
                    price = moviment[0].amount.toString();
                  }
                  
                  var formatPriceString = price?.replaceRange(0, 2, "");
                  var formatPricestring2 = formatPriceString?.replaceAll(",", "");
                  var priceConverted = double.parse(formatPricestring2!);
                  final dao = Database();
                  
                  final movimentData = MovimentCompanion(
                    id: Value(movimentID),
                    title: Value(title.isEmpty ? moviment[0].title : title),
                    amount: Value(priceConverted==0.0 ? moviment[0].amount : priceConverted),
                    createdAt: Value(date ?? moviment[0].createdAt),
                    type: Value(moviment[0].type),
                    category: Value(_selectedItem==null ? moviment[0].category : _selectedItem!),
                    repeat: Value(repeat ?? moviment[0].repeat),
                    repeatMoths: Value(months == 0 ? moviment[0].repeatMoths : months),
                    monthYearString: Value(DateFormat("MMMM y").format(now)),
                  );

                  print(movimentData);

                  // se o mes e ano não existe no db então fazer um novo
                  print(">>>> ${DateFormat("MMMM y").format(now)}");
                  dao.updateItem(movimentData);
                  Navigator.pop(context);
                }, child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("Salvar", style: AppTexts.money,),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text("ERRO: ${snapshot.error}"),));
        }
        return const Scaffold(body: Center(child: CircularProgressIndicator()),);
      },
    );
  }
}

