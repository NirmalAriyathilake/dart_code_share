import 'package:dart_frog/dart_frog.dart';
import 'package:db/db.dart' as db;
import 'package:shared/shared.dart' as shared;
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  final db = context.read<Database>();

  final user = await db.users.queryUser(1);

  if (user == null) {
    return Response(body: 'Not Found', statusCode: 404);
  }

  final sharedUser = shared.User.fromDb(user);

  return Response.json(
    body: sharedUser.toJson(),
  );
}
