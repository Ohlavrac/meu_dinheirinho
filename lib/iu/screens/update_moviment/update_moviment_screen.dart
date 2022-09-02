import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/data_source/data_source_base_category.dart';
import '../../../data/db/database.dart';
import '../../colors/app_colors.dart';
import '../../texts/app_texts.dart';
import '../../widgets/large_text_field.dart';
import '../../widgets/price_input.dart';

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
  bool _repeat = false;
  int mounths = 0;
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

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(backgroundColor: AppColors.backgroundColor, elevation: 0, iconTheme: IconThemeData(color: AppColors.textBlack),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: FutureBuilder(
              future: db.getMovimentById(movimentID),
              builder: (context, snapshot) {
                print(snapshot.data);
                print(movimentID);
                if (snapshot.hasData) {
                  var moviment = snapshot.data as List<MovimentData>;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Atualizar Dados", style: AppTexts.title,),
                      Text("Informe os campos abaixo para atualizar os dados desta movimentação.", style: AppTexts.pageDescription,),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: LargeTextField(defaultText: moviment[0].title, label: "Titulo", isNumberInput: false, width: double.infinity, onChanged: (String value) {
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
                          PriceInput(defaultText: moviment[0].amount.toString(), label: "Valor", isNumberInput: true, width: 178, onChanged: (String value) {
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
                                primary: AppColors.primary,
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
                                child: Text(DateFormat("d 'de' MMMM 'de' y").format(date == null ? moviment[0].createdAt! : date!), style: AppTexts.normal2,),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: moviment[0].repeat,
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
                      moviment[0].repeat == true ?
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: SizedBox(
                          width: 178,
                          child: TextField(
                            controller: TextEditingController(text: moviment[0].repeatMoths.toString()),
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
                              mounths = int.parse(value);
                            },
                          ),
                        ),
                      ) :
                      const Text(""),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("ERRO: ${snapshot.error}"));
                }
                return const Center(child: CircularProgressIndicator(),);
              },
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
            var formatPriceString = price?.replaceRange(0, 2, "");
            var formatPricestring2 = formatPriceString?.replaceAll(",", "");
            var priceConverted = double.parse(formatPricestring2!);
            final dao = Database();
            print(priceConverted);
            
            print("Title: $title | Category: $_selectedItem | Price: $priceConverted | Date: $date | Repeat: $_repeat | $isLucro | $mounths");
            
            final movimentData = MovimentCompanion(
              title: Value(title),
              amount: Value(priceConverted),
              createdAt: Value(date),
              type: Value(isLucro),
              category: Value(_selectedItem!),
              repeat: Value(_repeat),
              repeatMoths: Value(mounths),
              monthYearString: Value(DateFormat("MMMM y").format(now)),
            );

            // se o mes e ano não existe no db então fazer um novo
            print(">>>> ${DateFormat("MMMM y").format(now)}");
            //dao.addMoviment(movimentData);
            //Navigator.pop(context);
          }, child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Salvar", style: AppTexts.money,),
          ),
        ),
      ),
    );
  }
}