import 'package:flutter/material.dart';
import 'package:meu_dinheirinho/data/data_source/local_datasource.dart';
import 'package:meu_dinheirinho/data/repositories/moviment_repository.dart';
import 'package:meu_dinheirinho/domain/use_case/create_moviment_usecase.dart';
import 'package:meu_dinheirinho/domain/use_case/get_moviment_by_id_usecase.dart';
import 'package:meu_dinheirinho/domain/use_case/get_moviments_by_month_usecase.dart';
import 'package:meu_dinheirinho/domain/use_case/get_moviments_usecase.dart';
import 'package:meu_dinheirinho/iu/providers/moviment_provider.dart';
import 'package:meu_dinheirinho/iu/screens/add_wallet_moviment/add_wallet_moviment.dart';
import 'package:meu_dinheirinho/iu/screens/moviment_details/moviment_details.dart';
import 'package:meu_dinheirinho/iu/screens/screen_base.dart';
import 'package:meu_dinheirinho/iu/screens/update_moviment/update_moviment_screen.dart';
import 'package:provider/provider.dart';

import 'iu/screens/wallet/wallet.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localDatasource =  LocalDatasource();
    final movimentRepo = MovimentRepository(local: localDatasource);
    final createMovimentUsecase = CreateMovimentUsecase(repository: movimentRepo);
    final getMovimentsUsecase = GetMovimentsUsecase(repository: movimentRepo);
    final getMovimentsByMonthUsecase = GetMovimentsByMonthUsecase(repository: movimentRepo);
    final getMovimentByIdUsecase = GetMovimentByIdUsecase(repository: movimentRepo);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovimentProvider(
          createMovimentUsecase: createMovimentUsecase,
          getMovimentsUsecase: getMovimentsUsecase,
          getMovimentsByMonthUsecase: getMovimentsByMonthUsecase,
          getMovimentByIdUsecase: getMovimentByIdUsecase
        ))
      ],
      child: MaterialApp(
        title: "Meu Dinheirinho",
        initialRoute: "/base",
        routes: {
          "/base": (context) => const ScreenBase(),
          "/wallet": (context) => const Wallet(),
          "/addWalletMoviment": (context) => const AddWalletMoviment(),
          "/movimentDetails": (context) => const MovimentDetails(),
          "/updateMovimentScreen": (context) => const UpdateMovimentScreen()
        },
      ),
    );
  }
}