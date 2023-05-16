import 'dart:convert';

ComapanyDataModel comapanyDataModelFromJson(String str) => ComapanyDataModel.fromJson(json.decode(str));

String comapanyDataModelToJson(ComapanyDataModel data) => json.encode(data.toJson());

class ComapanyDataModel {
    final String statusCode;
    final String statusMessage;
    final CompanyList companyList;

    ComapanyDataModel({
        required this.statusCode,
        required this.statusMessage,
        required this.companyList,
    });

    ComapanyDataModel copyWith({
        String? statusCode,
        String? statusMessage,
        CompanyList? companyList,
    }) => 
        ComapanyDataModel(
            statusCode: statusCode ?? this.statusCode,
            statusMessage: statusMessage ?? this.statusMessage,
            companyList: companyList ?? this.companyList,
        );

    factory ComapanyDataModel.fromJson(Map<String, dynamic> json) => ComapanyDataModel(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        companyList: CompanyList.fromJson(json["company_list"]),
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message": statusMessage,
        "company_list": companyList.toJson(),
    };
}

class CompanyList {
    final int currentPage;
    final List<Datum> data;
    final String firstPageUrl;
    final int from;
    final int lastPage;
    final String lastPageUrl;
    final List<Link> links;
    final dynamic nextPageUrl;
    final String path;
    final int perPage;
    final dynamic prevPageUrl;
    final int to;
    final int total;

    CompanyList({
        required this.currentPage,
        required this.data,
        required this.firstPageUrl,
        required this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        this.nextPageUrl,
        required this.path,
        required this.perPage,
        this.prevPageUrl,
        required this.to,
        required this.total,
    });

    CompanyList copyWith({
        int? currentPage,
        List<Datum>? data,
        String? firstPageUrl,
        int? from,
        int? lastPage,
        String? lastPageUrl,
        List<Link>? links,
        dynamic nextPageUrl,
        String? path,
        int? perPage,
        dynamic prevPageUrl,
        int? to,
        int? total,
    }) => 
        CompanyList(
            currentPage: currentPage ?? this.currentPage,
            data: data ?? this.data,
            firstPageUrl: firstPageUrl ?? this.firstPageUrl,
            from: from ?? this.from,
            lastPage: lastPage ?? this.lastPage,
            lastPageUrl: lastPageUrl ?? this.lastPageUrl,
            links: links ?? this.links,
            nextPageUrl: nextPageUrl ?? this.nextPageUrl,
            path: path ?? this.path,
            perPage: perPage ?? this.perPage,
            prevPageUrl: prevPageUrl ?? this.prevPageUrl,
            to: to ?? this.to,
            total: total ?? this.total,
        );

    factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    final int id;
    final String companyName;
    final String email;
    final String password;
    final String phone;
    final DateTime createdAt;
    final DateTime updatedAt;

    Datum({
        required this.id,
        required this.companyName,
        required this.email,
        required this.password,
        required this.phone,
        required this.createdAt,
        required this.updatedAt,
    });

    Datum copyWith({
        int? id,
        String? companyName,
        String? email,
        String? password,
        String? phone,
        DateTime? createdAt,
        DateTime? updatedAt,
    }) => 
        Datum(
            id: id ?? this.id,
            companyName: companyName ?? this.companyName,
            email: email ?? this.email,
            password: password ?? this.password,
            phone: phone ?? this.phone,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        companyName: json["company_name"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "company_name": companyName,
        "email": email,
        "password": password,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Link {
    final String? url;
    final String label;
    final bool active;

    Link({
        this.url,
        required this.label,
        required this.active,
    });

    Link copyWith({
        String? url,
        String? label,
        bool? active,
    }) => 
        Link(
            url: url ?? this.url,
            label: label ?? this.label,
            active: active ?? this.active,
        );

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
