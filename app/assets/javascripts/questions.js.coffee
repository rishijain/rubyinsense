# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready -> 
    window.HideOrShow = (ele) ->
        icon = $("#a_"+ele).contents().attr('class')
        $("#q_"+ele).toggle ->
            if icon == "icon-chevron-up"
                $("#a_"+ele).contents().attr("class", 'icon-chevron-down')
                $("#a_"+ele).contents().attr("title", 'Show')
            else
               $("#a_"+ele).contents().attr("class", 'icon-chevron-up');
               $("#a_"+ele).contents().attr("title", 'Hide');
