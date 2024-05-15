class ProductsResponse {
    final int id;
    final String title;
    final double price;
    final String description;
    final String category;
    final String image;
    final Rating rating;

    ProductsResponse({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": categoryValues.reverse,
        "image": image,
        "rating": rating.toJson(),
    };
}

enum Category {
    electronics,
    jewelery,
    menClothing,
    womenClothing
}

 final categoryValues = EnumValues({
    "electronics": Category.electronics,
    "jewelery": Category.jewelery,
    "men's clothing": Category.menClothing,
    "women's clothing": Category.womenClothing
});

class Rating {
    final double rate;
    final int count;

    Rating({
        required this.rate,
        required this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
