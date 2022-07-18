import 'dart:convert';

class DetailRegfpnj {
  DetailRegfpnj({
    this.status,
    this.message,
    this.data,
  });

  final bool? status;
  final String? message;
  final Data? data;

  factory DetailRegfpnj.fromRawJson(String str) => DetailRegfpnj.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailRegfpnj.fromJson(Map<String, dynamic> json) => DetailRegfpnj(
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
    this.idFakturPenjualan,
    this.tglFaktur,
    this.noFaktur,
    this.idSalesOrder,
    this.tglSalesOrder,
    this.noSalesOrder,
    this.idCustomer,
    this.batasWaktu,
    this.catatan,
    this.alamatPengiriman,
    this.diskon,
    this.ppn,
    this.createdAt,
    this.idSales,
    this.namaSales,
    this.namaCustomer,
    this.noJurnal,
    this.baseline,
    this.idProyek,
    this.namaProyek,
    this.detail,
  });

  final String? idFakturPenjualan;
  final DateTime? tglFaktur;
  final String? noFaktur;
  final String? idSalesOrder;
  final DateTime? tglSalesOrder;
  final String? noSalesOrder;
  final String? idCustomer;
  final DateTime? batasWaktu;
  final String? catatan;
  final String? alamatPengiriman;
  final String? diskon;
  final String? ppn;
  final String? createdAt;
  final String? idSales;
  final String? namaSales;
  final String? namaCustomer;
  final String? noJurnal;
  final String? baseline;
  final String? idProyek;
  final String? namaProyek;
  final List<DetailElement?>? detail;

  factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
    idFakturPenjualan: json["id_faktur_penjualan"],
    tglFaktur: json["tgl_faktur"] == null ? null : DateTime.parse(json["tgl_faktur"]),
    noFaktur: json["no_faktur"],
    idSalesOrder: json["id_sales_order"],
    tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
    noSalesOrder: json["no_sales_order"],
    idCustomer: json["id_customer"],
    batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
    catatan: json["catatan"],
    alamatPengiriman: json["alamat_pengiriman"],
    diskon: json["diskon"],
    ppn: json["ppn"],
    createdAt: json["created_at"],
    idSales: json["id_sales"],
    namaSales: json["nama_sales"],
    namaCustomer: json["nama_customer"],
    noJurnal: json["no_jurnal"],
    baseline: json["baseline"],
    idProyek: json["id_proyek"],
    namaProyek: json["nama_proyek"],
    detail: json["detail"] == null ? null : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id_faktur_penjualan": idFakturPenjualan,
    "tgl_faktur": tglFaktur == null ? null : "${tglFaktur!.year.toString().padLeft(4, '0')}-${tglFaktur!.month.toString().padLeft(2, '0')}-${tglFaktur!.day.toString().padLeft(2, '0')}",
    "no_faktur": noFaktur,
    "id_sales_order": idSalesOrder,
    "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder!.year.toString().padLeft(4, '0')}-${tglSalesOrder!.month.toString().padLeft(2, '0')}-${tglSalesOrder!.day.toString().padLeft(2, '0')}",
    "no_sales_order": noSalesOrder,
    "id_customer": idCustomer,
    "batas_waktu": batasWaktu == null ? null : "${batasWaktu!.year.toString().padLeft(4, '0')}-${batasWaktu!.month.toString().padLeft(2, '0')}-${batasWaktu!.day.toString().padLeft(2, '0')}",
    "catatan": catatan,
    "alamat_pengiriman": alamatPengiriman,
    "diskon": diskon,
    "ppn": ppn,
    "created_at": createdAt,
    "id_sales": idSales,
    "nama_sales": namaSales,
    "nama_customer": namaCustomer,
    "no_jurnal": noJurnal,
    "baseline": baseline,
    "id_proyek": idProyek,
    "nama_proyek": namaProyek,
    "detail": detail == null ? null : List<dynamic>.from(detail!.map((x) => x!.toJson())),
  };
}

class DetailElement {
  DetailElement({
    this.idFakturPenjualanDetail,
    this.idFakturPenjualan,
    this.idSuratJalanDetail,
    this.idSuratJalan,
    this.noSuratJalan,
    this.tglSuratJalan,
    this.idDeliveryOrder,
    this.noDeliveryOrder,
    this.idDeliveryOrderDetail,
    this.idItemBuaso,
    this.kodeItem,
    this.namaItem,
    this.idSatuan,
    this.namaSatuan,
    this.hargaSatuanJual,
    this.qty,
    this.jumlah,
  });

  final String? idFakturPenjualanDetail;
  final String? idFakturPenjualan;
  final String? idSuratJalanDetail;
  final String? idSuratJalan;
  final String? noSuratJalan;
  final DateTime? tglSuratJalan;
  final String? idDeliveryOrder;
  final String? noDeliveryOrder;
  final String? idDeliveryOrderDetail;
  final String? idItemBuaso;
  final String? kodeItem;
  final String? namaItem;
  final String? idSatuan;
  final String? namaSatuan;
  final String? hargaSatuanJual;
  final String? qty;
  final String? jumlah;

  factory DetailElement.fromRawJson(String str) => DetailElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DetailElement.fromJson(Map<String, dynamic> json) => DetailElement(
    idFakturPenjualanDetail: json["id_faktur_penjualan_detail"],
    idFakturPenjualan: json["id_faktur_penjualan"],
    idSuratJalanDetail: json["id_surat_jalan_detail"],
    idSuratJalan: json["id_surat_jalan"],
    noSuratJalan: json["no_surat_jalan"],
    tglSuratJalan: json["tgl_surat_jalan"] == null ? null : DateTime.parse(json["tgl_surat_jalan"]),
    idDeliveryOrder: json["id_delivery_order"],
    noDeliveryOrder: json["no_delivery_order"],
    idDeliveryOrderDetail: json["id_delivery_order_detail"],
    idItemBuaso: json["id_item_buaso"],
    kodeItem: json["kode_item"],
    namaItem: json["nama_item"],
    idSatuan: json["id_satuan"],
    namaSatuan: json["nama_satuan"],
    hargaSatuanJual: json["harga_satuan_jual"],
    qty: json["qty"],
    jumlah: json["jumlah"],
  );

  Map<String, dynamic> toJson() => {
    "id_faktur_penjualan_detail": idFakturPenjualanDetail,
    "id_faktur_penjualan": idFakturPenjualan,
    "id_surat_jalan_detail": idSuratJalanDetail,
    "id_surat_jalan": idSuratJalan,
    "no_surat_jalan": noSuratJalan,
    "tgl_surat_jalan": tglSuratJalan == null ? null : "${tglSuratJalan!.year.toString().padLeft(4, '0')}-${tglSuratJalan!.month.toString().padLeft(2, '0')}-${tglSuratJalan!.day.toString().padLeft(2, '0')}",
    "id_delivery_order": idDeliveryOrder,
    "no_delivery_order": noDeliveryOrder,
    "id_delivery_order_detail": idDeliveryOrderDetail,
    "id_item_buaso": idItemBuaso,
    "kode_item": kodeItem,
    "nama_item": namaItem,
    "id_satuan": idSatuan,
    "nama_satuan": namaSatuan,
    "harga_satuan_jual": hargaSatuanJual,
    "qty": qty,
    "jumlah": jumlah,
  };
}
