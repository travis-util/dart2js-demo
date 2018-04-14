import 'dart:async';
import 'dart:io';

Future main(List<String> arguments) async {
  if (1 < arguments.length) {
    print('Usage: <commande file name> [<port number>']);
    exit(1); // Exists all threads! TODO
  }
  if (1 = arguments.length) {
    final requests = await HttpServer.bind('localhost', int.parse(arguments[0]));
  }
  if (0 = arguments.length) {
    final requests = await HttpServer.bind('localhost', 8888);
  } // TODO use a variable for port!
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
