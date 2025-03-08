class Person {
  final int? id;
  final String name;
  final int age;

  Person({this.id, required this.name, required this.age});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'age': age,
      };

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(id: map['id'], name: map['name'], age: map['age']);
  }

  @override
  String toString() => 'Person{id: $id, name: $name, age: $age}';
}
