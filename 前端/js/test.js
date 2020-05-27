if(true){
  var color = "blue";
}
console.log(color);

var obj = new Object();
obj.a=1;
with(obj){
  a=2;
  var b=2;
}
