// To parse this JSON data, do
//
//     final pr = prFromJson(jsonString);

import 'dart:convert';

class Pr {
    Pr({
        this.status,
        this.message,
        this.xqry,
        required this.data,
        this.dataCount,
        this.totalPage,
    });

    final bool? status;
    final String? message;
    final Xqry? xqry;
    final List<Datum> data;
    final int? dataCount;
    final int? totalPage;

    factory Pr.fromRawJson(String str) => Pr.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pr.fromJson(Map<String, dynamic> json) => Pr(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: json["xqry"] == null ? null : Xqry.fromJson(json["xqry"]),
        data: json["data"] == List.empty() ? [] : json["data"] == null ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry == null ? null : xqry!.toJson(),
        "data": data == List.empty() ? [] : data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount?.toInt(),
        "total_page": totalPage == null ? 0 : totalPage?.toInt(),
    };
}

class Datum {
    Datum({
        this.idPurchaseRequest,
        this.tglPurchaseRequest,
        this.noPurchaseRequest,
        this.tglPemakaian,
        this.keperluan,
        this.catatanPurchaseRequest,
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
        this.namaKaryawan,
        this.namaJabatan,
        this.idKaryawanPengaju,
        this.idJabatanPengaju,
        this.namaKaryawanPengaju,
        this.namaJabatanPengaju,
        this.statusPr,
        this.idProyek,
        this.namaProyek,
        this.listItemBarang,
        this.itemBarang,
    });

    final String? idPurchaseRequest;
    final DateTime? tglPurchaseRequest;
    final String? noPurchaseRequest;
    final DateTime? tglPemakaian;
    final String? keperluan;
    final String? catatanPurchaseRequest;
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
    final String? namaKaryawan;
    final String? namaJabatan;
    final String? idKaryawanPengaju;
    final String? idJabatanPengaju;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;
    final String? statusPr;
    final String? idProyek;
    final String? namaProyek;
    final String? listItemBarang;
    final List<ItemBarang>? itemBarang;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idPurchaseRequest: json["id_purchase_request"] == null ? "-" : json["id_purchase_request"].toString(),
        tglPurchaseRequest: json["tgl_purchase_request"] == null ? null : DateTime.parse(json["tgl_purchase_request"]),
        noPurchaseRequest: json["no_purchase_request"] == null ? "-" : json["no_purchase_request"].toString(),
        tglPemakaian: json["tgl_pemakaian"] == null ? null : DateTime.parse(json["tgl_pemakaian"]),
        keperluan: json["keperluan"] == null ? "-" : json["keperluan"].toString(),
        catatanPurchaseRequest: json["catatan_purchase_request"] == null ? "-" : json["catatan_purchase_request"].toString(),
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
        namaKaryawan: json["nama_karyawan"] == null ? "-" : json["nama_karyawan"].toString(),
        namaJabatan: json["nama_jabatan"] == null ? "-" : json["nama_jabatan"].toString(),
        idKaryawanPengaju: json["id_karyawan_pengaju"] == null ? "-" : json["id_karyawan_pengaju"].toString(),
        idJabatanPengaju: json["id_jabatan_pengaju"] == null ? "-" : json["id_jabatan_pengaju"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
        statusPr: json["status_pr"] == null ? "-" : json["status_pr"].toString(),
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        listItemBarang: json["list_item_barang"] == null ? "-" : json["list_item_barang"].toString(),
        itemBarang: json["item_barang"] == List.empty() ? [] : json["item_barang"] == null ? [] : List<ItemBarang>.from(json["item_barang"].map((x) => ItemBarang.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_purchase_request": idPurchaseRequest == null ? "-" : idPurchaseRequest.toString(),
        "tgl_purchase_request": tglPurchaseRequest == null ? null : "${tglPurchaseRequest?.year.toString().padLeft(4, '0')}-${tglPurchaseRequest?.month.toString().padLeft(2, '0')}-${tglPurchaseRequest?.day.toString().padLeft(2, '0')}",
        "no_purchase_request": noPurchaseRequest == null ? "-" : noPurchaseRequest.toString(),
        "tgl_pemakaian": tglPemakaian == null ? null : "${tglPemakaian?.year.toString().padLeft(4, '0')}-${tglPemakaian?.month.toString().padLeft(2, '0')}-${tglPemakaian?.day.toString().padLeft(2, '0')}",
        "keperluan": keperluan == null ? "-" : keperluan.toString(),
        "catatan_purchase_request": catatanPurchaseRequest == null ? "-" : catatanPurchaseRequest.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan": catatan == null ? "-" : catatan.toString(),
        "created_at": createdAt == null ? "-" : createdAt?.toIso8601String(),
        "tgl_approval": tglApproval == null ? "-" : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan": namaKaryawan == null ? "-" : namaKaryawan.toString(),
        "nama_jabatan": namaJabatan == null ? "-" : namaJabatan.toString(),
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "status_pr": statusPr == null ? "-" : statusPr.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "list_item_barang": listItemBarang == null ? "-" : listItemBarang.toString(),
        "item_barang": itemBarang == List.empty() ? [] : itemBarang == null ? [] : List<dynamic>.from(itemBarang!.map((x) => x.toJson())),
    };
}

class ItemBarang {
    ItemBarang({
        this.idPurchaseRequest,
        this.idItemBuaso,
        this.kodeItem,
        this.namaItem,
        this.namaSatuan,
        this.qty,
        this.qtyOrdered,
    });

    final String? idPurchaseRequest;
    final String? idItemBuaso;
    final String? kodeItem;
    final String? namaItem;
    final String? namaSatuan;
    final String? qty;
    final String? qtyOrdered;

    factory ItemBarang.fromRawJson(String str) => ItemBarang.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ItemBarang.fromJson(Map<String, dynamic> json) => ItemBarang(
        idPurchaseRequest: json["id_purchase_request"] == null ? "-" : json["id_purchase_request"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        namaSatuan: json["nama_satuan"] == null ? "-" : json["nama_satuan"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        qtyOrdered: json["qty_ordered"] == null ? "-" : json["qty_ordered"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_purchase_request": idPurchaseRequest == null ? "-" : idPurchaseRequest.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "nama_satuan": namaSatuan == null ? "-" : namaSatuan.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "qty_ordered": qtyOrdered == null ? "-" : qtyOrdered.toString(),
    };
}

class Xqry {
    Xqry({
        this.page,
        this.perPage,
        this.approvalLevel,
        this.statusApproval,
    });

    final String? page;
    final String? perPage;
    final int? approvalLevel;
    final List<String>? statusApproval;

    factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        approvalLevel: json["approval_level"] == null ? 0 : json["approval_level"].toInt(),
        statusApproval: json["status_approval"] == List.empty() ? [] : json["status_approval"] == null ? [] : List<String>.from(json["status_approval"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "status_approval": statusApproval == List.empty() ? [] : statusApproval == null ? [] : List<dynamic>.from(statusApproval!.map((x) => x)),
    };
}
