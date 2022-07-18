import 'dart:convert';

class DetailRegrab {
  DetailRegrab({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegrab.fromRawJson(String str) => DetailRegrab.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegrab.fromJson(Map<String, dynamic> json) => DetailRegrab(
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
    this.detail,
    this.behavior,
    this.approval,
  });

  final Detail? detail;
  final String? behavior;
  final List<Approval?>? approval;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: Detail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: json["approval"] == null ? null : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x?.toJson())),
  };
}

class Approval {
  Approval({
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawan,
    this.idJabatan,
    this.statusApproval,
    this.catatan,
    this.createdAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawan,
    this.namaJabatan,
    this.approvalBaseline,
  });

  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawan;
  final String? idJabatan;
  final String? statusApproval;
  final String? catatan;
  final String? createdAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawan;
  final String? namaJabatan;
  final String? approvalBaseline;

  factory Approval.fromRawJson(String str) => Approval.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    createdAt: json["created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawan: json["nama_karyawan"],
    namaJabatan: json["nama_jabatan"],
    approvalBaseline: json["approval_baseline"],
  );

  Map<String, dynamic> toJson() => {
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
  };
}

class Detail {
  Detail({
    this.idRab,
    this.tglRab,
    this.noRab,
    this.profit,
    this.prelim,
    this.idRae,
    this.noRae,
    this.tglRae,
    this.idPeluang,
    this.noPeluang,
    this.tglPeluang,
    this.idCustomer,
    this.idPeringkatPeluang,
    this.keteranganPengiriman,
    this.lokasiPengiriman,
    this.tglSelesai,
    this.att,
    this.instalasi,
    this.lainLain,
    this.isHidden,
    this.namaCustomer,
    this.baseline,
    this.namaPeringkatPeluang,
    this.baselineRef,
    this.idProyek,
    this.namaProyek,
    this.detailBarangJadi,
    this.detailPrelim,
    this.stakeholder,
  });

  final String? idRab;
  final DateTime? tglRab;
  final String? noRab;
  final String? profit;
  final String? prelim;
  final String? idRae;
  final String? noRae;
  final DateTime? tglRae;
  final String? idPeluang;
  final String? noPeluang;
  final DateTime? tglPeluang;
  final String? idCustomer;
  final String? idPeringkatPeluang;
  final String? keteranganPengiriman;
  final String? lokasiPengiriman;
  final DateTime? tglSelesai;
  final String? att;
  final bool? instalasi;
  final String? lainLain;
  final bool? isHidden;
  final String? namaCustomer;
  final String? baseline;
  final String? namaPeringkatPeluang;
  final String? baselineRef;
  final String? idProyek;
  final String? namaProyek;
  final List<DetailBarangJadi?>? detailBarangJadi;
  final List<DetailPrelim?>? detailPrelim;
  final List<Stakeholder?>? stakeholder;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    idRab: json["id_rab"],
    tglRab: json["tgl_rab"] == null ? null : DateTime.parse(json["tgl_rab"]),
    noRab: json["no_rab"],
    profit: json["profit"],
    prelim: json["prelim"],
    idRae: json["id_rae"],
    noRae: json["no_rae"],
    tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
    idPeluang: json["id_peluang"],
    noPeluang: json["no_peluang"],
    tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
    idCustomer: json["id_customer"],
    idPeringkatPeluang: json["id_peringkat_peluang"],
    keteranganPengiriman: json["keterangan_pengiriman"],
    lokasiPengiriman: json["lokasi_pengiriman"],
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    att: json["att"],
    instalasi: json["instalasi"],
    lainLain: json["lain_lain"],
    isHidden: json["is_hidden"],
    namaCustomer: json["nama_customer"],
    baseline: json["baseline"],
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    baselineRef: json["baseline_ref"],
    idProyek: json["id_proyek"],
    namaProyek: json["nama_proyek"],
    detailBarangJadi: List<DetailBarangJadi>.from(json["detail_barang_jadi"].map((x) => DetailBarangJadi.fromJson(x))),
    detailPrelim: List<DetailPrelim>.from(json["detail_prelim"].map((x) => DetailPrelim.fromJson(x))),
    stakeholder: List<Stakeholder>.from(json["stakeholder"].map((x) => Stakeholder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_rab": idRab,
    "tgl_rab": "${tglRab!.year.toString().padLeft(4, '0')}-${tglRab!.month.toString().padLeft(2, '0')}-${tglRab!.day.toString().padLeft(2, '0')}",
    "no_rab": noRab,
    "profit": profit,
    "prelim": prelim,
    "id_rae": idRae,
    "no_rae": noRae,
    "tgl_rae": "${tglRae!.year.toString().padLeft(4, '0')}-${tglRae!.month.toString().padLeft(2, '0')}-${tglRae!.day.toString().padLeft(2, '0')}",
    "id_peluang": idPeluang,
    "no_peluang": noPeluang,
    "tgl_peluang": "${tglPeluang!.year.toString().padLeft(4, '0')}-${tglPeluang!.month.toString().padLeft(2, '0')}-${tglPeluang!.day.toString().padLeft(2, '0')}",
    "id_customer": idCustomer,
    "id_peringkat_peluang": idPeringkatPeluang,
    "keterangan_pengiriman": keteranganPengiriman,
    "lokasi_pengiriman": lokasiPengiriman,
    "tgl_selesai": "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "att": att,
    "instalasi": instalasi,
    "lain_lain": lainLain,
    "is_hidden": isHidden,
    "nama_customer": namaCustomer,
    "baseline": baseline,
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "baseline_ref": baselineRef,
    "id_proyek": idProyek,
    "nama_proyek": namaProyek,
    "detail_barang_jadi": List<dynamic>.from(detailBarangJadi!.map((x) => x!.toJson())),
    "detail_prelim": List<dynamic>.from(detailPrelim!.map((x) => x!.toJson())),
    "stakeholder": List<dynamic>.from(stakeholder!.map((x) => x!.toJson())),
  };
}

class DetailBarangJadi {
  DetailBarangJadi({
    this.idRabDetail,
    this.idRab,
    this.idRaeDetail,
    this.idBarangJadi,
    this.qtyRab,
    this.hargaSatuanRab,
    this.kodeItem,
    this.namaItem,
    this.namaSatuan,
    this.idJenis,
    this.rounded,
  });

  final String? idRabDetail;
  final String? idRab;
  final String? idRaeDetail;
  final String? idBarangJadi;
  final String? qtyRab;
  final String? hargaSatuanRab;
  final String? kodeItem;
  final String? namaItem;
  final String? namaSatuan;
  final String? idJenis;
  final String? rounded;

  factory DetailBarangJadi.fromRawJson(String str) => DetailBarangJadi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailBarangJadi.fromJson(Map<String, dynamic> json) => DetailBarangJadi(
    idRabDetail: json["id_rab_detail"],
    idRab: json["id_rab"],
    idRaeDetail: json["id_rae_detail"],
    idBarangJadi: json["id_barang_jadi"],
    qtyRab: json["qty_rab"],
    hargaSatuanRab: json["harga_satuan_rab"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    namaSatuan: json["nama_satuan"],
    idJenis: json["id_jenis"],
    rounded: json["rounded"],
  );

  Map<String, dynamic> toJson() => {
    "id_rab_detail": idRabDetail,
    "id_rab": idRab,
    "id_rae_detail": idRaeDetail,
    "id_barang_jadi": idBarangJadi,
    "qty_rab": qtyRab,
    "harga_satuan_rab": hargaSatuanRab,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "nama_satuan": namaSatuan,
    "id_jenis": idJenis,
    "rounded": rounded,
  };
}

class DetailPrelim {
  DetailPrelim({
    this.idRabPrelim,
    this.idItemPrelim,
    this.kodeItemPrelim,
    this.namaItemPrelim,
    this.idKelompok,
    this.namaKelompok,
    this.hargaSatuanPrelim,
    this.qtyAnalisa,
    this.idSatuanPrelim,
    this.kodeSatuanPrelim,
    this.namaSatuanPrelim,
    this.qtyDurasi,
    this.idSatuanWaktu,
    this.kodeSatuanWaktu,
    this.namaSatuanWaktu,
    this.idRab,
    this.konstanta,
    this.unitPrice,
  });

  final String? idRabPrelim;
  final String? idItemPrelim;
  final String? kodeItemPrelim;
  final String? namaItemPrelim;
  final String? idKelompok;
  final String? namaKelompok;
  final String? hargaSatuanPrelim;
  final String? qtyAnalisa;
  final String? idSatuanPrelim;
  final String? kodeSatuanPrelim;
  final String? namaSatuanPrelim;
  final String? qtyDurasi;
  final String? idSatuanWaktu;
  final String? kodeSatuanWaktu;
  final String? namaSatuanWaktu;
  final String? idRab;
  final String? konstanta;
  final String? unitPrice;

  factory DetailPrelim.fromRawJson(String str) => DetailPrelim.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailPrelim.fromJson(Map<String, dynamic> json) => DetailPrelim(
    idRabPrelim: json["id_rab_prelim"],
    idItemPrelim: json["id_item_prelim"],
    kodeItemPrelim: json["kode_item_prelim"],
    namaItemPrelim: json["nama_item_prelim"],
    idKelompok: json["id_kelompok"],
    namaKelompok: json["nama_kelompok"],
    hargaSatuanPrelim: json["harga_satuan_prelim"],
    qtyAnalisa: json["qty_analisa"],
    idSatuanPrelim: json["id_satuan_prelim"],
    kodeSatuanPrelim: json["kode_satuan_prelim"],
    namaSatuanPrelim: json["nama_satuan_prelim"],
    qtyDurasi: json["qty_durasi"],
    idSatuanWaktu: json["id_satuan_waktu"],
    kodeSatuanWaktu: json["kode_satuan_waktu"],
    namaSatuanWaktu: json["nama_satuan_waktu"],
    idRab: json["id_rab"],
    konstanta: json["konstanta"],
    unitPrice: json["unit_price"],
  );

  Map<String, dynamic> toJson() => {
    "id_rab_prelim": idRabPrelim,
    "id_item_prelim": idItemPrelim,
    "kode_item_prelim": kodeItemPrelim,
    "nama_item_prelim": namaItemPrelim,
    "id_kelompok": idKelompok,
    "nama_kelompok": namaKelompok,
    "harga_satuan_prelim": hargaSatuanPrelim,
    "qty_analisa": qtyAnalisa,
    "id_satuan_prelim": idSatuanPrelim,
    "kode_satuan_prelim": kodeSatuanPrelim,
    "nama_satuan_prelim": namaSatuanPrelim,
    "qty_durasi": qtyDurasi,
    "id_satuan_waktu": idSatuanWaktu,
    "kode_satuan_waktu": kodeSatuanWaktu,
    "nama_satuan_waktu": namaSatuanWaktu,
    "id_rab": idRab,
    "konstanta": konstanta,
    "unit_price": unitPrice,
  };
}

class Stakeholder {
  Stakeholder({
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawan,
    this.idJabatan,
    this.statusApproval,
    this.catatan,
    this.createdAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawan,
    this.namaJabatan,
    this.approvalBaseline,
  });

  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawan;
  final String? idJabatan;
  final String? statusApproval;
  final String? catatan;
  final String? createdAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawan;
  final String? namaJabatan;
  final String? approvalBaseline;

  factory Stakeholder.fromRawJson(String str) => Stakeholder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stakeholder.fromJson(Map<String, dynamic> json) => Stakeholder(
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawan: json["id_karyawan"],
    idJabatan: json["id_jabatan"],
    statusApproval: json["status_approval"],
    catatan: json["catatan"],
    createdAt: json["created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawan: json["nama_karyawan"],
    namaJabatan: json["nama_jabatan"],
    approvalBaseline: json["approval_baseline"],
  );

  Map<String, dynamic> toJson() => {
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
  };
}