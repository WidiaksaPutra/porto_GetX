import 'dart:convert';

class DetailRegso {
  DetailRegso({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegso.fromRawJson(String str) => DetailRegso.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegso.fromJson(Map<String, dynamic> json) => DetailRegso(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
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
    detail: json["detail"] == null ? null : DataDetail.fromJson(json["detail"]),
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
    this.detail,
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
  final List<DetailElement?>? detail;

  factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
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
    detail: json["detail"] == null ? null : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
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
    "detail": detail == null ? null : List<dynamic>.from(detail!.map((x) => x?.toJson())),
  };
}

class DetailElement {
  DetailElement({
    this.idSalesOrderDetail,
    this.idSalesOrder,
    this.idBarang,
    this.idGudang,
    this.idSatuan,
    this.qtyItem,
    this.hargaSatuanJual,
    this.diskonItem,
    this.kodeBarang,
    this.namaBarang,
    this.namaSatuan,
    this.namaGudang,
  });

  final String? idSalesOrderDetail;
  final String? idSalesOrder;
  final String? idBarang;
  final String? idGudang;
  final String? idSatuan;
  final String? qtyItem;
  final String? hargaSatuanJual;
  final String? diskonItem;
  final String? kodeBarang;
  final String? namaBarang;
  final String? namaSatuan;
  final String? namaGudang;

  factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
    idSalesOrderDetail: json["id_sales_order_detail"],
    idSalesOrder: json["id_sales_order"],
    idBarang: json["id_barang"],
    idGudang: json["id_gudang"],
    idSatuan: json["id_satuan"],
    qtyItem: json["qty_item"],
    hargaSatuanJual: json["harga_satuan_jual"],
    diskonItem: json["diskon_item"],
    kodeBarang: json["kode_barang"],
    namaBarang: json["nama_barang"],
    namaSatuan: json["nama_satuan"],
    namaGudang: json["nama_gudang"],
  );

  Map<String, dynamic> toJson() => {
    "id_sales_order_detail": idSalesOrderDetail,
    "id_sales_order": idSalesOrder,
    "id_barang": idBarang,
    "id_gudang": idGudang,
    "id_satuan": idSatuan,
    "qty_item": qtyItem,
    "harga_satuan_jual": hargaSatuanJual,
    "diskon_item": diskonItem,
    "kode_barang": kodeBarang,
    "nama_barang": namaBarang,
    "nama_satuan": namaSatuan,
    "nama_gudang": namaGudang,
  };
}