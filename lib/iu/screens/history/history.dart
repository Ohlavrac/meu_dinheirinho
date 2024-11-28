import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/iu/providers/moviment_provider.dart';
import 'package:meu_dinheirinho/iu/texts/app_texts.dart';
import 'package:meu_dinheirinho/iu/widgets/custom_divider.dart';
import 'package:provider/provider.dart';

import '../../../data/data_source/data_source_base_category.dart';
import '../../../data/db/database.dart';
import '../../colors/app_colors.dart';
import '../../widgets/history_card.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DataSourceBaseCategory baseCategoryData = DataSourceBaseCategory();
  
  @override
  Widget build(BuildContext context) {
    var movimentProvider = Provider.of<MovimentProvider>(context);
    Database db = Database();
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Historico Geral", style: AppTexts.title,),
          Text("Historico contendo todas as movimentações da sua carteira.", style: AppTexts.pageDescription,),
          const CustomDivider(),
          Expanded(
            child: StreamBuilder<List<MovimentEntity>>(
                            stream: movimentProvider.getMoviments(),
                            builder: (context, AsyncSnapshot<List<MovimentEntity>> snapshot) {

                              if (snapshot.hasError) {
                                return Text("> ${snapshot.error}");
                              } else {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator(),);
                                } else if (snapshot.connectionState == ConnectionState.none) {
                                  return Center(child:  Text("OXI NONE"),);
                                } else if (snapshot.connectionState == ConnectionState.done) {
                                  return Text("SUVACO");
                                } else if (snapshot.connectionState == ConnectionState.active) {
                                  var items = snapshot.data as List<MovimentEntity>;
                                  return ListView.builder(
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      var item = items[index];
                                      var icon = baseCategoryData.getKey(items[index].category);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        child: HistoryCard(icon: icon, item: item,)
                                      );
                                    },
                                  );
                                } else {
                                  return Text("NADA NADA NADA");
                                }
                              }



                              /*if (snapshot.connectionState == ConnectionState.active) {
                                if (snapshot.hasData) {
                                  var items = snapshot.data as List<MovimentEntity>;
                                  return ListView.builder(
                                    itemCount: items.length,
                                    itemBuilder: (context, index) {
                                      var item = items[index];
                                      var icon = baseCategoryData.getKey(items[index].category);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        child: HistoryCard(icon: icon, item: item,)
                                      );
                                    },
                                  );
                                } else {
                                  return const Center(child: Text("ERROR"));
                                }
                              } else if (snapshot.hasError) {
                                return Center(child: Text("ERROR: ${snapshot.error}"));
                              } else {
                                return const Center(child: CircularProgressIndicator());
                              }*/
                            },
                          ),
          ),
        ],
      ),
    ),);
  }
}