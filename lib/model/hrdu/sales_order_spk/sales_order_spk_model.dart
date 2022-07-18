import 'dart:convert';

class Regsospk {
  Regsospk({
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

  factory Regsospk.fromRawJson(String str) => Regsospk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Regsospk.fromJson(Map<String, dynamic> json) => Regsospk(
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
    this.namaBarang,
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
  final List<NamaBarang?>? namaBarang;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    namaBarang: json["nama_barang"] == null ? null : List<NamaBarang>.from(json["nama_barang"].map((x) => NamaBarang.fromJson(x))),
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
    "nama_barang": namaBarang == null ? null : List<dynamic>.from(namaBarang!.map((x) => x!.toJson())),
  };
}

class NamaBarang {
  NamaBarang({
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

  factory NamaBarang.fromRawJson(String str) => NamaBarang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NamaBarang.fromJson(Map<String, dynamic> json) => NamaBarang(
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
