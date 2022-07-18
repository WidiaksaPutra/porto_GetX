import 'dart:convert';

class DetailRegsospk {
  DetailRegsospk({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegsospk.fromRawJson(String str) => DetailRegsospk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegsospk.fromJson(Map<String, dynamic> json) => DetailRegsospk(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data!.toJson(),
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
    detail: json["detail"] == null ? null : DataDetail.fromJson(json["detail"]),
    behavior: json["behavior"],
    approval: json["approval"] == null ? null : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "detail": detail == null ? null : detail!.toJson(),
    "behavior": behavior,
    "approval": approval == null ? null : List<dynamic>.from(approval!.map((x) => x!.toJson())),
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
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan": namaKaryawan,
    "nama_jabatan": namaJabatan,
    "approval_baseline": approvalBaseline,
  };
}

class DataDetail {
  DataDetail({
    this.idSalesOrderSpk,
    this.tglSalesOrderSpk,
    this.noSalesOrderSpk,
    this.tglBatasWaktu,
    this.diskon,
    this.ppn,
    this.idSales,
    this.namaSales,
    this.baseline,
    this.idSpk,
    this.noSpk,
    this.tglSpk,
    this.idPeluang,
    this.noPeluang,
    this.tglPeluang,
    this.namaPeringkatPeluang,
    this.keteranganPengiriman,
    this.lokasiPengiriman,
    this.att,
    this.namaProyek,
    this.lainLain,
    this.idRab,
    this.noRab,
    this.tglRab,
    this.idRae,
    this.tglRae,
    this.noRae,
    this.idPenawaran,
    this.noPenawaran,
    this.tglPenawaran,
    this.namaCustomer,
    this.linkReferensi,
    this.scheduleKebutuhanProyek,
    this.realisasiPenawaran,
    this.tglSelesai,
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
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.idKaryawanPengaju,
    this.idJabatanPengaju,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
    this.detail,
    this.prelim,
  });

  final String? idSalesOrderSpk;
  final DateTime? tglSalesOrderSpk;
  final String? noSalesOrderSpk;
  final DateTime? tglBatasWaktu;
  final String? diskon;
  final String? ppn;
  final String? idSales;
  final String? namaSales;
  final String? baseline;
  final String? idSpk;
  final String? noSpk;
  final DateTime? tglSpk;
  final String? idPeluang;
  final String? noPeluang;
  final DateTime? tglPeluang;
  final String? namaPeringkatPeluang;
  final String? keteranganPengiriman;
  final String? lokasiPengiriman;
  final String? att;
  final String? namaProyek;
  final String? lainLain;
  final String? idRab;
  final String? noRab;
  final DateTime? tglRab;
  final String? idRae;
  final DateTime? tglRae;
  final String? noRae;
  final String? idPenawaran;
  final String? noPenawaran;
  final DateTime? tglPenawaran;
  final String? namaCustomer;
  final String? linkReferensi;
  final String? scheduleKebutuhanProyek;
  final DateTime? realisasiPenawaran;
  final DateTime? tglSelesai;
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
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? idKaryawanPengaju;
  final String? idJabatanPengaju;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;
  final List<DetailElement?>? detail;
  final List<Prelim?>? prelim;

  factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
    idSalesOrderSpk: json["id_sales_order_spk"],
    tglSalesOrderSpk: json["tgl_sales_order_spk"] == null ? null : DateTime.parse(json["tgl_sales_order_spk"]),
    noSalesOrderSpk: json["no_sales_order_spk"],
    tglBatasWaktu: json["tgl_batas_waktu"] == null ? null : DateTime.parse(json["tgl_batas_waktu"]),
    diskon: json["diskon"],
    ppn: json["ppn"],
    idSales: json["id_sales"],
    namaSales: json["nama_sales"],
    baseline: json["baseline"],
    idSpk: json["id_spk"],
    noSpk: json["no_spk"],
    tglSpk: json["tgl_spk"] == null ? null : DateTime.parse(json["tgl_spk"]),
    idPeluang: json["id_peluang"],
    noPeluang: json["no_peluang"],
    tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
    namaPeringkatPeluang: json["nama_peringkat_peluang"],
    keteranganPengiriman: json["keterangan_pengiriman"],
    lokasiPengiriman: json["lokasi_pengiriman"],
    att: json["att"],
    namaProyek: json["nama_proyek"],
    lainLain: json["lain_lain"],
    idRab: json["id_rab"],
    noRab: json["no_rab"],
    tglRab: json["tgl_rab"] == null ? null : DateTime.parse(json["tgl_rab"]),
    idRae: json["id_rae"],
    tglRae: json["tgl_rae"] == null ? null : DateTime.parse(json["tgl_rae"]),
    noRae: json["no_rae"],
    idPenawaran: json["id_penawaran"],
    noPenawaran: json["no_penawaran"],
    tglPenawaran: json["tgl_penawaran"] == null ? null : DateTime.parse(json["tgl_penawaran"]),
    namaCustomer: json["nama_customer"],
    linkReferensi: json["link_referensi"],
    scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"],
    realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
    tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
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
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    idKaryawanPengaju: json["id_karyawan_pengaju"],
    idJabatanPengaju: json["id_jabatan_pengaju"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
    detail: json["detail"] == null ? null : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
    prelim: json["prelim"] == null ? null : List<Prelim>.from(json["prelim"].map((x) => Prelim.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_sales_order_spk": idSalesOrderSpk,
    "tgl_sales_order_spk": tglSalesOrderSpk == null ? null : "${tglSalesOrderSpk!.year.toString().padLeft(4, '0')}-${tglSalesOrderSpk!.month.toString().padLeft(2, '0')}-${tglSalesOrderSpk!.day.toString().padLeft(2, '0')}",
    "no_sales_order_spk": noSalesOrderSpk,
    "tgl_batas_waktu": tglBatasWaktu == null ? null : "${tglBatasWaktu!.year.toString().padLeft(4, '0')}-${tglBatasWaktu!.month.toString().padLeft(2, '0')}-${tglBatasWaktu!.day.toString().padLeft(2, '0')}",
    "diskon": diskon,
    "ppn": ppn,
    "id_sales": idSales,
    "nama_sales": namaSales,
    "baseline": baseline,
    "id_spk": idSpk,
    "no_spk": noSpk,
    "tgl_spk": tglSpk == null ? null : "${tglSpk!.year.toString().padLeft(4, '0')}-${tglSpk!.month.toString().padLeft(2, '0')}-${tglSpk!.day.toString().padLeft(2, '0')}",
    "id_peluang": idPeluang,
    "no_peluang": noPeluang,
    "tgl_peluang": tglPeluang == null ? null : "${tglPeluang!.year.toString().padLeft(4, '0')}-${tglPeluang!.month.toString().padLeft(2, '0')}-${tglPeluang!.day.toString().padLeft(2, '0')}",
    "nama_peringkat_peluang": namaPeringkatPeluang,
    "keterangan_pengiriman": keteranganPengiriman,
    "lokasi_pengiriman": lokasiPengiriman,
    "att": att,
    "nama_proyek": namaProyek,
    "lain_lain": lainLain,
    "id_rab": idRab,
    "no_rab": noRab,
    "tgl_rab": tglRab == null ? null : "${tglRab!.year.toString().padLeft(4, '0')}-${tglRab!.month.toString().padLeft(2, '0')}-${tglRab!.day.toString().padLeft(2, '0')}",
    "id_rae": idRae,
    "tgl_rae": tglRae == null ? null : "${tglRae!.year.toString().padLeft(4, '0')}-${tglRae!.month.toString().padLeft(2, '0')}-${tglRae!.day.toString().padLeft(2, '0')}",
    "no_rae": noRae,
    "id_penawaran": idPenawaran,
    "no_penawaran": noPenawaran,
    "tgl_penawaran": tglPenawaran == null ? null : "${tglPenawaran!.year.toString().padLeft(4, '0')}-${tglPenawaran!.month.toString().padLeft(2, '0')}-${tglPenawaran!.day.toString().padLeft(2, '0')}",
    "nama_customer": namaCustomer,
    "link_referensi": linkReferensi,
    "schedule_kebutuhan_proyek": scheduleKebutuhanProyek,
    "realisasi_penawaran": realisasiPenawaran == null ? null : "${realisasiPenawaran!.year.toString().padLeft(4, '0')}-${realisasiPenawaran!.month.toString().padLeft(2, '0')}-${realisasiPenawaran!.day.toString().padLeft(2, '0')}",
    "tgl_selesai": tglSelesai == null ? null : "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan": idKaryawan,
    "id_jabatan": idJabatan,
    "status_approval": statusApproval,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "detail": detail == null ? null : List<dynamic>.from(detail!.map((x) => x!.toJson())),
    "prelim": prelim == null ? null : List<dynamic>.from(prelim!.map((x) => x!.toJson())),
  };
}

class DetailElement {
  DetailElement({
    this.idSalesOrderSpkDetail,
    this.idSalesOrderSpk,
    this.idItemBuaso,
    this.kodeBarang,
    this.namaBarang,
    this.idGudang,
    this.namaGudang,
    this.qtySalesOrderSpk,
    this.idSatuan,
    this.kodeSatuan,
    this.namaSatuan,
    this.hargaRate,
    this.idRab,
  });

  final String? idSalesOrderSpkDetail;
  final String? idSalesOrderSpk;
  final String? idItemBuaso;
  final String? kodeBarang;
  final String? namaBarang;
  final String? idGudang;
  final String? namaGudang;
  final String? qtySalesOrderSpk;
  final String? idSatuan;
  final String? kodeSatuan;
  final String? namaSatuan;
  final String? hargaRate;
  final String? idRab;

  factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
    idSalesOrderSpkDetail: json["id_sales_order_spk_detail"],
    idSalesOrderSpk: json["id_sales_order_spk"],
    idItemBuaso: json["id_item_buaso"],
    kodeBarang: json["kode_barang"],
    namaBarang: json["nama_barang"],
    idGudang: json["id_gudang"],
    namaGudang: json["nama_gudang"],
    qtySalesOrderSpk: json["qty_sales_order_spk"],
    idSatuan: json["id_satuan"],
    kodeSatuan: json["kode_satuan"],
    namaSatuan: json["nama_satuan"],
    hargaRate: json["harga_rate"],
    idRab: json["id_rab"],
  );

  Map<String, dynamic> toJson() => {
    "id_sales_order_spk_detail": idSalesOrderSpkDetail,
    "id_sales_order_spk": idSalesOrderSpk,
    "id_item_buaso": idItemBuaso,
    "kode_barang": kodeBarang,
    "nama_barang": namaBarang,
    "id_gudang": idGudang,
    "nama_gudang": namaGudang,
    "qty_sales_order_spk": qtySalesOrderSpk,
    "id_satuan": idSatuan,
    "kode_satuan": kodeSatuan,
    "nama_satuan": namaSatuan,
    "harga_rate": hargaRate,
    "id_rab": idRab,
  };
}

class Prelim {
  Prelim({
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

  factory Prelim.fromRawJson(String str) => Prelim.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Prelim.fromJson(Map<String, dynamic> json) => Prelim(
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
