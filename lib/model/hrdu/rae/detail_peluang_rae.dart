// To parse this JSON data, do
//
//     final detailPeluangRegrae = detailPeluangRegraeFromJson(jsonString);

import 'dart:convert';

class DetailPeluangRegrae {
    DetailPeluangRegrae({
        this.status,
        this.message,
        this.data,
    });

    final bool? status;
    final String? message;
    final Data? data;

    factory DetailPeluangRegrae.fromRawJson(String str) => DetailPeluangRegrae.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DetailPeluangRegrae.fromJson(Map<String, dynamic> json) => DetailPeluangRegrae(
        status: json["status"],
        message: json["message"] == null ? "-" : json["message"].toString(),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message == null ? null : message.toString(),
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.idPeluang,
        this.noPeluang,
        this.tglPeluang,
        this.idCustomer,
        this.namaCustomer,
        this.idPeringkatPeluang,
        this.namaPeringkatPeluang,
        this.keteranganPengiriman,
        this.lokasiPengiriman,
        this.tglSelesai,
        this.att,
        this.instalasi,
        this.lainLain,
        this.isHidden,
        this.idProyek,
        this.kodeProyek,
        this.namaProyek,
        this.realisasiPenawaran,
        this.scheduleKebutuhanProyek,
        this.linkReferensi,
        this.kelompokProyek,
        this.detail,
        this.stakeholder,
        this.gambar,
    });

    final String? idPeluang;
    final String? noPeluang;
    final DateTime? tglPeluang;
    final String? idCustomer;
    final String? namaCustomer;
    final String? idPeringkatPeluang;
    final String? namaPeringkatPeluang;
    final String? keteranganPengiriman;
    final String? lokasiPengiriman;
    final DateTime? tglSelesai;
    final String? att;
    final bool? instalasi;
    final String? lainLain;
    final bool? isHidden;
    final String? idProyek;
    final String? kodeProyek;
    final String? namaProyek;
    final DateTime? realisasiPenawaran;
    final String? scheduleKebutuhanProyek;
    final String? linkReferensi;
    final String? kelompokProyek;
    final List<Detail>? detail;
    final List<Stakeholder>? stakeholder;
    final List<Gambar>? gambar;

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        noPeluang: json["no_peluang"] == null ? "-" : json["no_peluang"].toString(),
        tglPeluang: json["tgl_peluang"] == null ? null : DateTime.parse(json["tgl_peluang"]),
        idCustomer: json["id_customer"] == null ? "-" : json["id_customer"].toString(),
        namaCustomer: json["nama_customer"] == null ? "-" : json["nama_customer"].toString(),
        idPeringkatPeluang: json["id_peringkat_peluang"] == null ? "-" : json["id_peringkat_peluang"].toString(),
        namaPeringkatPeluang: json["nama_peringkat_peluang"] == null ? "-" : json["nama_peringkat_peluang"].toString(),
        keteranganPengiriman: json["keterangan_pengiriman"] == null ? "-" : json["keterangan_pengiriman"].toString(),
        lokasiPengiriman: json["lokasi_pengiriman"] == null ? "-" : json["lokasi_pengiriman"].toString(),
        tglSelesai: json["tgl_selesai"] == null ? null : DateTime.parse(json["tgl_selesai"]),
        att: json["att"] == null ? "-" : json["att"].toString(),
        instalasi: json["instalasi"],
        lainLain: json["lain_lain"] == null ? "-" : json["lain_lain"].toString(),
        isHidden: json["is_hidden"],
        idProyek: json["id_proyek"] == null ? "-" : json["id_proyek"].toString(),
        kodeProyek: json["kode_proyek"] == null ? "-" : json["kode_proyek"].toString(),
        namaProyek: json["nama_proyek"] == null ? "-" : json["nama_proyek"].toString(),
        realisasiPenawaran: json["realisasi_penawaran"] == null ? null : DateTime.parse(json["realisasi_penawaran"]),
        scheduleKebutuhanProyek: json["schedule_kebutuhan_proyek"] == null ? "-" : json["schedule_kebutuhan_proyek"].toString(),
        linkReferensi: json["link_referensi"] == null ? "-" : json["link_referensi"].toString(),
        kelompokProyek: json["kelompok_proyek"] == null ? "-" : json["kelompok_proyek"].toString(),
        detail: json["detail"] == List.empty() ? [] : List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
        stakeholder: json["stakeholder"] == List.empty() ? [] : List<Stakeholder>.from(json["stakeholder"].map((x) => Stakeholder.fromJson(x))),
        gambar: json["gambar"] == List.empty() ? [] : List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "no_peluang": noPeluang == null ? "-" : noPeluang.toString(),
        "tgl_peluang": tglPeluang == null ? "-" : "${tglPeluang?.year.toString().padLeft(4, '0')}-${tglPeluang?.month.toString().padLeft(2, '0')}-${tglPeluang?.day.toString().padLeft(2, '0')}".toString(),
        "id_customer": idCustomer == null ? "-" : idCustomer.toString(),
        "nama_customer": namaCustomer == null ? "-" : namaCustomer.toString(),
        "id_peringkat_peluang": idPeringkatPeluang == null ? "-" : idPeringkatPeluang.toString(),
        "nama_peringkat_peluang": namaPeringkatPeluang == null ? "-" : namaPeringkatPeluang.toString(),
        "keterangan_pengiriman": keteranganPengiriman == null ? "-" : keteranganPengiriman.toString(),
        "lokasi_pengiriman": lokasiPengiriman == null ? "-" : lokasiPengiriman.toString(),
        "tgl_selesai": tglSelesai == null ? null : "${tglSelesai?.year.toString().padLeft(4, '0')}-${tglSelesai?.month.toString().padLeft(2, '0')}-${tglSelesai?.day.toString().padLeft(2, '0')}".toString(),
        "att": att == null ? "-" : att.toString(),
        "instalasi": instalasi == null ? "-" : instalasi.toString(),
        "lain_lain": lainLain == null ? "-" : lainLain.toString(),
        "is_hidden": isHidden == null ? "-" : isHidden.toString(),
        "id_proyek": idProyek == null ? "-" : idProyek.toString(),
        "kode_proyek": kodeProyek == null ? "-" : kodeProyek.toString(),
        "nama_proyek": namaProyek == null ? "-" : namaProyek.toString(),
        "realisasi_penawaran": realisasiPenawaran == null ? "-" : "${realisasiPenawaran?.year.toString().padLeft(4, '0')}-${realisasiPenawaran?.month.toString().padLeft(2, '0')}-${realisasiPenawaran?.day.toString().padLeft(2, '0')}",
        "schedule_kebutuhan_proyek": scheduleKebutuhanProyek == null ? "-" : scheduleKebutuhanProyek.toString(),
        "link_referensi": linkReferensi == null ? "-" : linkReferensi.toString(),
        "kelompok_proyek": kelompokProyek == null ? "-" : kelompokProyek.toString(),
        "detail": detail == List.empty() ? [] : List<dynamic>.from(detail!.map((x) => x.toJson())).toString(),
        "stakeholder": stakeholder == List.empty() ? [] : List<dynamic>.from(stakeholder!.map((x) => x.toJson())).toString(),
        "gambar": gambar == List.empty() ? [] : List<dynamic>.from(gambar!.map((x) => x.toJson())).toString(),
    };
}

class Detail {
    Detail({
        this.idPeluangDetail,
        this.idPeluang,
        this.idItemBuaso,
        this.kodeItem,
        this.namaItem,
        this.qty,
        this.idJenis,
        this.namaJenis,
        this.idSatuanJual,
        this.namaSatuanJual,
    });

    final String? idPeluangDetail;
    final String? idPeluang;
    final String? idItemBuaso;
    final String? kodeItem;
    final String? namaItem;
    final String? qty;
    final String? idJenis;
    final String? namaJenis;
    final String? idSatuanJual;
    final String? namaSatuanJual;

    factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        idPeluangDetail: json["id_peluang_detail"] == null ? "-" : json["id_peluang_detail"].toString(),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        idItemBuaso: json["id_item_buaso"] == null ? "-" : json["id_item_buaso"].toString(),
        kodeItem: json["kode_item"] == null ? "-" : json["kode_item"].toString(),
        namaItem: json["nama_item"] == null ? "-" : json["nama_item"].toString(),
        qty: json["qty"] == null ? "-" : json["qty"].toString(),
        idJenis: json["id_jenis"] == null ? "-" : json["id_jenis"].toString(),
        namaJenis: json["nama_jenis"] == null ? "-" : json["nama_jenis"].toString(),
        idSatuanJual: json["id_satuan_jual"] == null ? "-" : json["id_satuan_jual"].toString(),
        namaSatuanJual: json["nama_satuan_jual"] == null ? "-" : json["nama_satuan_jual"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_peluang_detail": idPeluangDetail == null ? "-" : idPeluangDetail.toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "id_item_buaso": idItemBuaso == null ? "-" : idItemBuaso.toString(),
        "kode_item": kodeItem == null ? "-" : kodeItem.toString(),
        "nama_item": namaItem == null ? "-" : namaItem.toString(),
        "qty": qty == null ? "-" : qty.toString(),
        "id_jenis": idJenis == null ? "-" : idJenis.toString(),
        "nama_jenis": namaJenis == null ? "-" : namaJenis.toString(),
        "id_satuan_jual": idSatuanJual == null ? "-" : idSatuanJual.toString(),
        "nama_satuan_jual": namaSatuanJual == null ? "-" : namaSatuanJual.toString(),
    };
}

class Gambar {
    Gambar({
        this.idPeluangGambar,
        this.idPeluang,
        this.pathGambar,
    });

    final String? idPeluangGambar;
    final String? idPeluang;
    final String? pathGambar;

    factory Gambar.fromRawJson(String str) => Gambar.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
        idPeluangGambar: json["id_peluang_gambar"] == null ? "-" : json["id_peluang_gambar"].toString(),
        idPeluang: json["id_peluang"] == null ? "-" : json["id_peluang"].toString(),
        pathGambar: json["path_gambar"] == null ? "-" : json["path_gambar"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id_peluang_gambar": idPeluangGambar == null ? "-" : idPeluangGambar.toString(),
        "id_peluang": idPeluang == null ? "-" : idPeluang.toString(),
        "path_gambar": pathGambar == null ? "-" : pathGambar.toString(),
    };
}

class Stakeholder {
    Stakeholder({
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

    factory Stakeholder.fromRawJson(String str) => Stakeholder.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Stakeholder.fromJson(Map<String, dynamic> json) => Stakeholder(
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
