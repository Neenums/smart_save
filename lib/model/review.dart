import 'dart:convert';
/// rating : 2
/// comment : "Very unhappy with my purchase!"
/// date : "2024-05-23T08:56:21.618Z"
/// reviewerName : "John Doe"
/// reviewerEmail : "john.doe@x.dummyjson.com"

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));
String reviewToJson(Review data) => json.encode(data.toJson());
class Review {
  Review({
      num? rating, 
      String? comment, 
      String? date, 
      String? reviewerName, 
      String? reviewerEmail,}){
    _rating = rating;
    _comment = comment;
    _date = date;
    _reviewerName = reviewerName;
    _reviewerEmail = reviewerEmail;
}

  Review.fromJson(dynamic json) {
    _rating = json['rating'];
    _comment = json['comment'];
    _date = json['date'];
    _reviewerName = json['reviewerName'];
    _reviewerEmail = json['reviewerEmail'];
  }
  num? _rating;
  String? _comment;
  String? _date;
  String? _reviewerName;
  String? _reviewerEmail;
Review copyWith({  num? rating,
  String? comment,
  String? date,
  String? reviewerName,
  String? reviewerEmail,
}) => Review(  rating: rating ?? _rating,
  comment: comment ?? _comment,
  date: date ?? _date,
  reviewerName: reviewerName ?? _reviewerName,
  reviewerEmail: reviewerEmail ?? _reviewerEmail,
);
  num? get rating => _rating;
  String? get comment => _comment;
  String? get date => _date;
  String? get reviewerName => _reviewerName;
  String? get reviewerEmail => _reviewerEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = _rating;
    map['comment'] = _comment;
    map['date'] = _date;
    map['reviewerName'] = _reviewerName;
    map['reviewerEmail'] = _reviewerEmail;
    return map;
  }

}