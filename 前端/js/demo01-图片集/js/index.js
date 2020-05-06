
function showPic(pic){
  console.log(pic);
  
  var source = pic.getAttribute("href")
  var placeholder = document.getElementById("placeholder")
  placeholder.setAttribute("src", source)
  var description = document.getElementById("description")
  var title = pic.getAttribute("title")
  description.firstChild.nodeValue = title
}

