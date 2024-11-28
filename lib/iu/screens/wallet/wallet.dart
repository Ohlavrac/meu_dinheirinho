import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/data/data_source/data_source_base_category.dart';
import 'package:meu_dinheirinho/data/db/database.dart';
import 'package:meu_dinheirinho/domain/entities/moviment_entity.dart';
import 'package:meu_dinheirinho/domain/use_case/wallet_amount/wallet_amount.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';
import 'package:meu_dinheirinho/iu/texts/app_texts.dart';
import 'package:meu_dinheirinho/iu/widgets/custom_divider.dart';
import 'package:meu_dinheirinho/iu/widgets/history_card.dart';
import 'package:meu_dinheirinho/iu/widgets/square_card_button.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final DateTime _date = DateTime.now();
  DataSourceBaseCategory baseCategoryData = DataSourceBaseCategory();
  final formatCurrency = NumberFormat.simpleCurrency(name: "R\$ ");
  String monthAndYear = DateFormat("MMMM y").format(DateTime.now());
  WalletAmount walletAmount = WalletAmount();

  @override
  Widget build(BuildContext context) {
    Database db = Database();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Minha Carteira", style: AppTexts.title,),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  height: 115,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        offset: const Offset(3, 2)
                      )
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Saldo da carteira", style: AppTexts.subtitle,),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(DateFormat("d 'de' MMMM 'de' y").format(_date), style: AppTexts.subtitle,),
                      ),
                      StreamBuilder(
                        stream: db.getMovimentsByMonth(monthAndYear, _date),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.active) {
                            if (snapshot.hasData) {
                              var amounts = snapshot.data as List<MovimentEntity>;
                              
                              var total = walletAmount.getWalletAmount(amounts);

                              return Text("${formatCurrency.format(total)}", style: AppTexts.money,);
                            } else {
                              return const Center(child: Text("ERROR"),);
                            }
                          } else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        }
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SquareCardButton(icon: const Icon(Icons.north_east, size: 50,), color: AppColors.primary, label: "Adicionar Lucro", redOrGreen: true,),
                    SquareCardButton(icon: const Icon(Icons.call_received, size: 50, color: Colors.red,), color: AppColors.textBlack, label: "Adicionar Gasto", redOrGreen: false,),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Historico de Movimentação", style: AppTexts.title,),
                    IconButton(
                      iconSize: 18,
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        setState(() {
                          
                        });
                      },
                    )
                  ],
                ),
                const CustomDivider(),
                Expanded(
                  child: StreamBuilder<List<MovimentEntity>>(
                    stream: db.getMovimentsByMonth(monthAndYear, _date),
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
                          return Center(child: Text("ERROR: ${snapshot.error}"),);
                        }
                      } else if (snapshot.hasData) {
                        return Center(child: Text("ERROR: ${snapshot.error}"),);
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}