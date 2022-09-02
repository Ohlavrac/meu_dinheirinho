import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/iu/screens/add_wallet_moviment/add_wallet_moviment.dart';
import 'package:meu_dinheirinho/iu/screens/moviment_details/moviment_details.dart';
import 'package:meu_dinheirinho/iu/screens/screen_base.dart';
import 'package:meu_dinheirinho/iu/screens/update_moviment/update_moviment_screen.dart';

import 'iu/screens/wallet/wallet.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meu Dinheirinho",
      initialRoute: "/base",
      routes: {
        "/base": (context) => const ScreenBase(),
        "/wallet": (context) => const Wallet(),
        "/addWalletMoviment": (context) => const AddWalletMoviment(),
        "/movimentDetails": (context) => const MovimentDetails(),
        "/updateMovimentScreen": (context) => const UpdateMovimentScreen()
      },
    );
  }
}