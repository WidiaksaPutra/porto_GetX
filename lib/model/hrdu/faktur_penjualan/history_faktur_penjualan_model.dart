import 'dart:convert';

class HistoryRegfpnj {
  HistoryRegfpnj({
    this.status,
    this.message,
    this.xqry,
    this.identity,
    required this.data,
    this.dataCount,
    this.totalPage,
  });

  final bool? status;
  final String? message;
  final Xqry? xqry;
  final Identity? identity;
  final List<Datum> data;
  final int? dataCount;
  final int? totalPage;

  factory HistoryRegfpnj.fromRawJson(String str) => HistoryRegfpnj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryRegfpnj.fromJson(Map<String, dynamic> json) => HistoryRegfpnj(
    status: json["status"],
    message: json["message"],
    xqry: json["xqry"] == null ? null : Xqry.fromJson(json["xqry"]),
    identity: json["identity"] == null ? null : Identity.fromJson(json["identity"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    totalPage: json["total_page"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "xqry": xqry == null ? null : xqry!.toJson(),
    "identity": identity == null ? null : identity!.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "total_page": totalPage,
  };
}

class Datum {
  Datum({
    this.idFakturPenjualan,
    this.idSalesOrder,
    this.tglFaktur,
    this.noFaktur,
    this.catatan,
    this.createdAt,
    this.tglSalesOrder,
    this.noSalesOrder,
    this.tglPurchaseOrder,
    this.noPurchaseOrder,
    this.idCustomer,
    this.idKaryawan,
    this.batasWaktu,
    this.status,
    this.alamatPengiriman,
    this.diskon,
    this.ppn,
    this.idSales,
    this.namaSales,
    this.namaCustomer,
    this.telepon,
    this.noJurnal,
    this.baseline,
    this.diskonSo,
    this.ppnSo,
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

  final String? idFakturPenjualan;
  final String? idSalesOrder;
  final DateTime? tglFaktur;
  final String? noFaktur;
  final String? catatan;
  final String? createdAt;
  final DateTime? tglSalesOrder;
  final String? noSalesOrder;
  final DateTime? tglPurchaseOrder;
  final String? noPurchaseOrder;
  final String? idCustomer;
  final String? idKaryawan;
  final DateTime? batasWaktu;
  final String? status;
  final String? alamatPengiriman;
  final String? diskon;
  final String? ppn;
  final String? idSales;
  final String? namaSales;
  final String? namaCustomer;
  final String? telepon;
  final String? noJurnal;
  final String? baseline;
  final String? diskonSo;
  final String? ppnSo;
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
    idFakturPenjualan: json["id_faktur_penjualan"],
    idSalesOrder: json["id_sales_order"],
    tglFaktur: json["tgl_faktur"] == null ? null : DateTime.parse(json["tgl_faktur"]),
    noFaktur: json["no_faktur"],
    catatan: json["catatan"],
    createdAt: json["created_at"],
    tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
    noSalesOrder: json["no_sales_order"],
    tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
    noPurchaseOrder: json["no_purchase_order"],
    idCustomer: json["id_customer"],
    idKaryawan: json["id_karyawan"],
    batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
    status: json["status"],
    alamatPengiriman: json["alamat_pengiriman"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    idSales: json["id_sales"],
    namaSales: json["nama_sales"],
    namaCustomer: json["nama_customer"],
    telepon: json["telepon"],
    noJurnal: json["no_jurnal"],
    baseline: json["baseline"],
    diskonSo: json["diskon_so"],
    ppnSo: json["ppn_so"],
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
    "id_faktur_penjualan": idFakturPenjualan,
    "id_sales_order": idSalesOrder,
    "tgl_faktur": tglFaktur == null ? null : "${tglFaktur?.year.toString().padLeft(4, '0')}-${tglFaktur?.month.toString().padLeft(2, '0')}-${tglFaktur?.day.toString().padLeft(2, '0')}",
    "no_faktur": noFaktur,
    "catatan": catatan,
    "created_at": createdAt,
    "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder?.year.toString().padLeft(4, '0')}-${tglSalesOrder?.month.toString().padLeft(2, '0')}-${tglSalesOrder?.day.toString().padLeft(2, '0')}",
    "no_sales_order": noSalesOrder,
    "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
    "no_purchase_order": noPurchaseOrder,
    "id_customer": idCustomer,
    "id_karyawan": idKaryawan,
    "batas_waktu": batasWaktu == null ? null : "${batasWaktu?.year.toString().padLeft(4, '0')}-${batasWaktu?.month.toString().padLeft(2, '0')}-${batasWaktu?.day.toString().padLeft(2, '0')}",
    "status": status,
    "alamat_pengiriman": alamatPengiriman,
    "diskon": diskon,
    "ppn": ppn,
    "id_sales": idSales,
    "nama_sales": namaSales,
    "nama_customer": namaCustomer,
    "telepon": telepon,
    "no_jurnal": noJurnal,
    "baseline": baseline,
    "diskon_so": diskonSo,
    "ppn_so": ppnSo,
    "id_approval_transaksi": idApprovalTransaksi,
    "no_transaksi": noTransaksi,
    "kode_transaksi": kodeTransaksi,
    "id_karyawan_approval": idKaryawanApproval,
    "id_jabatan_approval": idJabatanApproval,
    "status_approval": statusApproval,
    "catatan_approval": catatanApproval,
    "approval_created_at": approvalCreatedAt,
    "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
    "approval_level": approvalLevel,
    "nama_karyawan_approval": namaKaryawanApproval,
    "nama_jabatan_approval": namaJabatanApproval,
    "nama_karyawan_pengaju": namaKaryawanPengaju,
    "nama_jabatan_pengaju": namaJabatanPengaju,
  };
}

class Identity {
  Identity({
    this.idJabatan,
    this.idUnitOrganisasi,
    this.idKaryawan,
    this.kodeProses,
    this.behavior,
    this.approvalLevel,
  });

  final String? idJabatan;
  final String? idUnitOrganisasi;
  final String? idKaryawan;
  final String? kodeProses;
  final String? behavior;
  final String? approvalLevel;

  factory Identity.fromRawJson(String str) => Identity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Identity.fromJson(Map<String, dynamic> json) => Identity(
    idJabatan: json["id_jabatan"],
    idUnitOrganisasi: json["id_unit_organisasi"],
    idKaryawan: json["id_karyawan"],
    kodeProses: json["kode_proses"],
    behavior: json["behavior"],
    approvalLevel: json["approval_level"],
  );

  Map<String, dynamic> toJson() => {
    "id_jabatan": idJabatan,
    "id_unit_organisasi": idUnitOrganisasi,
    "id_karyawan": idKaryawan,
    "kode_proses": kodeProses,
    "behavior": behavior,
    "approval_level": approvalLevel,
  };
}

class Xqry {
  Xqry({
    this.page,
    this.perPage,
    this.idJabatanApproval,
  });

  final String? page;
  final String? perPage;
  final String? idJabatanApproval;

  factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
    page: json["page"],
    perPage: json["per_page"],
    idJabatanApproval: json["id_jabatan_approval"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "per_page": perPage,
    "id_jabatan_approval": idJabatanApproval,
  };
}
