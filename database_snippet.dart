import 'dart:async';
import 'package:mysql1/mysql1.dart';

Future main() async {
  
  // database props:
  final settings = ConnectionSettings(
    host: '127.0.0.1',
    port: 3306,
    user: 'your phpmyadmin username',
    password: 'your phpmyadmin password',
    db: 'your database name',
  ); 
  
  // database connection
  final conn = await MySqlConnection.connect(settings);

  //database query to get results
  final results = await conn.query('SELECT * FROM accountinfo');
  
  //print data
  for (var row in results) {
    print(row.fields);
  }
  
  //close connection
  await conn.close();
}


// don't forget to add this dependencies to the pubspec.yml
// mysql1: ^0.20.0