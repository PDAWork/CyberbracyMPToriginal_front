import 'package:html/parser.dart';

enum SpawnedWidgetElement {
  simpleText,
  newLine,
  coloredText,
}

abstract final class HtmlMessageParse {
  static List<(String?, SpawnedWidgetElement)> parseMessage(String data) {
    try {
      final List<(String?, SpawnedWidgetElement)> widgets = [];

      var document = parse(data);
      var asd = document.children.first.children[1].children;
      var div = asd.first;

      // for (var i = 0; i < div.children.length; i++) {
      var nodes = div.nodes;
      for (var node in nodes) {
        if (node.nodeType == 1) {
          var name = node.toString();
          if (name.contains('p')) {
            widgets.add(
              (node.text ?? 'error', SpawnedWidgetElement.coloredText),
            );
          }
          if (name.contains('br')) {
            widgets.add(
              (null, SpawnedWidgetElement.newLine),
            );
          }
        } else if (node.nodeType == 3) {
          widgets.add(
            (node.text ?? 'error', SpawnedWidgetElement.simpleText),
          );
        }
      }
      // }

      return widgets;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
