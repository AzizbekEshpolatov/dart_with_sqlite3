import 'db_connect.dart';
import 'person_model.dart';

class PersonRepo {
  final db = DatabaseHelper().database;

  // malumotlar bazasidan malumotlarni olish.
  List<Person> getAllPersons() {
    final result = db.select('SELECT * FROM peoples');
    return result.map((row) => Person.fromMap(row)).toList();
  }

  // yangi person qoshish method.
  Future<void> insertPerson(Person person) async {
    db.execute(
      'INSERT INTO peoples (name,age) VALUES (?, ?)',
      [person.name, person.age],
    );
    print('Person qoshildi: $person');
  }

  // person malumotlarini update qilish
  Future<void> updatePerson(Person person) async {
    db.execute(
      'UPDATE peoples SET name = ?, age = ? WHERE id = ?',
      [person.name, person.age, person.id],
    );
    print("Person yangilandi : $person");
  }

  // bazadan ochirish..
  Future<void> deletePerson(int id) async {
    db.execute(
      'DELETE FROM peoples WHERE id = ?',
      [id],
    );
    print("Person o'chirildi, ID : $id");
  }
}
