class Talent {
  final String type;
  final String book;
  final String tradition;
  final String description;
  final String novice;
  final String adept;
  final String master;

  Talent( this.type, this.book, this.tradition, this.description, this.novice, this.adept, this.master );

  Talent.fromJson(Map<String, dynamic> json)
   : type = json['type'],
    book = json['book'],
    tradition = json['tradition'],
    description = json['description'],
    novice = json['novice'],
    adept = json['adept'],
    master = json['master'];
}