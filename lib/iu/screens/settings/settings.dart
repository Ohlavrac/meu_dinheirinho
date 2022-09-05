import 'package:flutter/material.dart';

import '../../../data/db/database.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              final dao = Database();
              dao.reset();
            },
            child: Text("APAGAR TUDO"),
          ),
        ],
      ),
    );
  }
}