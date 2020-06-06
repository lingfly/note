var html = document.getElementsByTagName("html")[0]
console.log(html);

console.log(html.nodeType == Node.ELEMENT_NODE);
console.log(html.nodeType == Node.DOCUMENT_NODE);

console.log("name: "+html.nodeName+", type: "+html.nodeType+", value: "+html.nodeValue);

var nlist = html.childNodes;
console.log(nlist);
console.log(html.parentNode);
console.log(html.ownerDocument);
console.log(html.parentNode.nodeType);

 