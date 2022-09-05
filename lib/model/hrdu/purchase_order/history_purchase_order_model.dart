// To parse this JSON data, do
//
//     final historyRegpo = historyRegpoFromJson(jsonString);

import 'dart:convert';

class HistoryRegpo {
    HistoryRegpo({
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

    factory HistoryRegpo.fromRawJson(String str) => HistoryRegpo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HistoryRegpo.fromJson(Map<String, dynamic> json) => HistoryRegpo(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        xqry: json["xqry"] == null ? null : Xqry.fromJson(json["xqry"]),
        identity: json["identity"] == null ? null : Identity.fromJson(json["identity"]),
        data: json["data"] == List.empty() ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        dataCount: json["data_count"] == null ? 0 : json["data_count"].toInt(),
        totalPage: json["total_page"] == null ? 0 : json["total_page"].toInt(),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? "-" : message.toString(),
        "xqry": xqry?.toJson(),
        "identity": identity?.toJson(),
        "data": data == List.empty() ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
        "data_count": dataCount == null ? 0 : dataCount.toString(),
        "total_page": totalPage == null ? 0 : totalPage.toString(),
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
        this.kodeVendor,
        this.alamatVendor,
        this.contactPerson,
        this.tglSeleksiVendor,
        this.pembayaran,
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
    final String? kodeVendor;
    final String? alamatVendor;
    final String? contactPerson;
    final DateTime? tglSeleksiVendor;
    final String? pembayaran;
    final String? idApprovalTransaksi;
    final String? noTransaksi;
    final String? kodeTransaksi;
    final String? idKaryawanApproval;
    final String? idJabatanApproval;
    final String? statusApproval;
    final String? catatanApproval;
    final DateTime? approvalCreatedAt;
    final DateTime? tglApproval;
    final String? approvalLevel;
    final String? namaKaryawanApproval;
    final String? namaJabatanApproval;
    final String? namaKaryawanPengaju;
    final String? namaJabatanPengaju;

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
        kodeVendor: json["kode_vendor"] == null ? "-" : json["kode_vendor"].toString(),
        alamatVendor: json["alamat_vendor"] == null ? "-" : json["alamat_vendor"].toString(),
        contactPerson: json["contact_person"] == null ? "-" : json["contact_person"].toString(),
        tglSeleksiVendor: json["tgl_seleksi_vendor"] == null ? null : DateTime.parse(json["tgl_seleksi_vendor"]),
        pembayaran: json["pembayaran"] == null ? "-" : json["pembayaran"].toString(),
        idApprovalTransaksi: json["id_approval_transaksi"] == null ? "-" : json["id_approval_transaksi"].toString(),
        noTransaksi: json["no_transaksi"] == null ? "-" : json["no_transaksi"].toString(),
        kodeTransaksi: json["kode_transaksi"] == null ? "-" : json["kode_transaksi"].toString(),
        idKaryawanApproval: json["id_karyawan_approval"] == null ? "-" : json["id_karyawan_approval"].toString(),
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString(),
        statusApproval: json["status_approval"] == null ? "-" : json["status_approval"].toString(),
        catatanApproval: json["catatan_approval"] == null ? "-" : json["catatan_approval"].toString(),
        approvalCreatedAt: json["approval_created_at"] == null ? null : DateTime.parse(json["approval_created_at"]),
        tglApproval: json["tgl_approval"] == null ? null : DateTime.parse(json["tgl_approval"]),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
        namaKaryawanApproval: json["nama_karyawan_approval"] == null ? "-" : json["nama_karyawan_approval"].toString(),
        namaJabatanApproval: json["nama_jabatan_approval"] == null ? "-" : json["nama_jabatan_approval"].toString(),
        namaKaryawanPengaju: json["nama_karyawan_pengaju"] == null ? "-" : json["nama_karyawan_pengaju"].toString(),
        namaJabatanPengaju: json["nama_jabatan_pengaju"] == null ? "-" : json["nama_jabatan_pengaju"].toString(),
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
        "kode_vendor": kodeVendor == null ? "-" : kodeVendor.toString(),
        "alamat_vendor": alamatVendor == null ? "-" : alamatVendor.toString(),
        "contact_person": contactPerson == null ? "-" : contactPerson.toString(),
        "tgl_seleksi_vendor": tglSeleksiVendor == null ? null : "${tglSeleksiVendor?.year.toString().padLeft(4, '0')}-${tglSeleksiVendor?.month.toString().padLeft(2, '0')}-${tglSeleksiVendor?.day.toString().padLeft(2, '0')}",
        "pembayaran": pembayaran == null ? "-" : pembayaran.toString(),
        "id_approval_transaksi": idApprovalTransaksi == null ? "-" : idApprovalTransaksi.toString(),
        "no_transaksi": noTransaksi == null ? "-" : noTransaksi.toString(),
        "kode_transaksi": kodeTransaksi == null ? "-" : kodeTransaksi.toString(),
        "id_karyawan_approval": idKaryawanApproval == null ? "-" : idKaryawanApproval.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
        "status_approval": statusApproval == null ? "-" : statusApproval.toString(),
        "catatan_approval": catatanApproval == null ? "-" : catatanApproval.toString(),
        "approval_created_at": approvalCreatedAt == null ? "-" : approvalCreatedAt.toString(),
        "tgl_approval": tglApproval == null ? null : "${tglApproval?.year.toString().padLeft(4, '0')}-${tglApproval?.month.toString().padLeft(2, '0')}-${tglApproval?.day.toString().padLeft(2, '0')}",
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
        "nama_karyawan_approval": namaKaryawanApproval == null ? "-" : namaKaryawanApproval.toString(),
        "nama_jabatan_approval": namaJabatanApproval == null ? "-" : namaJabatanApproval.toString(),
        "nama_karyawan_pengaju": namaKaryawanPengaju == null ? "-" : namaKaryawanPengaju.toString(),
        "nama_jabatan_pengaju": namaJabatanPengaju == null ? "-" : namaJabatanPengaju.toString(),
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
        idJabatan: json["id_jabatan"] == null ? "-" : json["id_jabatan"].toString(),
        idUnitOrganisasi: json["id_unit_organisasi"] == null ? "-" : json["id_unit_organisasi"].toString(),
        idKaryawan: json["id_karyawan"] == null ? "-" : json["id_karyawan"].toString(),
        kodeProses: json["kode_proses"] == null ? "-" : json["kode_proses"].toString(),
        behavior: json["behavior"] == null ? "-" : json["behavior"].toString(),
        approvalLevel: json["approval_level"] == null ? "-" : json["approval_level"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_jabatan": idJabatan == null ? "-" : idJabatan.toString(),
        "id_unit_organisasi": idUnitOrganisasi == null ? "-" : idUnitOrganisasi.toString(),
        "id_karyawan": idKaryawan == null ? "-" : idKaryawan.toString(),
        "kode_proses": kodeProses == null ? "-" : kodeProses.toString(),
        "behavior": behavior == null ? "-" : behavior.toString(),
        "approval_level": approvalLevel == null ? "-" : approvalLevel.toString(),
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
        page: json["page"] == null ? "-" : json["page"].toString(),
        perPage: json["per_page"] == null ? "-" : json["per_page"].toString(),
        idJabatanApproval: json["id_jabatan_approval"] == null ? "-" : json["id_jabatan_approval"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "page": page == null ? "-" : page.toString(),
        "per_page": perPage == null ? "-" : perPage.toString(),
        "id_jabatan_approval": idJabatanApproval == null ? "-" : idJabatanApproval.toString(),
    };
}
