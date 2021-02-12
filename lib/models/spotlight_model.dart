class SpotLight {
  String spotlightId;
  String spotlightTitle;
  String spotlightDescription;
  String videoPath;
  String spotlightThumbnail;
  String sharePostLink;
  String customerId;
  String customerName;
  String customerPhoto;
  String hasLiked;
  bool hasExpanded;

  SpotLight(
      {this.spotlightId,
      this.spotlightTitle,
      this.spotlightDescription,
      this.videoPath,
      this.spotlightThumbnail,
      this.sharePostLink,
      this.customerId,
      this.customerName,
      this.customerPhoto,
      this.hasLiked,
      this.hasExpanded = false});

  factory SpotLight.fromJson(Map<String, dynamic> json) {
    return SpotLight(
        spotlightId: json['spotlight_id'],
        spotlightTitle: json['spotlight_title'],
        spotlightDescription: json['spotlight_description'],
        videoPath: json['video_path'],
        spotlightThumbnail: json['spotlight_thumbnail'],
        sharePostLink: json['share_post_link'],
        customerId: json['customer_id'],
        customerName: json['customer_name'],
        customerPhoto: json['customer_photo'],
        hasLiked: json['hasLiked']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotlight_id'] = this.spotlightId;
    data['spotlight_title'] = this.spotlightTitle;
    data['spotlight_description'] = this.spotlightDescription;
    data['video_path'] = this.videoPath;
    data['spotlight_thumbnail'] = this.spotlightThumbnail;
    data['share_post_link'] = this.sharePostLink;
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_photo'] = this.customerPhoto;
    data['hasLiked'] = this.hasLiked;
    return data;
  }
}

class SpotLightList {
  final List<SpotLight> spotLightFeedList;

  SpotLightList({this.spotLightFeedList});

  factory SpotLightList.fromJson(List<dynamic> parsedJson) {
    List<SpotLight> spotLightListInFeed = new List<SpotLight>();
    spotLightListInFeed = parsedJson.map((e) => SpotLight.fromJson(e)).toList();
    return new SpotLightList(spotLightFeedList: spotLightListInFeed);
  }
}
