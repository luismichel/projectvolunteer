jQuery(function() {
  $("#btn-donate").bind("click", function(e){
    e.preventDefault();
    $("#dialog-form").dialog("open");
  });
});

jQuery(function() {
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
            console.log("Pos aca cerrando mas que nada");
        }
    });
});
