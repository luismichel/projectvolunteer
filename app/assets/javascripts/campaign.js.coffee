# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
    $("#btn-donate").bind 'click', (e) ->
        e.preventDefault()
        $( "#dialog-form" ).dialog( "open" )

jQuery ->
    $("#dialog-form").dialog
        autoOpen: false
        height: 500
        width: 500
        modal: true
        buttons:
            "Donate" : () ->
                console.log "Pos aca donando mas que nada"
        Cancel: () ->
            $( this ).dialog( "close" )
        close: ()->
                console.log "Pos aca cerrando mas que nada"

