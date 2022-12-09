import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context) async {
  final user = User(id: 'asdf', email: 'some@user.com');

  final connection = context.read<PostgreSQLConnection>();

  await connection.open();

  final result = await connection.query('SELECT NOW()');

  print(result);

  return Response(
      body:
          'Welcome to Dart Frog! ${user.email}. The current time is ${result[0][0]}');
}
