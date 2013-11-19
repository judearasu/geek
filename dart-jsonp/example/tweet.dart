library jsonp_sample;

import 'dart:html';
import "package:js/js.dart" as js;
import 'dart:js';

const List<String> FIELDS = const ['tweet', 'word'];

TableElement table = querySelector('#repo-table');

addTableHeadRow() {
  var tr = new TableRowElement();
  for (var field in FIELDS) {
    tr.append(new Element.tag('th')..text = field);
  }
  table.querySelector('thead').append(tr);
}

addTableBodyRow(JsObject repo) {
  var tr = new TableRowElement();
  for (var field in FIELDS) {
    var td = new TableCellElement();
    if (field == 'tweet') {
      td.append(new AnchorElement()
          ..href = repo['tweet']
          ..text = repo[field]);
    } else {
      td.text = repo[field].toString();
    }
    tr.append(td);
  }
  table.querySelector('tbody').append(tr);
}

void main() {
  // Create a jsObject to handle the response.
  context['processData'] = (response) {
    addTableHeadRow();
    for (var repo in response) {
      addTableBodyRow(repo);
    }
  };

  ScriptElement script = new Element.tag("script");
  script.src = "http://localhost:3000/api/tweets.json?callback=processData";
  document.body.children.add(script);
}