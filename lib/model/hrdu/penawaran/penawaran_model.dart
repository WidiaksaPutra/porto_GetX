import 'dart:convert';

class Regpnw {
  Regpnw({
    this.status,
    this.message,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final String? message;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory Regpnw.fromRawJson(String str) => Regpnw.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Regpnw.fromJson(Map<String, dynamic> json) => Regpnw(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
  };
}

class Datum {
  Datum({
    this.idPenawaran,
    this.tglPenawaran,
    this.noPenawaran,
    this.ppn,
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
    this.teksPembuka,
    this.teksPenutup,
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
    this.namaPeringkatPeluang,
    this.baseline,
    this.statusDeal,
    this.barangJadi,
  });

  final String? idPenawaran;
  final DateTime? tglPenawaran;
  final String? noPenawaran;
  final String? ppn;
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
  final String? teksPembuka;
  final String? teksPenutup;
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
  final String? namaPeringkatPeluang;
  final String? baseline;
  final String? statusDeal;
  final List<BarangJadi?>? barangJadi;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idPenawaran: json["id_penawaran"],
    tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
    noPenawaran: json["no_penawaran"],
    ppn: json["ppn"],
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
    teksPembuka: json["teks_pembuka"],
    teksPenutup: json["teks_penutup"],
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
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    baseline: json["baseline"],
    statusDeal: json["status_deal"],
    barangJadi: List<BarangJadi>.from(json["barang_jadi"].map((x) => BarangJadi.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_penawaran": idPenawaran,
    "tgl_penawaran": "${tglPenawaran!.year.toString().padLeft(4, '0')}-${tglPenawaran!.month.toString().padLeft(2, '0')}-${tglPenawaran!.day.toString().padLeft(2, '0')}",
    "no_penawaran": noPenawaran,
    "ppn": ppn,
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
    "teks_pembuka": teksPembuka,
    "teks_penutup": teksPenutup,
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
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "baseline": baseline,
    "status_deal": statusDeal,
    "barang_jadi": List<dynamic>.from(barangJadi!.map((x) => x!.toJson())),
  };
}

class BarangJadi {
  BarangJadi({
    this.idItemBuaso,
    this.kodeItem,
    this.namaItem,
    this.idJenis,
    this.idSatuanJual,
    this.namaSatuan,
    this.namaJenis,
    this.kodeSatuan,
    this.idBarangJadi,
    this.linkReferensi,
    this.uraian,
    this.totalAnalisa,
    this.hargaSatuanRae,
    this.qtyRae,
    this.rounded,
    this.idRabDetail,
    this.idRae,
    this.idRaeDetail,
    this.idRab,
    this.hargaSatuanRab,
  });

  final String? idItemBuaso;
  final String? kodeItem;
  final String? namaItem;
  final String? idJenis;
  final String? idSatuanJual;
  final String? namaSatuan;
  final String? namaJenis;
  final String? kodeSatuan;
  final String? idBarangJadi;
  final String? linkReferensi;
  final String? uraian;
  final String? totalAnalisa;
  final String? hargaSatuanRae;
  final String? qtyRae;
  final String? rounded;
  final String? idRabDetail;
  final String? idRae;
  final String? idRaeDetail;
  final String? idRab;
  final String? hargaSatuanRab;

  factory BarangJadi.fromRawJson(String str) => BarangJadi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BarangJadi.fromJson(Map<String, dynamic> json) => BarangJadi(
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    idJenis: json["id_jenis"],
    idSatuanJual: json["id_satuan_jual"],
    namaSatuan: json["nama_satuan"],
    namaJenis: json["nama_jenis"],
    kodeSatuan: json["kode_satuan"],
    idBarangJadi: json["id_barang_jadi"],
    linkReferensi: json["link_referensi"],
    uraian: json["uraian"],
    totalAnalisa: json["total_analisa"],
    hargaSatuanRae: json["harga_satuan_rae"],
    qtyRae: json["qty_rae"],
    rounded: json["rounded"],
    idRabDetail: json["id_rab_detail"],
    idRae: json["id_rae"],
    idRaeDetail: json["id_rae_detail"],
    idRab: json["id_rab"],
    hargaSatuanRab: json["harga_satuan_rab"],
  );

  Map<String, dynamic> toJson() => {
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_jenis": idJenis,
    "id_satuan_jual": idSatuanJual,
    "nama_satuan": namaSatuan,
    "nama_jenis": namaJenis,
    "kode_satuan": kodeSatuan,
    "id_barang_jadi": idBarangJadi,
    "link_referensi": linkReferensi,
    "uraian": uraian,
    "total_analisa": totalAnalisa,
    "harga_satuan_rae": hargaSatuanRae,
    "qty_rae": qtyRae,
    "rounded": rounded,
    "id_rab_detail": idRabDetail,
    "id_rae": idRae,
    "id_rae_detail": idRaeDetail,
    "id_rab": idRab,
    "harga_satuan_rab": hargaSatuanRab,
  };
}
