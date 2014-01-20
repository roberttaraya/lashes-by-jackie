var counter = 0

// this code works if you want to click through the carousel. must first uncomment button code in index.html
// $("button").on("click", function(){
//   counter++
//   console.log(counter)
//   $(".filmstrip").css("left", "-" + counter*500 + "px")
//   if (counter === 3){
//     counter = -1
//   }
// })

// this code changes automatically every 2 seconds
var autoCarousel = setInterval(function(){
  counter++
  $(".filmstrip").css("left", "-" + counter*970 + "px")
  if (counter === 2){
    counter = -1
  }
}, 8000)