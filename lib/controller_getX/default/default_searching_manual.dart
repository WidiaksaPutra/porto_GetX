Map<String,String> searchDataBasic({required int pages, required int perPage}){
  return {
    'page' : pages.toString(),
    'per_page' : perPage.toString(),
  };
}

Map<String,String> searchData3Atribut({required int pages, required int perPage, required String keyData1, required dynamic data1}){
  return {
    'page' : pages.toString(),
    'per_page' : perPage.toString(),
    keyData1.toString() : data1.toString()
  };
}