import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/iu/texts/app_texts.dart';

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
    Database db = Database();
    return SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Historico Geral", style: AppTexts.title,),
          Text("Historico contendo todas as movimentações da sua carteira.", style: AppTexts.pageDescription,),
          Divider(
                  color: AppColors.textBlack,
                  indent: 1,
                  endIndent: 1,
                  thickness: 2,
                ),
          Expanded(
            child: StreamBuilder<List<MovimentData>>(
                            stream: db.getMoviments(),
                            builder: (context, AsyncSnapshot<List<MovimentData>> snapshot) {
                              if (snapshot.connectionState == ConnectionState.active) {
                                if (snapshot.hasData) {
                                  var items = snapshot.data as List<MovimentData>;
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
                              } else if (snapshot.hasData) {
                                return const Center(child: Text("ERROR"));
                              }
                              return const Center(child: CircularProgressIndicator());
                            }, 
                          ),
          ),
        ],
      ),
    ),);
  }
}