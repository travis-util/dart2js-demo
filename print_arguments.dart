import 'dart:io'; // stdout

main(List<String> arguments) {
  print(arguments);
  stdout.writeln('$arguments...(stdout)');
}
