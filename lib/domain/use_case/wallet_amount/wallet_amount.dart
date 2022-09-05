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

  //Pega apenas o lucro
  double getWalletAmountByMonthe(List<MovimentData> movimentValues, String currentMonthYear) {
    var total = 0.0;
    for (var c = 0; c < movimentValues.length; c++) {

      if (movimentValues[c].monthYearString == currentMonthYear || movimentValues[c].lastMonthYearString != currentMonthYear) {
        if (movimentValues[c].type == false) {
          total = total - movimentValues[c].amount;
        } else {
          total = total + movimentValues[c].amount;
        }
      }
    }

    return total;
  }

  double getWalletSpendingByMonth(List<MovimentData> movimentValues, String currentMonthYear) {
    var total = 0.0;
    for (var c = 0; c < movimentValues.length; c++) {

      if (movimentValues[c].monthYearString == currentMonthYear || movimentValues[c].lastMonthYearString != currentMonthYear) {
        if (movimentValues[c].type == false) {
          total = total + movimentValues[c].amount;
        }
      }
    }

    return total;
  }

  double getWalletTotalAmountByMonth(List<MovimentData> movimentValues, String currentMonthYear) {
    var total = 0.0;
    for (var c = 0; c < movimentValues.length; c++) {
      if (movimentValues[c].monthYearString == currentMonthYear || movimentValues[c].lastMonthYearString != currentMonthYear) {
        if (movimentValues[c].type == true) {
          total = total + movimentValues[c].amount;
        }
      }
    }

    return total;
  }
}