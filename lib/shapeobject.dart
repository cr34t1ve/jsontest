// class Shape {
//   String shapeName;
//   Property property;

//   Shape({required this.shapeName, required this.property});

//   factory Shape.fromJson(Map<String, dynamic> parsedJson) {
//     return Shape(
//         shapeName: parsedJson['shape_name'],
//         property: Property.fromJson(parsedJson['property']));
//   }
// }

// class Property {
//   double width;
//   double breadth;
//   Units units;

//   Property({
//     required this.width,
//     required this.breadth,
//     required this.units,
//   });

//   //inherited class and constructor take parsedJson since they
//   //have to parse the inherited data model
//   factory Property.fromJson(Map<String, dynamic> parsedJson) {
//     return Property(
//         width: parsedJson['width'],
//         breadth: parsedJson['breadth'],
//         units: Units.fromJson(parsedJson['units']));
//   }
// }

// class Units {
//   double centimeters;
//   double meters;

//   Units({required this.centimeters, required this.meters});

//   //root factory class and constructor takes the 'json' keyword
//   factory Units.fromJson(Map<String, dynamic> json) {
//     return Units(centimeters: json['centimeters'], meters: json['meters']);
//   }
// }

class Shape {
  String name;
  double width;
  double breadth;

  Shape({required this.name, required this.width, required this.breadth});

  factory Shape.fromJson(Map<String, dynamic> json) {
    return Shape(
        name: json['shape_name'],
        width: json['property']['width'],
        breadth: json['property']['breadth']);
  }
}
