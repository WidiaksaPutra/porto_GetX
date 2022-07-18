import 'dart:convert';

class AnalisaSingleBarangJadi {
  AnalisaSingleBarangJadi({
    this.analisaHardwood,
    this.analisaPlywood,
    this.analisaFinTpFs,
    this.analisaFinTpLc,
    this.analisaFinTpMp,
    this.analisaFinTpBop,
    this.analisaFinFnBp,
    this.analisaFinFnSc,
    this.analisaFinFnLc,
  });

  final List<AnalisaHardwood?>? analisaHardwood;
  final List<AnalisaPlywood?>? analisaPlywood;
  final List<AnalisaFinTpF?>? analisaFinTpFs;
  final List<AnalisaFinTpF?>? analisaFinTpLc;
  final List<AnalisaFinTpF?>? analisaFinTpMp;
  final List<AnalisaFinTpF?>? analisaFinTpBop;
  final List<AnalisaFinTpF?>? analisaFinFnBp;
  final List<AnalisaFinTpF?>? analisaFinFnSc;
  final List<AnalisaFinTpF?>? analisaFinFnLc;
  

  factory AnalisaSingleBarangJadi.fromRawJson(String str) => AnalisaSingleBarangJadi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleBarangJadi.fromJson(Map<String, dynamic> json) => AnalisaSingleBarangJadi(
    analisaHardwood: json["analisa_hardwood"] == null ? null : List<AnalisaHardwood>.from(json["analisa_hardwood"].map((x) => AnalisaHardwood.fromJson(x))),
    analisaPlywood: json["analisa_plywood"] == null ? null : List<AnalisaPlywood>.from(json["analisa_plywood"].map((x) => AnalisaPlywood.fromJson(x))),
    analisaFinTpFs: json["analisa_fin_tp_fs"] == null ? null : List<AnalisaFinTpF>.from(json["analisa_fin_tp_fs"].map((x) => AnalisaFinTpF.fromJson(x))),
    analisaFinTpLc: json["analisa_fin_tp_lc"] == null ? null : List<AnalisaFinTpF>.from(json["analisa_fin_tp_lc"].map((x) => AnalisaFinTpF.fromJson(x))),
    analisaFinTpMp: json["analisa_fin_tp_mp"] == null ? null : List<AnalisaFinTpF>.from(json["analisa_fin_tp_mp"].map((x) => AnalisaFinTpF.fromJson(x))),
    analisaFinTpBop: json["analisa_fin_tp_bop"] == null ? null : List<AnalisaFinTpF>.from(json["analisa_fin_tp_bop"].map((x) => AnalisaFinTpF.fromJson(x))),
    analisaFinFnBp: json["analisa_fin_fn_bp"] == null ? null : List<AnalisaFinTpF>.from(json["analisa_fin_fn_bp"].map((x) => AnalisaFinTpF.fromJson(x))),
    analisaFinFnSc: json["analisa_fin_fn_sc"] == null ? null : List<AnalisaFinTpF>.from(json["analisa_fin_fn_sc"].map((x) => AnalisaFinTpF.fromJson(x))),
    analisaFinFnLc: json["analisa_fin_fn_lc"] == null ? null : List<AnalisaFinTpF>.from(json["analisa_fin_fn_lc"].map((x) => AnalisaFinTpF.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "analisa_hardwood": analisaHardwood == null ? null : List<dynamic>.from(analisaHardwood!.map((x) => x!.toJson())),
    "analisa_plywood": analisaPlywood == null ? null : List<dynamic>.from(analisaPlywood!.map((x) => x!.toJson())),
    "analisa_fin_tp_fs": analisaFinTpFs == null ? null : List<dynamic>.from(analisaFinTpFs!.map((x) => x!.toJson())),
    "analisa_fin_tp_lc": analisaFinTpLc == null ? null : List<dynamic>.from(analisaFinTpLc!.map((x) => x!.toJson())),
    "analisa_fin_tp_mp": analisaFinTpMp == null ? null : List<dynamic>.from(analisaFinTpMp!.map((x) => x!.toJson())),
    "analisa_fin_tp_bop": analisaFinTpBop == null ? null : List<dynamic>.from(analisaFinTpBop!.map((x) => x!.toJson())),
    "analisa_fin_fn_bp": analisaFinFnBp == null ? null : List<dynamic>.from(analisaFinFnBp!.map((x) => x!.toJson())),
    "analisa_fin_fn_sc": analisaFinFnSc == null ? null : List<dynamic>.from(analisaFinFnSc!.map((x) => x!.toJson())),
    "analisa_fin_fn_lc": analisaFinFnLc == null ? null : List<dynamic>.from(analisaFinFnLc!.map((x) => x!.toJson())),
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

class AnalisaFinTpF {
  AnalisaFinTpF({
    this.idAnalisaBarangJadiTipeFs,
    this.idBarangJadi,
    this.idItemBahan,
    this.kodeItemBahan,
    this.namaItem,
    this.idSatuan,
    this.namaSatuan,
    this.qty,
    this.hargaSatuan,
    this.koefisien,
    this.ref,
    this.idFinishingBarangJadi,
    this.namaFinishingBarangJadi,
  });

  final String? idAnalisaBarangJadiTipeFs;
  final String? idBarangJadi;
  final String? idItemBahan;
  final String? kodeItemBahan;
  final String? namaItem;
  final String? idSatuan;
  final String? namaSatuan;
  final String? qty;
  final String? hargaSatuan;
  final String? koefisien;
  final String? ref;
  final String? idFinishingBarangJadi;
  final String? namaFinishingBarangJadi;

  factory AnalisaFinTpF.fromRawJson(String str) => AnalisaFinTpF.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinTpF.fromJson(Map<String, dynamic> json) => AnalisaFinTpF(
    idAnalisaBarangJadiTipeFs: json["id_analisa_barang_jadi_tipe_fs"],
    idBarangJadi: json["id_barang_jadi"],
    idItemBahan: json["id_item_bahan"],
    kodeItemBahan: json["kode_item_bahan"],
    namaItem: json["nama_item"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    qty: json["qty"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    ref: json["ref"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
  );

  Map<String, dynamic> toJson() => {
    "id_analisa_barang_jadi_tipe_fs": idAnalisaBarangJadiTipeFs,
    "id_barang_jadi": idBarangJadi,
    "id_item_bahan": idItemBahan,
    "kode_item_bahan": kodeItemBahan,
    "nama_item": namaItem,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "qty": qty,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "ref": ref,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
  };
}