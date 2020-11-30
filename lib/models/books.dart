

class Books {
  bool avilable;
  String sId;
  String name;
  int price;
  String author;
  String cat;
  String addeddate;
  String takenby;

  Books(
      {this.avilable,
      this.sId,
      this.name,
      this.price,
      this.author,
      this.cat,
      this.addeddate,
      this.takenby});

  
 Books.fromJson(Map<String, dynamic> json) {
    avilable = json['avilable'];
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    author = json['author'];
    cat = json['cat'];
    addeddate = json['addeddate'];
    takenby = json['takenby'];
  }
 
}
