import 'package:get/get.dart';

class GetxFactorySupply extends GetxController{
  late var grandTotalFactorySupply = 0.0.obs;
  late var totalFactorySupply = 0.0.obs;
  late var hasilSubTotal = 0.0.obs;
  late var hasilQty = 0.0.obs;
  late var listSubFactorySupply = <String>[].obs;
  late var listKodeFactorySupply = <String>[].obs;
  late var listQtyFactorySupply = <String>[].obs;
  late var listKonstantaFactorySupply = <String>[].obs;
  late final listSubTotal;
  late final listKode;
  late final listQty;
  late final listKonstanta;

  factorySupplyDetail(var factorySupply){
    
    prosesFaktorSupply(factorySupply);
    
              // print(totalFactorySupply.value);
    grandTotalFactorySupply.value = totalFactorySupply.value;
  }

  prosesFaktorSupply(var factorySupply){
    
    int lengRekapitulasi = factorySupply!.data.length;

    listSubTotal = List.generate(lengRekapitulasi, (_) => []).obs;
    listKode = List.generate(lengRekapitulasi, (_) => []).obs;
    listQty = List.generate(lengRekapitulasi, (_) => []).obs;
    listKonstanta = List.generate(lengRekapitulasi, (_) => []).obs;

    for(int loop = 0 ; loop < 2 ; loop++){

      double subTotal = 0.0;
      int hi = 0, hj = 0;
      hasilSubTotal.value = 0.0;
      hasilQty.value = 0.0;
      int lengAnalisaFinTpFs = 0;
      int lengAnalisaFinTpFs2 = 0;

      for(int ki = 0 ; ki<lengRekapitulasi ; ki++){
        lengAnalisaFinTpFs = factorySupply.data[ki].analisaFinTpFs!.length;
        if (factorySupply.data[ki].analisaFinTpFs != []) {
          for (int kj = 0; kj < lengAnalisaFinTpFs; kj++) {
            if(loop == 0){
              subTotal = double.parse(factorySupply.data[ki].analisaFinTpFs![kj].qty.toString()) * double.parse(factorySupply.data[ki].analisaFinTpFs![kj].unitPrice.toString()) * double.parse(factorySupply.data[ki].analisaFinTpFs![kj].konstanta.toString());
              listSubFactorySupply.add(subTotal.toString());
              listKodeFactorySupply.add(factorySupply.data[ki].analisaFinTpFs![kj].kodeItem);
              listQtyFactorySupply.add(factorySupply.data[ki].analisaFinTpFs![kj].qty);
              listKonstantaFactorySupply.add(factorySupply.data[ki].analisaFinTpFs![kj].konstanta);
              totalFactorySupply.value = totalFactorySupply.value + subTotal.round();
            }
            else{
              hasilSubTotal.value = 0.0;
              hasilQty.value = 0.0;
              for(int i = ki ; i<lengRekapitulasi ; i++){
                lengAnalisaFinTpFs2 = factorySupply.data[i].analisaFinTpFs!.length;
                if (factorySupply.data[i].analisaFinTpFs != []) {
                  for (int j = kj; j < lengAnalisaFinTpFs2; j++) {
                    if(listKode[i][j] == listKode[ki][kj] && listKonstanta[i][j] == listKonstanta[ki][kj]){
                      if(i == ki && j == kj){
                        hi = i;
                        hj = j;
                        hasilSubTotal.value = hasilSubTotal.value + double.parse(listSubTotal[i][j].toString());
                        hasilQty.value = hasilQty.value + double.parse(listQty[i][j].toString());
                      }
                      else{
                        hasilSubTotal.value = hasilSubTotal.value + double.parse(listSubTotal[i][j].toString());
                        hasilQty.value = hasilQty.value + double.parse(listQty[i][j].toString());
                        listQty[i][j] = 0.0;
                        listSubTotal[i][j] = 0.0;
                      }            
                    }
                  }
                }

                if(i == lengRekapitulasi-1){       
                  listQty[hi][hj] = hasilQty.value;
                  listSubTotal[hi][hj] = hasilSubTotal.roundToDouble();
                }
              }
              
            }
          }
          if(loop == 0){
            listSubTotal[ki].addAll(listSubFactorySupply);
            listKode[ki].addAll(listKodeFactorySupply);
            listQty[ki].addAll(listQtyFactorySupply);
            listKonstanta[ki].addAll(listKonstantaFactorySupply);

            listSubFactorySupply.clear();
            listKodeFactorySupply.clear();
            listQtyFactorySupply.clear();
            listKonstantaFactorySupply.clear();
          }
        } 
        
      }
    }
    
  }
}