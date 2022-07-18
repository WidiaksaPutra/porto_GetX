import 'dart:convert';

class AnalisaSingleRegrae {
  AnalisaSingleRegrae({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory AnalisaSingleRegrae.fromRawJson(String str) => AnalisaSingleRegrae.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaSingleRegrae.fromJson(Map<String, dynamic> json) => AnalisaSingleRegrae(
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
    this.idRaeDetail,
    this.idRae,
    this.idBarangJadi,
    this.qtyRae,
    this.hargaSatuanRae,
    this.refUid,
    this.kodeItem,
    this.namaItem,
    this.namaSatuan,
    this.idJenis,
    this.idSatuanJual,
    this.namaJenis,
    this.linkReferensi,
    this.uraian,
    this.namaKelompok,
    this.gambar,
    this.analisaHardwood,
    this.analisaPlywood,
    this.analisaFinTpFs,
    this.analisaFinTpLc,
    this.analisaFinTpMp,
    this.analisaFinTpBop,
    this.analisaFinFnBp,
    this.analisaFinFnSc,
    this.analisaFinFnLc,
    this.analisaLabourCostOnsite,
    this.analisaBiayaOverheadKantor,
    this.analisaAlatBantuOnsite,
  });

  final String? idRaeDetail;
  final String? idRae;
  final String? idBarangJadi;
  final String? qtyRae;
  final String? hargaSatuanRae;
  final String? refUid;
  final String? kodeItem;
  final String? namaItem;
  final String? namaSatuan;
  final String? idJenis;
  final String? idSatuanJual;
  final String? namaJenis;
  final String? linkReferensi;
  final String? uraian;
  final String? namaKelompok;
  final List<Gambar?>? gambar;
  final List<AnalisaHardwood?>? analisaHardwood;
  final List<AnalisaPlywood?>? analisaPlywood;
  final List<AnalisaFinTpF?>? analisaFinTpFs;
  final List<AnalisaFinTpLc?>? analisaFinTpLc;
  final List<AnalisaFinTpMp?>? analisaFinTpMp;
  final List<AnalisaFinTpBop?>? analisaFinTpBop;
  final List<AnalisaFinFnBp?>? analisaFinFnBp;
  final List<AnalisaFinFnSc?>? analisaFinFnSc;
  final List<AnalisaFinFnLc?>? analisaFinFnLc;
  final List<AnalisaLabourCostOnsite?>? analisaLabourCostOnsite;
  final List<AnalisaBiayaOverheadKantor?>? analisaBiayaOverheadKantor;
  final List<AnalisaAlatBantuOnsite?>? analisaAlatBantuOnsite;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    idRaeDetail: json["id_rae_detail"],
    idRae: json["id_rae"],
    idBarangJadi: json["id_barang_jadi"],
    qtyRae: json["qty_rae"],
    hargaSatuanRae: json["harga_satuan_rae"],
    refUid: json["ref_uid"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    namaSatuan: json["nama_satuan"],
    idJenis: json["id_jenis"],
    idSatuanJual: json["id_satuan_jual"],
    namaJenis: json["nama_jenis"],
    linkReferensi: json["link_referensi"],
    uraian: json["uraian"],
    namaKelompok: json["nama_kelompok"],
    gambar: List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
    analisaHardwood: List<AnalisaHardwood>.from(json["analisa_hardwood"].map((x) => AnalisaHardwood.fromJson(x))),
    analisaPlywood: List<AnalisaPlywood>.from(json["analisa_plywood"].map((x) => AnalisaPlywood.fromJson(x))),
    analisaFinTpFs: List<AnalisaFinTpF>.from(json["analisa_fin_tp_fs"].map((x) => AnalisaFinTpF.fromJson(x))),
    analisaFinTpLc: List<AnalisaFinTpLc>.from(json["analisa_fin_tp_lc"].map((x) => AnalisaFinTpLc.fromJson(x))),
    analisaFinTpMp: List<AnalisaFinTpMp>.from(json["analisa_fin_tp_mp"].map((x) => AnalisaFinTpMp.fromJson(x))),
    analisaFinTpBop: List<AnalisaFinTpBop>.from(json["analisa_fin_tp_bop"].map((x) => AnalisaFinTpBop.fromJson(x))),
    analisaFinFnBp: List<AnalisaFinFnBp>.from(json["analisa_fin_fn_bp"].map((x) => AnalisaFinFnBp.fromJson(x))),
    analisaFinFnSc: List<AnalisaFinFnSc>.from(json["analisa_fin_fn_sc"].map((x) => AnalisaFinFnSc.fromJson(x))),
    analisaFinFnLc: List<AnalisaFinFnLc>.from(json["analisa_fin_fn_lc"].map((x) => AnalisaFinFnLc.fromJson(x))),
    analisaLabourCostOnsite: List<AnalisaLabourCostOnsite>.from(json["analisa_labour_cost_onsite"].map((x) => AnalisaLabourCostOnsite.fromJson(x))),
    analisaBiayaOverheadKantor: List<AnalisaBiayaOverheadKantor>.from(json["analisa_biaya_overhead_kantor"].map((x) => AnalisaBiayaOverheadKantor.fromJson(x))),
    analisaAlatBantuOnsite: List<AnalisaAlatBantuOnsite>.from(json["analisa_alat_bantu_onsite"].map((x) => AnalisaAlatBantuOnsite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_rae_detail": idRaeDetail,
    "id_rae": idRae,
    "id_barang_jadi": idBarangJadi,
    "qty_rae": qtyRae,
    "harga_satuan_rae": hargaSatuanRae,
    "ref_uid": refUid,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "nama_satuan": namaSatuan,
    "id_jenis": idJenis,
    "id_satuan_jual": idSatuanJual,
    "nama_jenis": namaJenis,
    "link_referensi": linkReferensi,
    "uraian": uraian,
    "nama_kelompok": namaKelompok,
    "gambar": List<dynamic>.from(gambar!.map((x) => x!.toJson())),
    "analisa_hardwood": List<dynamic>.from(analisaHardwood!.map((x) => x!.toJson())),
    "analisa_plywood": List<dynamic>.from(analisaPlywood!.map((x) => x!.toJson())),
    "analisa_fin_tp_fs": List<dynamic>.from(analisaFinTpFs!.map((x) => x!.toJson())),
    "analisa_fin_tp_lc": List<dynamic>.from(analisaFinTpLc!.map((x) => x!.toJson())),
    "analisa_fin_tp_mp": List<dynamic>.from(analisaFinTpMp!.map((x) => x!.toJson())),
    "analisa_fin_tp_bop": List<dynamic>.from(analisaFinTpBop!.map((x) => x!.toJson())),
    "analisa_fin_fn_bp": List<dynamic>.from(analisaFinFnBp!.map((x) => x!.toJson())),
    "analisa_fin_fn_sc": List<dynamic>.from(analisaFinFnSc!.map((x) => x!.toJson())),
    "analisa_fin_fn_lc": List<dynamic>.from(analisaFinFnLc!.map((x) => x!.toJson())),
    "analisa_labour_cost_onsite": List<dynamic>.from(analisaLabourCostOnsite!.map((x) => x!.toJson())),
    "analisa_biaya_overhead_kantor": List<dynamic>.from(analisaBiayaOverheadKantor!.map((x) => x!.toJson())),
    "analisa_alat_bantu_onsite": List<dynamic>.from(analisaAlatBantuOnsite!.map((x) => x!.toJson())),
  };
}

class AnalisaHardwood {
  AnalisaHardwood({
    this.idRaeAnalisaBarangJadiHardwood,
    this.idRaeDetail,
    this.idJenisKayu,
    this.idFinishingBarangJadi,
    this.idTipeSisi,
    this.idPartKayu,
    this.idDeskripsi,
    this.deskripsi,
    this.qtyRaw,
    this.tRaw,
    this.wRaw,
    this.lRaw,
    this.qtyFinal,
    this.tFinal,
    this.wFinal,
    this.lFinal,
    this.unitPrice,
    this.konstanta,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaJenisKayu,
    this.namaFinishingBarangJadi,
    this.namaTipeSisi,
    this.namaPartKayu,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiHardwood;
  final String? idRaeDetail;
  final String? idJenisKayu;
  final String? idFinishingBarangJadi;
  final String? idTipeSisi;
  final String? idPartKayu;
  final String? idDeskripsi;
  final String? deskripsi;
  final String? qtyRaw;
  final String? tRaw;
  final String? wRaw;
  final String? lRaw;
  final String? qtyFinal;
  final String? tFinal;
  final String? wFinal;
  final String? lFinal;
  final String? unitPrice;
  final String? konstanta;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaJenisKayu;
  final String? namaFinishingBarangJadi;
  final String? namaTipeSisi;
  final String? namaPartKayu;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaHardwood.fromRawJson(String str) => AnalisaHardwood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaHardwood.fromJson(Map<String, dynamic> json) => AnalisaHardwood(
    idRaeAnalisaBarangJadiHardwood: json["id_rae_analisa_barang_jadi_hardwood"],
    idRaeDetail: json["id_rae_detail"],
    idJenisKayu: json["id_jenis_kayu"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    idTipeSisi: json["id_tipe_sisi"],
    idPartKayu: json["id_part_kayu"],
    idDeskripsi: json["id_deskripsi"],
    deskripsi: json["deskripsi"],
    qtyRaw: json["qty_raw"],
    tRaw: json["t_raw"],
    wRaw: json["w_raw"],
    lRaw: json["l_raw"],
    qtyFinal: json["qty_final"],
    tFinal: json["t_final"],
    wFinal: json["w_final"],
    lFinal: json["l_final"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaJenisKayu: json["nama_jenis_kayu"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    namaTipeSisi: json["nama_tipe_sisi"],
    namaPartKayu: json["nama_part_kayu"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_hardwood": idRaeAnalisaBarangJadiHardwood,
    "id_rae_detail": idRaeDetail,
    "id_jenis_kayu": idJenisKayu,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "id_tipe_sisi": idTipeSisi,
    "id_part_kayu": idPartKayu,
    "id_deskripsi": idDeskripsi,
    "deskripsi": deskripsi,
    "qty_raw": qtyRaw,
    "t_raw": tRaw,
    "w_raw": wRaw,
    "l_raw": lRaw,
    "qty_final": qtyFinal,
    "t_final": tFinal,
    "w_final": wFinal,
    "l_final": lFinal,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_jenis_kayu": namaJenisKayu,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "nama_tipe_sisi": namaTipeSisi,
    "nama_part_kayu": namaPartKayu,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaPlywood {
  AnalisaPlywood({
    this.idRaeAnalisaBarangJadiPlywood,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.idTipeSisi,
    this.idDeskripsi,
    this.deskripsi,
    this.qtyRaw,
    this.tRaw,
    this.wRaw,
    this.lRaw,
    this.qtyFinal,
    this.tFinal,
    this.wFinal,
    this.lFinal,
    this.unitPrice,
    this.konstanta,
    this.kodeItem,
    this.namaItem,
    this.namaFinishingBarangJadi,
    this.namaTipeSisi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiPlywood;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? idTipeSisi;
  final String? idDeskripsi;
  final String? deskripsi;
  final String? qtyRaw;
  final String? tRaw;
  final String? wRaw;
  final String? lRaw;
  final String? qtyFinal;
  final String? tFinal;
  final String? wFinal;
  final String? lFinal;
  final String? unitPrice;
  final String? konstanta;
  final String? kodeItem;
  final String? namaItem;
  final String? namaFinishingBarangJadi;
  final String? namaTipeSisi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaPlywood.fromRawJson(String str) => AnalisaPlywood.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaPlywood.fromJson(Map<String, dynamic> json) => AnalisaPlywood(
    idRaeAnalisaBarangJadiPlywood: json["id_rae_analisa_barang_jadi_plywood"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    idTipeSisi: json["id_tipe_sisi"],
    idDeskripsi: json["id_deskripsi"],
    deskripsi: json["deskripsi"],
    qtyRaw: json["qty_raw"],
    tRaw: json["t_raw"],
    wRaw: json["w_raw"],
    lRaw: json["l_raw"],
    qtyFinal: json["qty_final"],
    tFinal: json["t_final"],
    wFinal: json["w_final"],
    lFinal: json["l_final"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    namaTipeSisi: json["nama_tipe_sisi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_plywood": idRaeAnalisaBarangJadiPlywood,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "id_tipe_sisi": idTipeSisi,
    "id_deskripsi": idDeskripsi,
    "deskripsi": deskripsi,
    "qty_raw": qtyRaw,
    "t_raw": tRaw,
    "w_raw": wRaw,
    "l_raw": lRaw,
    "qty_final": qtyFinal,
    "t_final": tFinal,
    "w_final": wFinal,
    "l_final": lFinal,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "nama_tipe_sisi": namaTipeSisi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinTpF {
  AnalisaFinTpF({
    this.idRaeAnalisaBarangJadiFinishing,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiFinishing;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinTpF.fromRawJson(String str) => AnalisaFinTpF.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinTpF.fromJson(Map<String, dynamic> json) => AnalisaFinTpF(
    idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinTpLc {
  AnalisaFinTpLc({
    this.idRaeAnalisaBarangJadiFinishing,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiFinishing;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinTpLc.fromRawJson(String str) => AnalisaFinTpLc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinTpLc.fromJson(Map<String, dynamic> json) => AnalisaFinTpLc(
    idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinTpMp {
  AnalisaFinTpMp({
    this.idRaeAnalisaBarangJadiFinishing,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiFinishing;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinTpMp.fromRawJson(String str) => AnalisaFinTpMp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinTpMp.fromJson(Map<String, dynamic> json) => AnalisaFinTpMp(
    idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinTpBop {
  AnalisaFinTpBop({
    this.idRaeAnalisaBarangJadiFinishing,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiFinishing;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinTpBop.fromRawJson(String str) => AnalisaFinTpBop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinTpBop.fromJson(Map<String, dynamic> json) => AnalisaFinTpBop(
    idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinFnBp {
  AnalisaFinFnBp({
    this.idRaeAnalisaBarangJadiFinishing,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiFinishing;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinFnBp.fromRawJson(String str) => AnalisaFinFnBp.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinFnBp.fromJson(Map<String, dynamic> json) => AnalisaFinFnBp(
    idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinFnSc {
  AnalisaFinFnSc({
    this.idRaeAnalisaBarangJadiFinishing,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiFinishing;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinFnSc.fromRawJson(String str) => AnalisaFinFnSc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinFnSc.fromJson(Map<String, dynamic> json) => AnalisaFinFnSc(
    idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaFinFnLc {
  AnalisaFinFnLc({
    this.idRaeAnalisaBarangJadiFinishing,
    this.idRaeDetail,
    this.idItemBuaso,
    this.idFinishingBarangJadi,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.namaFinishingBarangJadi,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiFinishing;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? idFinishingBarangJadi;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? namaFinishingBarangJadi;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaFinFnLc.fromRawJson(String str) => AnalisaFinFnLc.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaFinFnLc.fromJson(Map<String, dynamic> json) => AnalisaFinFnLc(
    idRaeAnalisaBarangJadiFinishing: json["id_rae_analisa_barang_jadi_finishing"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    idFinishingBarangJadi: json["id_finishing_barang_jadi"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    namaFinishingBarangJadi: json["nama_finishing_barang_jadi"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_finishing": idRaeAnalisaBarangJadiFinishing,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "id_finishing_barang_jadi": idFinishingBarangJadi,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "nama_finishing_barang_jadi": namaFinishingBarangJadi,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaLabourCostOnsite {
  AnalisaLabourCostOnsite({
    this.idRaeAnalisaBarangJadiExtraCost,
    this.idRaeDetail,
    this.idItemBuaso,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiExtraCost;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaLabourCostOnsite.fromRawJson(String str) => AnalisaLabourCostOnsite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaLabourCostOnsite.fromJson(Map<String, dynamic> json) => AnalisaLabourCostOnsite(
    idRaeAnalisaBarangJadiExtraCost: json["id_rae_analisa_barang_jadi_extra_cost"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_extra_cost": idRaeAnalisaBarangJadiExtraCost,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaBiayaOverheadKantor {
  AnalisaBiayaOverheadKantor({
    this.idRaeAnalisaBarangJadiExtraCost,
    this.idRaeDetail,
    this.idItemBuaso,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiExtraCost;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaBiayaOverheadKantor.fromRawJson(String str) => AnalisaBiayaOverheadKantor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaBiayaOverheadKantor.fromJson(Map<String, dynamic> json) => AnalisaBiayaOverheadKantor(
    idRaeAnalisaBarangJadiExtraCost: json["id_rae_analisa_barang_jadi_extra_cost"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_extra_cost": idRaeAnalisaBarangJadiExtraCost,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class AnalisaAlatBantuOnsite {
  AnalisaAlatBantuOnsite({
    this.idRaeAnalisaBarangJadiExtraCost,
    this.idRaeDetail,
    this.idItemBuaso,
    this.qty,
    this.unitPrice,
    this.konstanta,
    this.ref,
    this.kodeItem,
    this.namaItem,
    this.kodeSatuan,
    this.namaSatuan,
    this.hargaSatuan,
    this.koefisien,
    this.kodeItemBahan,
  });

  final String? idRaeAnalisaBarangJadiExtraCost;
  final String? idRaeDetail;
  final String? idItemBuaso;
  final String? qty;
  final String? unitPrice;
  final String? konstanta;
  final String? ref;
  final String? kodeItem;
  final String? namaItem;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? hargaSatuan;
  final String? koefisien;
  final String? kodeItemBahan;

  factory AnalisaAlatBantuOnsite.fromRawJson(String str) => AnalisaAlatBantuOnsite.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AnalisaAlatBantuOnsite.fromJson(Map<String, dynamic> json) => AnalisaAlatBantuOnsite(
    idRaeAnalisaBarangJadiExtraCost: json["id_rae_analisa_barang_jadi_extra_cost"],
    idRaeDetail: json["id_rae_detail"],
    idItemBuaso: json["id_item_buaso"],
    qty: json["qty"],
    unitPrice: json["unit_price"],
    konstanta: json["konstanta"],
    ref: json["ref"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    hargaSatuan: json["harga_satuan"],
    koefisien: json["koefisien"],
    kodeItemBahan: json["kode_item_bahan"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_analisa_barang_jadi_extra_cost": idRaeAnalisaBarangJadiExtraCost,
    "id_rae_detail": idRaeDetail,
    "id_item_buaso": idItemBuaso,
    "qty": qty,
    "unit_price": unitPrice,
    "konstanta": konstanta,
    "ref": ref,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "harga_satuan": hargaSatuan,
    "koefisien": koefisien,
    "kode_item_bahan": kodeItemBahan,
  };
}

class Gambar {
  Gambar({
    this.idItemBuasoGambarBarangJadi,
    this.idItemBuaso,
    this.pathGambar,
    this.tglUpload,
  });

  final String? idItemBuasoGambarBarangJadi;
  final String? idItemBuaso;
  final String? pathGambar;
  final DateTime? tglUpload;

  factory Gambar.fromRawJson(String str) => Gambar.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
    idItemBuasoGambarBarangJadi: json["id_item_buaso_gambar_barang_jadi"],
    idItemBuaso: json["id_item_buaso"],
    pathGambar: json["path_gambar"],
    tglUpload: DateTime.parse(json["tgl_upload"]),
  );

  Map<String, dynamic> toJson() => {
    "id_item_buaso_gambar_barang_jadi": idItemBuasoGambarBarangJadi,
    "id_item_buaso": idItemBuaso,
    "path_gambar": pathGambar,
    "tgl_upload": tglUpload!.toIso8601String(),
  };
}
