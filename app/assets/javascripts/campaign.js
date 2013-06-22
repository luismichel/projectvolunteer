$(function() {
  $("#btn-donate").bind("click", function(e){
    e.preventDefault();
    $("#dialog-form").dialog("open");
  });
});

$(function() {
    $("#dialog-form").dialog({
        autoOpen: false,
        height: 500,
        width: 500,
        modal: true,
        buttons:{
            "Donate":function(){
                console.log("Pos aca donando verdad");
            }
        },
        Cancel: function(){
            $( this ).dialog( "close" )
        },
        close: function(){
        }
    });
});

$(function() {
    var roundDecimal = function( number ){
        return Math.round( number * 100 ) / 100;
    };
    var updateSliders = function(toBeUpdatedSelector, updatedValue){
        //var updatedValue = parseFloat($(updatedSelector).slider("value"), 10);
        updatedValue = updatedValue || 0.0;
        var newValue = (100.00 - updatedValue);
        $( toBeUpdatedSelector ).slider( "value" , newValue);
    };

    var updateAmounts = function( from, updatedValue){
        from = from || "";
        updatedValue = updatedValue || 0.0;
        var donationValue = parseFloat($("#amount").val(), 10);
        var campaignValue = parseFloat($("#slider-range-campaign").slider("value"), 10);
        var volunteerValue = parseFloat($("#slider-range-volunteer").slider("value"), 10);
        if (from === "from-campaign") {
            campaignValue = updatedValue;
            volunteerValue = 100.00 - updatedValue;
        }else if (from == "from-volunteer") {
            campaignValue = 100.00 - updatedValue;
            volunteerValue = updatedValue;
        }else{
            campaignValue = parseFloat($("#slider-range-campaign").slider("value"), 10);
            volunteerValue = parseFloat($("#slider-range-volunteer").slider("value"), 10);
        }
        $("#amount-campaign").html( roundDecimal(donationValue*(campaignValue/100.00)) );
        $("#amount-volunteer").html( roundDecimal(donationValue*(volunteerValue/100.00)) );
    };

    $("#amount").bind("change_campaign", function(){
        updateSliders("#slider-range-campaign", "#slider-range-volunteer");
        updateAmounts();
    });

    $("#amount").bind("change_volunteer", function(){
        updateSliders("#slider-range-volunteer", "#slider-range-campaign");
        updateAmounts();
    });

    $( "#slider-range-campaign" ).slider({
      range: "min",
      value: 95,
      min: 0,
      max: 100,
      slide: function( event, ui ) {
        //$("#amount").trigger("change_campaign");
        updateSliders("#slider-range-volunteer", ui.value);
        updateAmounts("from-campaign", ui.value);
      }
    });

    $( "#slider-range-volunteer").slider({
      range: "min",
      value: 5,
      min: 0,
      max: 100,
      slide: function( event, ui ) {
        //$("#amount").trigger("change_volunteer");
        updateSliders("#slider-range-campaign" , ui.value);
        updateAmounts("from-volunteer", ui.value);
      }
    });

    $( "#amount" ).val( 25.00 );
    updateAmounts();
  });
