import 'dart:io';
import 'db_connect.dart';
import 'person_repo.dart';
import 'person_model.dart';

Future<void> main() async {
  final databaseHelper = DatabaseHelper();
  await databaseHelper.initDatabase();
  final personRepository = PersonRepo();

  while (true) {
    print('\n=== MENU ===');
    print('1. Add Person');
    print('2. View People');
    print('3. Update Person');
    print('4. Delete Person');
    print('5. Exit');
    stdout.write('Select option: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter name: ');
        final name = stdin.readLineSync()!;
        stdout.write('Enter age: ');
        final age = int.parse(stdin.readLineSync()!);
        final person = Person(name: name, age: age);
        await personRepository.insertPerson(person);
        break;

      case '2':
        final persons = personRepository.getAllPersons();
        for (var person in persons) {
          print(person);
        }
        break;

      case '3':
        stdout.write('Enter id to update: ');
        final id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new name: ');
        final newName = stdin.readLineSync()!;
        stdout.write('Enter new age: ');
        final newAge = int.parse(stdin.readLineSync()!);
        final updatedPerson = Person(id: id, name: newName, age: newAge);
        await personRepository.updatePerson(updatedPerson);
        break;

      case '4':
        stdout.write('Enter id to delete: ');
        final id = int.parse(stdin.readLineSync()!);
        await personRepository.deletePerson(id);
        break;

      case '5':
        databaseHelper.closeDatabase();
        print('Goodbye!');
        exit(0);

      default:
        print('Invalid choice! Try again.');
    }
  }
}
