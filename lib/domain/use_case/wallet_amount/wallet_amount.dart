import '../../../data/db/database.dart';

class WalletAmount {
  double getWalletAmount(List<MovimentData> movimentsValues) {
    var total = 0.0;

    for(var c = 0; c < movimentsValues.length; c++) {
      print(movimentsValues[c].amount);
      if (movimentsValues[c].type == false) {
        print(":>> ${movimentsValues[c].amount}");
          total = total - movimentsValues[c].amount;
      } else {
        total = total + movimentsValues[c].amount;
      }
    }

    return total;
  }
}