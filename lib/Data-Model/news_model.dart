// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class NewsEvent {
  String? status;
  String? requestId;
  List<Data>? data;

  NewsEvent({this.status, this.requestId, this.data});

  NewsEvent.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    requestId = json['request_id'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['request_id'] = this.requestId;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  String? link;
  String? snippet;
  String? photoUrl;
  String? thumbnailUrl;
  String? publishedDatetimeUtc;
  String? sourceUrl;
  String? sourceName;
  String? sourceLogoUrl;
  String? sourceFaviconUrl;
  String? sourcePublicationId;
  List<RelatedTopics>? relatedTopics;

  Data(
      {this.title,
      this.link,
      this.snippet,
      this.photoUrl,
      this.thumbnailUrl,
      this.publishedDatetimeUtc,
      this.sourceUrl,
      this.sourceName,
      this.sourceLogoUrl,
      this.sourceFaviconUrl,
      this.sourcePublicationId,
      this.relatedTopics});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    snippet = json['snippet'];
    photoUrl = json['photo_url'];
    thumbnailUrl = json['thumbnail_url'];
    publishedDatetimeUtc = json['published_datetime_utc'];
    sourceUrl = json['source_url'];
    sourceName = json['source_name'];
    sourceLogoUrl = json['source_logo_url'];
    sourceFaviconUrl = json['source_favicon_url'];
    sourcePublicationId = json['source_publication_id'];
    if (json['related_topics'] != null) {
      relatedTopics = <RelatedTopics>[];
      json['related_topics'].forEach((v) {
        relatedTopics!.add(new RelatedTopics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['snippet'] = this.snippet;
    data['photo_url'] = this.photoUrl;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['published_datetime_utc'] = this.publishedDatetimeUtc;
    data['source_url'] = this.sourceUrl;
    data['source_name'] = this.sourceName;
    data['source_logo_url'] = this.sourceLogoUrl;
    data['source_favicon_url'] = this.sourceFaviconUrl;
    data['source_publication_id'] = this.sourcePublicationId;
    if (this.relatedTopics != null) {
      data['related_topics'] =
          this.relatedTopics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RelatedTopics {
  String? topicId;
  String? topicName;

  RelatedTopics({this.topicId, this.topicName});

  RelatedTopics.fromJson(Map<String, dynamic> json) {
    topicId = json['topic_id'];
    topicName = json['topic_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['topic_id'] = this.topicId;
    data['topic_name'] = this.topicName;
    return data;
  }
}
