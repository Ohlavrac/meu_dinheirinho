import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meu_dinheirinho/iu/colors/app_colors.dart';
import 'package:meu_dinheirinho/iu/texts/app_texts.dart';
import 'package:meu_dinheirinho/iu/widgets/square_card_button.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Minhas Carteira", style: AppTexts.title,),
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
                      Text("R\$ 1.236.00", style: AppTexts.money,)
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SquareCardButton(icon: const Icon(Icons.north_east, size: 50,), color: AppColors.primary, label: "Adicionar Lucro"),
                    SquareCardButton(icon: const Icon(Icons.call_received, size: 50, color: Colors.red,), color: AppColors.textBlack, label: "Adicionar Gasto"),
                  ],
                ),
                const SizedBox(height: 20,),
                Text("Historico de Movimentação", style: AppTexts.title,),
                Divider(
                  color: AppColors.textBlack,
                  indent: 1,
                  endIndent: 1,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Card(
                          child: ListTile(
                            tileColor: AppColors.primary,
                            leading: Icon(Icons.play_circle, size: 45,),
                            title: Text("Netflix"),
                            subtitle: Text("Streaming"),
                            trailing: Text("- 56.60 R\$"),
                          ),
                        ),
                      );
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