import 'dart:convert';

class Regso {
  Regso({
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

  factory Regso.fromRawJson(String str) => Regso.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Regso.fromJson(Map<String, dynamic> json) => Regso(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))).toList(),
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
    this.idSalesOrder,
    this.tglSalesOrder,
    this.noSalesOrder,
    this.tglPurchaseOrder,
    this.noPurchaseOrder,
    this.idCustomer,
    this.batasWaktu,
    this.status,
    this.alamatPengiriman,
    this.diskon,
    this.ppn,
    this.idSales,
    this.namaSales,
    this.namaCustomer,
    this.telepon,
    this.baseline,
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
    this.catatanSo,
  });

  final String? idSalesOrder;
  final DateTime? tglSalesOrder;
  final String? noSalesOrder;
  final DateTime? tglPurchaseOrder;
  final String? noPurchaseOrder;
  final String? idCustomer;
  final DateTime? batasWaktu;
  final String? status;
  final String? alamatPengiriman;
  final String? diskon;
  final String? ppn;
  final String? idSales;
  final String? namaSales;
  final String? namaCustomer;
  final String? telepon;
  final String? baseline;
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
  final String? catatanSo;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    idSalesOrder: json["id_sales_order"],
    tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
    noSalesOrder: json["no_sales_order"],
    tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
    noPurchaseOrder: json["no_purchase_order"],
    idCustomer: json["id_customer"],
    batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
    status: json["status"],
    alamatPengiriman: json["alamat_pengiriman"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    idSales: json["id_sales"],
    namaSales: json["nama_sales"],
    namaCustomer: json["nama_customer"],
    telepon: json["telepon"],
    baseline: json["baseline"],
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
    catatanSo: json["catatan_so"],
  );

  Map<String, dynamic> toJson() => {
    "id_sales_order": idSalesOrder,
    "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder?.year.toString().padLeft(4, '0')}-${tglSalesOrder?.month.toString().padLeft(2, '0')}-${tglSalesOrder?.day.toString().padLeft(2, '0')}",
    "no_sales_order": noSalesOrder,
    "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
    "no_purchase_order": noPurchaseOrder,
    "id_customer": idCustomer,
    "batas_waktu": batasWaktu == null ? null : "${batasWaktu?.year.toString().padLeft(4, '0')}-${batasWaktu?.month.toString().padLeft(2, '0')}-${batasWaktu?.day.toString().padLeft(2, '0')}",
    "status": status,
    "alamat_pengiriman": alamatPengiriman,
    "diskon": diskon,
    "ppn": ppn,
    "id_sales": idSales,
    "nama_sales": namaSales,
    "nama_customer": namaCustomer,
    "telepon": telepon,
    "baseline": baseline,
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
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "id_karyawan_pengaju": idKaryawanPengaju,
    "id_jabatan_pengaju": idJabatanPengaju,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
    "catatan_so": catatanSo,
  };
}
