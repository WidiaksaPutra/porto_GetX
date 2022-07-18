import 'dart:convert';

class AnalisaSingleRegplgBaku {
  AnalisaSingleRegplgBaku({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory AnalisaSingleRegplgBaku.fromRawJson(String str) => AnalisaSingleRegplgBaku.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleRegplgBaku.fromJson(Map<String, dynamic> json) => AnalisaSingleRegplgBaku(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
      this.analisaHardwood,
      this.analisaPlywood,
  });

  final List<AnalisaHardwood?>? analisaHardwood;
  final List<AnalisaPlywood?>? analisaPlywood;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    analisaHardwood: List<AnalisaHardwood>.from(json["analisa_hardwood"].map((x) => AnalisaHardwood.fromJson(x))),
    analisaPlywood: List<AnalisaPlywood>.from(json["analisa_plywood"].map((x) => AnalisaPlywood.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "analisa_hardwood": List<dynamic>.from(analisaHardwood!.map((x) => x!.toJson())),
    "analisa_plywood": List<dynamic>.from(analisaPlywood!.map((x) => x!.toJson())),
  };
}

class AnalisaHardwood {
  AnalisaHardwood({
    this.idAnalisaBarangJadiHardwood,
    this.idBarangJadi,
    this.urutanItem,
    this.idDeskripsi,
    this.deskripsi,
    this.isHeader,
    this.idKayu,
    this.qtyRaw,
    this.tRaw,
    this.wRaw,
    this.lRaw,
    this.qtyFinal,
    this.tFinal,
    this.wFinal,
    this.lFinal,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
    this.namaItem,
    this.namaKayu,
    this.idSatuan,
    this.namaSatuan,
    this.idJenisKayu,
    this.namaJenisKayu,
    this.idFinishingBarangJadi,
    this.namaFinishingBarangJadi,
    this.idTipeSisi,
    this.namaTipeSisi,
    this.idPartKayu,
    this.namaPartKayu,
  });

  final String? idAnalisaBarangJadiHardwood;
  final String? idBarangJadi;
  final String? urutanItem;
  final String? idDeskripsi;
  final String? deskripsi;
  final bool? isHeader;
  final String? idKayu;
  final String? qtyRaw;
  final String? tRaw;
  final String? wRaw;
  final String? lRaw;
  final String? qtyFinal;
  final String? tFinal;
  final String? wFinal;
  final String? lFinal;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;
  final String? namaItem;
  final String? namaKayu;
  final String? idSatuan;
  final String? namaSatuan;
  final String? idJenisKayu;
  final String? namaJenisKayu;
  final String? idFinishingBarangJadi;
  final String? namaFinishingBarangJadi;
  final String? idTipeSisi;
  final String? namaTipeSisi;
  final String? idPartKayu;
  final String? namaPartKayu;

  factory AnalisaHardwood.fromRawJson(String str) => AnalisaHardwood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaHardwood.fromJson(Map<String, dynamic> json) => AnalisaHardwood(
    idAnalisaBarangJadiHardwood: json["id_analisa_barang_jadi_hardwood"],
    idBarangJadi: json["id_barang_jadi"],
    urutanItem: json["urutan_item"],
    idDeskripsi: json["id_deskripsi"],
    deskripsi: json["deskripsi"],
    isHeader: json["is_header"],
    idKayu: json["id_kayu"],
    qtyRaw: json["qty_raw"],
    tRaw: json["t_raw"],
    wRaw: json["w_raw"],
    lRaw: json["l_raw"],
    qtyFinal: json["qty_final"],
    tFinal: json["t_final"],
    wFinal: json["w_final"],
    lFinal: json["l_final"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
    namaItem: json["nama_item"],
    namaKayu: json["nama_kayu"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    idJenisKayu: json["id_jenis_kayu"],
    namaJenisKayu: json["nama_jenis_kayu"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    idTipeSisi: json["id_tipe_sisi"],
    namaTipeSisi: json["nama_tipe_sisi"],
    idPartKayu: json["id_part_kayu"],
    namaPartKayu: json["nama_part_kayu"],
  );

  Map<String, dynamic> toJson() => {
    "id_analisa_barang_jadi_hardwood": idAnalisaBarangJadiHardwood,
    "id_barang_jadi": idBarangJadi,
    "urutan_item": urutanItem,
    "id_deskripsi": idDeskripsi,
    "deskripsi": deskripsi,
    "is_header": isHeader,
    "id_kayu": idKayu,
    "qty_raw": qtyRaw,
    "t_raw": tRaw,
    "w_raw": wRaw,
    "l_raw": lRaw,
    "qty_final": qtyFinal,
    "t_final": tFinal,
    "w_final": wFinal,
    "l_final": lFinal,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
    "nama_item": namaItem,
    "nama_kayu": namaKayu,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "id_jenis_kayu": idJenisKayu,
    "nama_jenis_kayu": namaJenisKayu,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "id_tipe_sisi": idTipeSisi,
    "nama_tipe_sisi": namaTipeSisi,
    "id_part_kayu": idPartKayu,
    "nama_part_kayu": namaPartKayu,
  };
}

class AnalisaPlywood {
  AnalisaPlywood({
    this.idAnalisaBarangJadiPlywood,
    this.idBarangJadi,
    this.urutanItem,
    this.idDeskripsi,
    this.deskripsi,
    this.isHeader,
    this.idKayu,
    this.qtyRaw,
    this.tRaw,
    this.wRaw,
    this.lRaw,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
    this.namaItem,
    this.namaKayu,
    this.idSatuan,
    this.namaSatuan,
    this.idPlywood,
    this.namaPlywood,
    this.idFinishingBarangJadi,
    this.namaFinishingBarangJadi,
    this.idTipeSisi,
    this.namaTipeSisi,
    this.qtyFinal,
    this.tFinal,
    this.wFinal,
    this.lFinal,
  });

  final String? idAnalisaBarangJadiPlywood;
  final String? idBarangJadi;
  final String? urutanItem;
  final String? idDeskripsi;
  final String? deskripsi;
  final bool? isHeader;
  final String? idKayu;
  final String? qtyRaw;
  final String? tRaw;
  final String? wRaw;
  final String? lRaw;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;
  final String? namaItem;
  final String? namaKayu;
  final String? idSatuan;
  final String? namaSatuan;
  final String? idPlywood;
  final String? namaPlywood;
  final String? idFinishingBarangJadi;
  final String? namaFinishingBarangJadi;
  final String? idTipeSisi;
  final String? namaTipeSisi;
  final String? qtyFinal;
  final String? tFinal;
  final String? wFinal;
  final String? lFinal;

  factory AnalisaPlywood.fromRawJson(String str) => AnalisaPlywood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaPlywood.fromJson(Map<String, dynamic> json) => AnalisaPlywood(
    idAnalisaBarangJadiPlywood: json["id_analisa_barang_jadi_plywood"],
    idBarangJadi: json["id_barang_jadi"],
    urutanItem: json["urutan_item"],
    idDeskripsi: json["id_deskripsi"],
    deskripsi: json["deskripsi"],
    isHeader: json["is_header"],
    idKayu: json["id_kayu"],
    qtyRaw: json["qty_raw"],
    tRaw: json["t_raw"],
    wRaw: json["w_raw"],
    lRaw: json["l_raw"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
    namaItem: json["nama_item"],
    namaKayu: json["nama_kayu"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    idPlywood: json["id_plywood"],
    namaPlywood: json["nama_plywood"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    idTipeSisi: json["id_tipe_sisi"],
    namaTipeSisi: json["nama_tipe_sisi"],
    qtyFinal: json["qty_final"],
    tFinal: json["t_final"],
    wFinal: json["w_final"],
    lFinal: json["l_final"],
  );

  Map<String, dynamic> toJson() => {
    "id_analisa_barang_jadi_plywood": idAnalisaBarangJadiPlywood,
    "id_barang_jadi": idBarangJadi,
    "urutan_item": urutanItem,
    "id_deskripsi": idDeskripsi,
    "deskripsi": deskripsi,
    "is_header": isHeader,
    "id_kayu": idKayu,
    "qty_raw": qtyRaw,
    "t_raw": tRaw,
    "w_raw": wRaw,
    "l_raw": lRaw,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
    "nama_item": namaItem,
    "nama_kayu": namaKayu,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "id_plywood": idPlywood,
    "nama_plywood": namaPlywood,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "id_tipe_sisi": idTipeSisi,
    "nama_tipe_sisi": namaTipeSisi,
    "qty_final": qtyFinal,
    "t_final": tFinal,
    "w_final": wFinal,
    "l_final": lFinal,
  };
}
