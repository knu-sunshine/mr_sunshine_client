// Create storage
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();

void saveSession(String session) async {
  await storage.write(key: "session", value: session);
}

Future<String?> getSession() async {
  var session = await storage.read(key: "session");
  if (session == null) {
    return null;
  }
  return session;
}
