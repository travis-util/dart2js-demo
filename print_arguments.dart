// import 'dart:io'; // stdout

main(List<String> arguments) {
  print(arguments);
  // stdout.writeln('$arguments...(stdout)'); // node: Unsupported operation: StdIOUtils._getStdioOutputStream
  // https://www.dartlang.org/tutorials/dart-vm/cmdline#stdout
  // However, you must use print() instead of stdout for programs that are converted to and run in JavaScript.
}
