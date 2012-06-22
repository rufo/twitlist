# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#users li").draggable
    revert: "invalid"
    cursor: "move"
    helper: "clone"

  $("#lists ul ul").droppable
    accept: "#users li"
    drop: (event, ui) ->
      $ul = $(this)
      user_id = ui.draggable.data("user-id")
      list_id = $ul.data('list-id')

      unless $(this).find("[data-user-id=#{user_id}]").length > 0
        $.ajax "/lists/#{list_id}/members",
          type: "POST"
          dataType: "json"
          data:
            id: user_id
          success: ->
            $ul.append(ui.draggable.clone())
