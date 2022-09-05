// To parse this JSON data, do
//
//     final detailRegso = detailRegsoFromJson(jsonString);

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
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "data": data == null ? null : data!.toJson(),
    };
}

class Data {
    Data({
        this.detail,
        this.behavior,
        required this.approval,
    });

    final DataDetail? detail;
    final String? behavior;
    final List<Approval> approval;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        detail: json["detail"] == null ? null : DataDetail.fromJson(json["detail"]),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approval: json["approval"] == List.empty() ? [] : List<Approval>.from(json["approval"].map((x) => Approval.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "detail": detail == null ? null : detail!.toJson(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval": approval == List.empty() ? [] : List<dynamic>.from(approval.map((x) => x.toJson())),
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
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawan;
    final String? namaJabatan;
    final String? approvalBaseline;

    factory Approval.fromRawJson(String str) => Approval.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawan: json["nama_karyawan"] == null ? "-" : json["nama_karyawan"].toString(),
        namaJabatan: json["nama_jabatan"] == null ? "-" : json["nama_jabatan"].toString(),
        approvalBaseline: json["approval_baseline"] == null ? "-" : json["approval_baseline"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "approval_baseline": approvalBaseline == null ? "-" : approvalBaseline.toString(),
    };
}

class DataDetail {
    DataDetail({
        this.idSalesOrder,
        this.tglSalesOrder,
        this.noSalesOrder,
        this.idCustomer,
        this.batasWaktu,
        this.alamatPengiriman,
        this.diskon,
        this.ppn,
        this.idSales,
        this.namaSales,
        this.namaCustomer,
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
        this.idProyek,
        this.namaProyek,
        this.detail,
    });

    final String? idSalesOrder;
    final DateTime? tglSalesOrder;
    final String? noSalesOrder;
    final String? idCustomer;
    final DateTime? batasWaktu;
    final String? alamatPengiriman;
    final String? diskon;
    final String? ppn;
    final String? idSales;
    final String? namaSales;
    final String? namaCustomer;
    final String? baseline;
    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawan;
    final String? idJabatan;
    final String? statusApproval;
    final String? catatan;
    final DateTime? createdAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawanApproval;
    final String? namaJabatanApproval;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? catatanSo;
    final String? idProyek;
    final String? namaProyek;
    final List<DetailElement>? detail;

    factory DataDetail.fromRawJson(String str) => DataDetail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DataDetail.fromJson(Map<String, dynamic> json) => DataDetail(
        idSalesOrder: json["id_sales_order"] == null ? "-" : json["id_sales_order"].toString(),
        tglSalesOrder: json["tgl_sales_order"] == null ? null : DateTime.parse(json["tgl_sales_order"]),
        noSalesOrder: json["no_sales_order"] == null ? "-" : json["no_sales_order"].toString(),
        idCustomer: json["id_customer"] == null ? "-" : json["id_customer"].toString(),
        batasWaktu: json["batas_waktu"] == null ? null : DateTime.parse(json["batas_waktu"]),
        alamatPengiriman: json["alamat_pengiriman"] == null ? "-" : json["alamat_pengiriman"].toString(),
        diskon: json["diskon"] == null ? "-" : json["diskon"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
        idSales: json["id_sales"] == null ? "-" : json["id_sales"].toString(),
        namaSales: json["nama_sales"] == null ? "-" : json["nama_sales"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatan: json["catatan"] == null ? "-" : json["catatan"].toString(),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString(),
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        catatanSo: json["catatan_so"] == null ? "-" : json["catatan_so"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        detail: json["detail"] == List.empty() ? [] : List<DetailElement>.from(json["detail"].map((x) => DetailElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_sales_order": idSalesOrder == null ? "-" : idSalesOrder.toString(),
        "tgl_sales_order": tglSalesOrder == null ? null : "${tglSalesOrder?.year.toString().padLeft(4, '0')}-${tglSalesOrder?.month.toString().padLeft(2, '0')}-${tglSalesOrder?.day.toString().padLeft(2, '0')}",
        "no_sales_order": noSalesOrder == null ? "-" : noSalesOrder.toString(),
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "batas_waktu": batasWaktu == null ? null : "${batasWaktu?.year.toString().padLeft(4, '0')}-${batasWaktu?.month.toString().padLeft(2, '0')}-${batasWaktu?.day.toString().padLeft(2, '0')}",
        "alamat_pengiriman": alamatPengiriman == null ? "-" : alamatPengiriman.toString(),
        "diskon": diskon == null ? "-" : diskon.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "id_sales": idSales == null ? "-" : idSales.toString(),
        "nama_sales": namaSales == null ? "-" : namaSales.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "catatan_so": catatanSo == null ? "-" : catatanSo.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "detail": detail == List.empty() ? [] : List<dynamic>.from(detail!.map((x) => x.toJson())),
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
        idSalesOrderDetail: json["id_sales_order_detail"] == null ? "-" : json["id_sales_order_detail"].toString(),
        idSalesOrder: json["id_sales_order"] == null ? "-" : json["id_sales_order"].toString(),
        idBarang: json["id_barang"] == null ? "-" : json["id_barang"].toString(),
        idGudang: json["id_gudang"] == null ? "-" : json["id_gudang"].toString(),
        idSatuan: json["id_satuan"] == null ? "-" : json["id_satuan"].toString(),
        qtyItem: json["qty_item"] == null ? "-" : json["qty_item"].toString(),
        hargaSatuanJual: json["harga_satuan_jual"] == null ? "-" : json["harga_satuan_jual"].toString(),
        diskonItem: json["diskon_item"] == null ? "-" : json["diskon_item"].toString(),
        kodeBarang: json["kode_barang"] == null ? "-" : json["kode_barang"].toString(),
        namaBarang: json["nama_barang"] == null ? "-" : json["nama_barang"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        namaGudang: json["nama_gudang"] == null ? "-" : json["nama_gudang"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_sales_order_detail": idSalesOrderDetail == null ? "-" : idSalesOrderDetail.toString(),
        "id_sales_order": idSalesOrder == null ? "-" : idSalesOrder.toString(),
        "id_barang": idBarang == null ? "-" : idBarang.toString(),
        "id_gudang": idGudang == null ? "-" : idGudang.toString(),
        "id_satuan": idSatuan == null ? "-" : idSatuan.toString(),
        "qty_item": qtyItem == null ? "-" : qtyItem.toString(),
        "harga_satuan_jual": hargaSatuanJual == null ? "-" : hargaSatuanJual.toString(),
        "diskon_item": diskonItem == null ? "-" : diskonItem.toString(),
        "kode_barang": kodeBarang == null ? "-" : kodeBarang.toString(),
        "nama_barang": namaBarang == null ? "-" : namaBarang.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "nama_gudang": namaGudang == null ? "-" : namaGudang.toString(),
    };
}