class GenreModelData {
  List<GenreResult>? genres;

  GenreModelData({this.genres});

  GenreModelData.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = <GenreResult>[];
      json['genres'].forEach((v) {
        genres!.add(new GenreResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GenreResult {
  int? id;
  String? name;

  GenreResult({this.id, this.name});

  GenreResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}