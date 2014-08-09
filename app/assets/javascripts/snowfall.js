// $(document).ready(function() {
//   var timesRun = 0;
//   slow_snow_fall();
//   fast_snow_fall();
//   var interval = setInterval(function(){
//     timesRun += 1;
//     slow_snow_fall();
//     fast_snow_fall();
//     if(timesRun === 2){
//       clearInterval(interval);
//     }
//   }, 5000);
// });

// function extra_slow_snow_fall() {
//   snowflake_group1();

//   var bodyHeight = $('body').height();
//   var footerOffsetTop = $('.flake').offset().top;
//   var topToBottom = bodyHeight - footerOffsetTop - $('.flake').outerHeight();

//   $(".flake").animate({
//     top : topToBottom,
//   }, 30000);
// }


// function slow_snow_fall() {
//   snowflake_group2();

//   var bodyHeight = $('body').height();
//   var footerOffsetTop = $('.flake').offset().top;
//   var topToBottom = bodyHeight - footerOffsetTop - $('.flake').outerHeight();

//   $(".flake").animate({
//     top : topToBottom,
//   }, 20000);
// }

// function fast_snow_fall() {
//   snowflake_group3();

//   var bodyHeight = $('body').height();
//   var footerOffsetTop = $('.flake').offset().top;
//   var topToBottom = bodyHeight - footerOffsetTop - $('.flake').outerHeight();

//   $(".flake").animate({
//     top : topToBottom,
//   }, 10000);
// }

// function extra_fast_snow_fall() {
//   snowflake_group4();

//   var bodyHeight = $('body').height();
//   var footerOffsetTop = $('.flake').offset().top;
//   var topToBottom = bodyHeight - footerOffsetTop - $('.flake').outerHeight();

//   $(".flake").animate({
//     top : topToBottom,
//   }, 5000);
// }

// function snowflake_group1() {
//   $('.nav').prepend('<img class="flake sm med-opacity" src="assets/full.png" />');
//   $('.present').append('<img class="flake sm half-opacity" src="assets/full.png" />');
//   $('.home-title').append('<img class="flake md half-opacity" src="assets/full.png" />');
//   $('.home-top-row').prepend('<img class="flake lg quarter-opacity" src="assets/full.png" />');
//   $('.navbar').prepend('<img class="flake xs med-opacity" src="assets/full.png" />');
//   $('.navbar .btn').append('<img class="flake xs med-opacity" src="assets/full.png" />');
// }

// function snowflake_group2() {
//   $('.nav').prepend('<img class="flake sm med-opacity" src="assets/full.png" />');
//   $('.present').append('<img class="flake sm half-opacity" src="assets/full.png" />');
//   $('.home-title').append('<img class="flake md half-opacity" src="assets/full.png" />');
//   $('.home-top-row').prepend('<img class="flake lg quarter-opacity" src="assets/full.png" />');
//   $('.navbar').prepend('<img class="flake xs med-opacity" src="assets/full.png" />');
// }

// function snowflake_group3() {
//   $('.nav').prepend('<img class="flake sm med-opacity" src="assets/full.png" />');
//   $('.present').append('<img class="flake sm half-opacity" src="assets/full.png" />');
//   $('.home-title').append('<img class="flake md half-opacity" src="assets/full.png" />');
//   $('.home-top-row').prepend('<img class="flake lg quarter-opacity" src="assets/full.png" />');
//   $('.navbar').prepend('<img class="flake xs med-opacity" src="assets/full.png" />');
// }

// function snowflake_group4() {
//   $('.nav').prepend('<img class="flake sm med-opacity" src="assets/full.png" />');
//   $('.present').append('<img class="flake sm half-opacity" src="assets/full.png" />');
//   $('.home-title').append('<img class="flake md half-opacity" src="assets/full.png" />');
//   $('.home-top-row').prepend('<img class="flake lg quarter-opacity" src="assets/full.png" />');
//   $('.navbar').prepend('<img class="flake xs med-opacity" src="assets/full.png" />');
// }

