class TrendingPersonModelData {
  int? page;
  List<TrendingPersonResults>? results;
  int? totalPages;
  int? totalResults;

  TrendingPersonModelData(
      {this.page, this.results, this.totalPages, this.totalResults});

  TrendingPersonModelData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TrendingPersonResults>[];
      json['results'].forEach((v) {
        results!.add(TrendingPersonResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class TrendingPersonResults {
  bool? adult;
  String? profilePath;
  String? name;
  int? gender;
  double? popularity;
  String? mediaType;

  TrendingPersonResults(
      {this.adult,
        this.profilePath,
        this.name,
        this.gender,
        this.popularity,
        this.mediaType});

  TrendingPersonResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    profilePath = json['profile_path'];
    name = json['name'];
    gender = json['gender'];

    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['profile_path'] = this.profilePath;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}