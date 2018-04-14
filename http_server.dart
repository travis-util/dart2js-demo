import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';

Future main(List<String> arguments) async {
  // final parser = new ArgParser();
  // argResults = parser.parse(arguments);
  // List<String> args = argResults.rest;
  print(arguments.length);
  if (2 < arguments.length) {
    print('Usage: <commande file name> [<port number>]');
    exit(1); // Exists all threads! TODO
  }
  print(arguments);
  print(int.parse(arguments[0]));
  final requests = await HttpServer.bind('localhost', 8888);
  await for (var request in requests) {
    processRequest(request);
  }
}

void processRequest(HttpRequest request) {
  print('Got request for ${request.uri.path}');
  final response = request.response;
  if (request.uri.path == '/dart') {
    response
      ..headers.contentType = new ContentType(
        'text',
        'plain',
      )
      ..write('Hello from the server');
  } else {
    response.statusCode = HttpStatus.NOT_FOUND;
  }
  response.close();
}

// From https://www.dartlang.org/dart-vm/io-library-tour
