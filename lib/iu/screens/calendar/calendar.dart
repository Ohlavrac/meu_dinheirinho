import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';
import 'package:meu_dinheirinho/iu/widgets/custom_divider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../data/data_source/data_source_base_category.dart';
import '../../../domain/use_case/wallet_amount/wallet_amount.dart';
import '../../providers/moviment_provider.dart';
import '../../texts/app_texts.dart';
import '../../widgets/history_card.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.week;
  DataSourceBaseCategory baseCategoryData = DataSourceBaseCategory();
  DateTime focusDay = DateTime.now();
  String monthAndYear = DateFormat("MMMM y").format(DateTime.now());
  WalletAmount walletAmount = WalletAmount();
  final formatCurrency = NumberFormat.simpleCurrency(name: "R\$ ");
  

  @override
  Widget build(BuildContext context) {
    
    var movimentProvider = Provider.of<MovimentProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SafeArea(
          child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {
                    setState(() {
                      focusDay = focusDay.subtract(const Duration(days: 31));
                      print(">>>>> ${DateFormat("MMMM 'de' y").format(focusDay)}");
                    });
                  }, icon: const Icon(Icons.arrow_back),),
                  Text(DateFormat("MMMM 'de' y").format(focusDay), style: AppTexts.normal,),
                  IconButton(onPressed: () {
                    setState(() {
                      focusDay = focusDay.add(const Duration(days: 31));
                      print(">>>>> ${DateFormat("MMMM 'de' y").format(focusDay)}");
                    });
                  }, icon: const Icon(Icons.arrow_forward),),
                ],
              ),
              StreamBuilder(
                stream: movimentProvider.getMovimentsByMonth(monthAndYear, focusDay),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      var amounts = snapshot.data as List<MovimentEntity>;
                                  
                      var total = walletAmount.getWalletAmountByMonthe(amounts, monthAndYear);
                      var totalSpending = walletAmount.getWalletSpendingByMonth(amounts, monthAndYear);
                      var totalMovimentAmount = walletAmount.getWalletTotalAmountByMonth(amounts, monthAndYear);
    
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Lucro total do Mes: ${formatCurrency.format(total)}", style: AppTexts.simple,),
                          Text("Gasto total do Mes: ${formatCurrency.format(totalSpending)}", style: AppTexts.simple,),
                          Text("Movimento total do Mes: ${formatCurrency.format(totalMovimentAmount)}", style: AppTexts.simple,),
                        ],
                      );
                    } else {
                      return const Center(child: Text("ERROR"),);
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
              ),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 5),
                child: CustomDivider(),
              ),
              Expanded(
                child: StreamBuilder<List<MovimentEntity>>(
                  stream: movimentProvider.getMovimentsByMonth(monthAndYear, focusDay),
                  builder: (context, AsyncSnapshot<List<MovimentEntity>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
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
                        return const Center(child: Text("ERROR 1"));
                      }
                    }
                    return const Center(child: CircularProgressIndicator());
                  }, 
                ),
              ),
            ],
          ),),
        ),
      ),
    );
  }
}