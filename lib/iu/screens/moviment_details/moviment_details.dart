import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/data/db/database.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';
import 'package:meu_dinheirinho/iu/texts/app_texts.dart';
import 'package:drift/drift.dart' hide Column;

class MovimentDetails extends StatefulWidget {
  const MovimentDetails({Key? key}) : super(key: key);

  @override
  State<MovimentDetails> createState() => _MovimentDetailsState();
}

class _MovimentDetailsState extends State<MovimentDetails> {
  @override
  Widget build(BuildContext context) {
    var movimentID = ModalRoute.of(context)!.settings.arguments as int;
    Database db = Database();
    DateTime date = DateTime.now();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(backgroundColor: AppColors.backgroundColor, elevation: 0, iconTheme: IconThemeData(color: AppColors.textBlack),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FutureBuilder(
          future: db.getMovimentById(movimentID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var item = snapshot.data as List<MovimentData>;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(item[0].title, style: AppTexts.title,),
                      item[0].type == true ?
                      const Icon(Icons.arrow_upward) :
                      const Icon(Icons.arrow_downward)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(DateFormat("d 'de' MMMM 'de' y").format(item[0].createdAt as DateTime), style: AppTexts.simple,),
                  ),
                  Text(item[0].category, style: AppTexts.simple,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text("${item[0].amount} R\$", style: AppTexts.simple,),
                  ),
                  item[0].repeat == true ?
                  Text("Este valor ira se repetir por ${item[0].repeatMoths} meses", style: AppTexts.simple,) :
                  const Text(""),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          final movimentData = MovimentCompanion(
                            id: Value(movimentID),
                            title: Value(item[0].title),
                            amount: Value(item[0].amount),
                            createdAt: Value(item[0].createdAt),
                            type: Value(item[0].type),
                            category: Value(item[0].category),
                            repeat: const Value(false),
                            repeatMoths: const Value(0),
                            monthYearString: Value(item[0].monthYearString),
                            lastMonth: Value(date),
                            lastMonthYearString: Value(DateFormat("MMMM y").format(date))
                          );
                          db.stopMovementContinue(movimentData);
                          Navigator.pop(context);
                        },
                        label: Text("Parar de repetir", style: AppTexts.subtitle,),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal
                        ),
                      ),

                      const SizedBox(height: 15,),

                      ElevatedButton.icon(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          db.deleteItem(movimentID);
                          Navigator.pop(context);
                        },
                        label: Text("Deletar", style: AppTexts.subtitle,),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                        ),
                      ),

                      const SizedBox(height: 15,),

                      ElevatedButton.icon(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.pushNamed(context, "/updateMovimentScreen", arguments: movimentID);
                        },
                        label: Text("Editar", style: AppTexts.subtitle,),
                        style:ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("ERROR: ${snapshot.error}"),);
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
      
    );
  }
}