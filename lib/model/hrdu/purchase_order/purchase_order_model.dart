// To parse this JSON data, do
//
//     final regpo = regpoFromJson(jsonString);

import 'dart:convert';

class Regpo {
    Regpo({
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

    factory Regpo.fromRawJson(String str) => Regpo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Regpo.fromJson(Map<String, dynamic> json) => Regpo(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: json["xqry"] == null ? null : Xqry.fromJson(json["xqry"]),
        data: json["data"] == List.empty() ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry?.toJson(),
        "data": data == List.empty() ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount?.toInt(),
        "total_page": totalPage == null ? 0 : totalPage?.toInt(),
    };
}

class Datum {
    Datum({
        this.idPurchaseOrder,
        this.tglPurchaseOrder,
        this.noPurchaseOrder,
        this.idVendor,
        this.namaVendor,
        this.diskon,
        this.ppn,
        this.tglPengiriman,
        this.alamatTujuanPengiriman,
        this.keterangan,
        this.statusPurchaseOrder,
        this.baseline,
        this.tglSeleksiVendor,
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
        this.contactPerson,
        this.alamatVendor,
        this.kodeVendor,
        this.pembayaran,
        this.tglJatuhTempo,
        this.dp,
    });

    final String? idPurchaseOrder;
    final DateTime? tglPurchaseOrder;
    final String? noPurchaseOrder;
    final String? idVendor;
    final String? namaVendor;
    final String? diskon;
    final String? ppn;
    final DateTime? tglPengiriman;
    final String? alamatTujuanPengiriman;
    final String? keterangan;
    final String? statusPurchaseOrder;
    final String? baseline;
    final DateTime? tglSeleksiVendor;
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
    final String? contactPerson;
    final String? alamatVendor;
    final String? kodeVendor;
    final String? pembayaran;
    final DateTime? tglJatuhTempo;
    final String? dp;

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idPurchaseOrder: json["id_purchase_order"] == null ? "-" : json["id_purchase_order"].toString(),
        tglPurchaseOrder: json["tgl_purchase_order"] == null ? null : DateTime.parse(json["tgl_purchase_order"]),
        noPurchaseOrder: json["no_purchase_order"] == null ? "-" : json["no_purchase_order"].toString(),
        idVendor: json["id_vendor"] == null ? "-" : json["id_vendor"].toString(),
        namaVendor: json["nama_vendor"] == null ? "-" : json["nama_vendor"].toString(),
        diskon: json["diskon"] == null ? "-" : json["diskon"].toString(),
        ppn: json["ppn"] == null ? "-" : json["ppn"].toString(),
        tglPengiriman: json["tgl_pengiriman"] == null ? null : DateTime.parse(json["tgl_pengiriman"]),
        alamatTujuanPengiriman: json["alamat_tujuan_pengiriman"] == null ? "-" : json["alamat_tujuan_pengiriman"].toString(),
        keterangan: json["keterangan"] == null ? "-" : json["keterangan"].toString(),
        statusPurchaseOrder: json["status_purchase_order"] == null ? "-" : json["status_purchase_order"].toString(),
        baseline: json["baseline"] == null ? "-" : json["baseline"].toString(),
        tglSeleksiVendor: json["tgl_seleksi_vendor"] == null ? null : DateTime.parse(json["tgl_seleksi_vendor"]),
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
        contactPerson: json["contact_person"] == null ? "-" : json["contact_person"].toString(),
        alamatVendor: json["alamat_vendor"] == null ? "-" : json["alamat_vendor"].toString(),
        kodeVendor: json["kode_vendor"] == null ? "-" : json["kode_vendor"].toString(),
        pembayaran: json["pembayaran"] == null ? "-" : json["pembayaran"].toString(),
        tglJatuhTempo: json["tgl_jatuh_tempo"] == null ? null : DateTime.parse(json["tgl_jatuh_tempo"]),
        dp: json["dp"] == null ? "-" : json["dp"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_purchase_order": idPurchaseOrder == null ? "-" : idPurchaseOrder.toString(),
        "tgl_purchase_order": tglPurchaseOrder == null ? null : "${tglPurchaseOrder?.year.toString().padLeft(4, '0')}-${tglPurchaseOrder?.month.toString().padLeft(2, '0')}-${tglPurchaseOrder?.day.toString().padLeft(2, '0')}",
        "no_purchase_order": noPurchaseOrder == null ? "-" : noPurchaseOrder.toString(),
        "id_vendor": idVendor == null ? "-" : idVendor.toString(),
        "nama_vendor": namaVendor == null ? "-" : namaVendor.toString(),
        "diskon": diskon == null ? "-" : diskon.toString(),
        "ppn": ppn == null ? "-" : ppn.toString(),
        "tgl_pengiriman": tglPengiriman == null ? null : "${tglPengiriman?.year.toString().padLeft(4, '0')}-${tglPengiriman?.month.toString().padLeft(2, '0')}-${tglPengiriman?.day.toString().padLeft(2, '0')}",
        "alamat_tujuan_pengiriman": alamatTujuanPengiriman == null ? "-" : alamatTujuanPengiriman.toString(),
        "keterangan": keterangan == null ? "-" : keterangan.toString(),
        "status_purchase_order": statusPurchaseOrder == null ? "-" : statusPurchaseOrder.toString(),
        "baseline": baseline == null ? "-" : baseline.toString(),
        "tgl_seleksi_vendor": tglSeleksiVendor == null ? null : "${tglSeleksiVendor?.year.toString().padLeft(4, '0')}-${tglSeleksiVendor?.month.toString().padLeft(2, '0')}-${tglSeleksiVendor?.day.toString().padLeft(2, '0')}",
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
        "id_karyawan_pengaju": idKaryawanPengaju == null ? "-" : idKaryawanPengaju.toString(),
        "id_jabatan_pengaju": idJabatanPengaju == null ? "-" : idJabatanPengaju.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
        "contact_person": contactPerson == null ? "-" : contactPerson.toString(),
        "alamat_vendor": alamatVendor == null ? "-" : alamatVendor.toString(),
        "kode_vendor": kodeVendor == null ? "-" : kodeVendor.toString(),
        "pembayaran": pembayaran == null ? "-" : pembayaran.toString(),
        "tgl_jatuh_tempo": tglJatuhTempo == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "dp": dp == null ? "-" : dp.toString(),
    };
}

class Xqry {
    Xqry({
        this.page,
        this.perPage,
        this.approvalLevel,
        required this.statusApproval,
    });

    final String? page;
    final String? perPage;
    final int? approvalLevel;
    final List<String> statusApproval;

    factory Xqry.fromRawJson(String str) => Xqry.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Xqry.fromJson(Map<String, dynamic> json) => Xqry(
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        approvalLevel: json["approval_level"] == null ? 0 : json["approval_level"].toInt(),
        statusApproval: json["status_approval"] == List.empty() ? [] : List<String>.from(json["status_approval"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "approval_level": approvalLevel == null ? 0 : approvalLevel?.toInt(),
        "status_approval": statusApproval == List.empty() ? [] : List<dynamic>.from(statusApproval.map((x) => x)),
    };
}