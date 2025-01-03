import 'package:flutter/material.dart';

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
              //TODO: FIX THIS
              //TODO: CREATE A FUNC TO CLEAR DATABASE
              //dao.reset();
            },
            child: const Text("APAGAR TUDO"),
          ),
        ],
      ),
    );
  }
}