import 'dart:convert';

class HistoryRegsospk {
  HistoryRegsospk({
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

  factory HistoryRegsospk.fromRawJson(String str) => HistoryRegsospk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRegsospk.fromJson(Map<String, dynamic> json) => HistoryRegsospk(
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
    this.namaCustomer,
    this.baseline,
    this.idGudang,
    this.namaGudang,
    this.idApprovalTransaksi,
    this.noTransaksi,
    this.kodeTransaksi,
    this.idKaryawanApproval,
    this.idJabatanApproval,
    this.statusApproval,
    this.catatanApproval,
    this.approvalCreatedAt,
    this.tglApproval,
    this.approvalLevel,
    this.namaKaryawanApproval,
    this.namaJabatanApproval,
    this.namaKaryawanPengaju,
    this.namaJabatanPengaju,
  });

  final String? idSalesOrderSpk;
  final DateTime? tglSalesOrderSpk;
  final String? noSalesOrderSpk;
  final DateTime? tglBatasWaktu;
  final String? diskon;
  final String? ppn;
  final String? idSales;
  final String? namaSales;
  final String? namaCustomer;
  final String? baseline;
  final String? idGudang;
  final String? namaGudang;
  final String? idApprovalTransaksi;
  final String? noTransaksi;
  final String? kodeTransaksi;
  final String? idKaryawanApproval;
  final String? idJabatanApproval;
  final String? statusApproval;
  final String? catatanApproval;
  final String? approvalCreatedAt;
  final DateTime? tglApproval;
  final String? approvalLevel;
  final String? namaKaryawanApproval;
  final String? namaJabatanApproval;
  final String? namaKaryawanPengaju;
  final String? namaJabatanPengaju;

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
    namaCustomer: json["nama_customer"],
    baseline: json["baseline"],
    idGudang: json["id_gudang"],
    namaGudang: json["nama_gudang"],
    idApprovalTransaksi: json["id_approval_transaksi"],
    noTransaksi: json["no_transaksi"],
    kodeTransaksi: json["kode_transaksi"],
    idKaryawanApproval: json["id_karyawan_approval"],
    idJabatanApproval: json["id_jabatan_approval"],
    statusApproval: json["status_approval"],
    catatanApproval: json["catatan_approval"],
    approvalCreatedAt: json["approval_created_at"],
    tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
    approvalLevel: json["approval_level"],
    namaKaryawanApproval: json["nama_karyawan_approval"],
    namaJabatanApproval: json["nama_jabatan_approval"],
    namaKaryawanPengaju: json["nama_karyawan_pengaju"],
    namaJabatanPengaju: json["nama_jabatan_pengaju"],
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
    "nama_customer": namaCustomer,
    "baseline": baseline,
    "id_gudang": idGudang,
    "nama_gudang": namaGudang,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan_approval": catatanApproval,
    "approval_created_at": approvalCreatedAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval!.year.toString().padLeft(4, '0')}-${tglApproval!.month.toString().padLeft(2, '0')}-${tglApproval!.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
  };
}
