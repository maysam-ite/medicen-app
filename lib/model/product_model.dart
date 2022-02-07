class Product_details {
  final String pname;
  final String price;
  final String expiration;
  final String madname;
  final String quantity;
  final String category;
  final String contactInfo;
         var id;
         var user_id;
         var comment_count;
         var view_count;
         var like_count;

  factory Product_details.map(Map<String, dynamic> m, {String }) {
    return Product_details(
        contactInfo: m['contact_info'] ?? 'null',
        pname: m['imgUrl'] ?? 'null',
        madname: m['name'] ?? 'null',
        quantity: m['uantity_Available'] ?? 'null',
        price: m['price'] ?? 'null',
        id: m['id'] ?? 'null',
        user_id: m['user_id'] ?? 'null',
        comment_count: m['comment_count'] ?? 'null',
        view_count: m['view_count'] ?? 'null',
        like_count: m['like_count'] ?? 'null',
        category: m['category'] ?? 'null',
        expiration: m['expiration'] ?? 'null',
        );
  }

  Product_details(
      {required this.pname,
      required this.price,
      required this.expiration,
      required this.madname,
      required this.quantity,
      required this.category,
      required this.contactInfo,
      required this.user_id,
      required this.id,
      required this.comment_count,
      required this.view_count,
      required this.like_count
      
      });
}
