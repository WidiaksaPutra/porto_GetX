import 'dart:convert';

class DetailRegrae {
  DetailRegrae({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegrae.fromRawJson(String str) => DetailRegrae.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegrae.fromJson(Map<String, dynamic> json) => DetailRegrae(
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

  final DataDetail? detail;
  final String? behavior;
  final List<Approval?>? approval;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    detail: DataDetail.fromJson(json["detail"]),
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

class DataDetail {
  DataDetail({
    this.idRae,
    this.tglRae,
    this.noRae,
    this.idPeluang,
    this.noPeluang,
    this.tglPeluang,
    this.idCustomer,
    this.namaCustomer,
    this.idPeringkatPeluang,
    this.namaPeringkatPeluang,
    this.keteranganPengiriman,
    this.lokasiPengiriman,
    this.tglSelesai,
    this.att,
    this.instalasi,
    this.lainLain,
    this.isHidden,
    this.baseline,
    this.kodeProyek,
    this.namaProyek,
    this.lokasiProyek,
    this.realisasiPenawaran,
    this.scheduleKebutuhanProyek,
    this.detail,
    this.prelim,
  });

  final String? idRae;
  final DateTime? tglRae;
  final String? noRae;
  final String? idPeluang;
  final String? noPeluang;
  final DateTime? tglPeluang;
  final String? idCustomer;
  final String? namaCustomer;
  final String? idPeringkatPeluang;
  final String? namaPeringkatPeluang;
  final String? keteranganPengiriman;
  final String? lokasiPengiriman;
  final DateTime? tglSelesai;
  final String? att;
  final bool? instalasi;
  final String? lainLain;
  final bool? isHidden;
  final String? baseline;
  final String? kodeProyek;
  final String? namaProyek;
  final String? lokasiProyek;
  final DateTime? realisasiPenawaran;
  final String? scheduleKebutuhanProyek;
  final List<DetailElement?>? detail;
  final List<Prelim?>? prelim;

  factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
    idRae: json["id_rae"],
    tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
    noRae: json["no_rae"],
    idPeluang: json["id_peluang"],
    noPeluang: json["no_peluang"],
    tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
    idCustomer: json["id_customer"],
    namaCustomer: json["nama_customer"],
    idPeringkatPeluang: json["id_peringkat_peluang"],
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    keteranganPengiriman: json["keterangan_pengiriman"],
    lokasiPengiriman: json["lokasi_pengiriman"],
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
    att: json["att"],
    instalasi: json["instalasi"],
    lainLain: json["lain_lain"],
    isHidden: json["is_hidden"],
    baseline: json["baseline"],
    kodeProyek: json["kode_proyek"],
    namaProyek: json["nama_proyek"],
    lokasiProyek: json["lokasi_proyek"],
    realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
    scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"],
    detail: List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
    prelim: List<Prelim>.from(json["prelim"].map((x) => Prelim.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_rae": idRae,
    "tgl_rae": "${tglRae!.year.toString().padLeft(4, '0')}-${tglRae!.month.toString().padLeft(2, '0')}-${tglRae!.day.toString().padLeft(2, '0')}",
    "no_rae": noRae,
    "id_peluang": idPeluang,
    "no_peluang": noPeluang,
    "tgl_peluang": "${tglPeluang!.year.toString().padLeft(4, '0')}-${tglPeluang!.month.toString().padLeft(2, '0')}-${tglPeluang!.day.toString().padLeft(2, '0')}",
    "id_customer": idCustomer,
    "nama_customer": namaCustomer,
    "id_peringkat_peluang": idPeringkatPeluang,
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "keterangan_pengiriman": keteranganPengiriman,
    "lokasi_pengiriman": lokasiPengiriman,
    "tgl_selesai": "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "att": att,
    "instalasi": instalasi,
    "lain_lain": lainLain,
    "is_hidden": isHidden,
    "baseline": baseline,
    "kode_proyek": kodeProyek,
    "nama_proyek": namaProyek,
    "lokasi_proyek": lokasiProyek,
    "realisasi_penawaran": "${realisasiPenawaran!.year.toString().padLeft(4, '0')}-${realisasiPenawaran!.month.toString().padLeft(2, '0')}-${realisasiPenawaran!.day.toString().padLeft(2, '0')}",
    "schedule_kebutuhan_proyek": scheduleKebutuhanProyek,
    "detail": List<dynamic>.from(detail!.map((x) => x!.toJson())),
    "prelim": List<dynamic>.from(prelim!.map((x) => x!.toJson())),
  };
}

class DetailElement {
  DetailElement({
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

  factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
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
  };
}

class Prelim {
  Prelim({
    this.idRaePrelim,
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
    this.idRae,
    this.konstanta,
    this.unitPrice,
  });

  final String? idRaePrelim;
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
  final String? idRae;
  final String? konstanta;
  final String? unitPrice;

  factory Prelim.fromRawJson(String str) => Prelim.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prelim.fromJson(Map<String, dynamic> json) => Prelim(
    idRaePrelim: json["id_rae_prelim"],
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
    idRae: json["id_rae"],
    konstanta: json["konstanta"],
    unitPrice: json["unit_price"],
  );

  Map<String, dynamic> toJson() => {
    "id_rae_prelim": idRaePrelim,
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
    "id_rae": idRae,
    "konstanta": konstanta,
    "unit_price": unitPrice,
  };
}