// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require modal
//= require_tree .
$(function() {
    $("#main-photo .absolute-1").hide();
    $("#main-h1").animate({left : "+=1400px"},1200, "linear", function(){
      $("#main-photo .absolute-1").fadeIn(700);
    });

    $("#btn-donate").bind("click", function(e){
        console.log("SEM Vamos!");
        e.preventDefault();
        $("#donate-slides").toggleClass("hidden");
        var offset = $("#donate-slides").offset();
        offset.left -= 20;
        offset.top -= 20;
        $('html, body').animate({
            scrollTop: offset.top,
            scrollLeft: offset.left
        });

        $(function() {
            $( "#slider-range-max" ).slider({
              range: "max",
              min: 1,
              max: 10,
              value: 2,
              slide: function( event, ui ) {
                $( "#amount" ).val( ui.value );
              }
            });
            $( "#amount" ).val( $( "#slider-range-max" ).slider( "value" ) );
        });
    });
});
