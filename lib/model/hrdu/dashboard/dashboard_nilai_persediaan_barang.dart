import 'dart:convert';

class DashInvNilaiPersediaanBarang {
    final bool? status;
    final String? message;
    final List<Datum> data;

    DashInvNilaiPersediaanBarang({
        this.status,
        this.message,
        required this.data,
    });

    factory DashInvNilaiPersediaanBarang.fromRawJson(String str) => DashInvNilaiPersediaanBarang.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DashInvNilaiPersediaanBarang.fromJson(Map<String, dynamic> json) => DashInvNilaiPersediaanBarang(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    final double? total;
    final String? tahunMutasi;
    final String? bulanMutasi;

    Datum({
        this.total,
        this.tahunMutasi,
        this.bulanMutasi,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        total: json["total"]?.toDouble(),
        tahunMutasi: json["tahun_mutasi"],
        bulanMutasi: json["bulan_mutasi"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "tahun_mutasi": tahunMutasi,
        "bulan_mutasi": bulanMutasi,
    };
}
