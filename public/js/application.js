$(document).ready(function(){

  $("#new-groups-link").click(function(){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
      $target.removeAttr('href');
      $target.parent().append(response)
    });
  })

  $("#past-groups-link").click(function(){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
      $target.removeAttr('href');
      $target.parent().append(response)
    });
  })

  $("ul").on("click", ".group-by-cohort", function(event){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
      $target.removeAttr('href');
      $target.parent().append(response)
    });
  });

  $("ul").on("click", ".group-by-date", function(){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
      $target.removeAttr('href');
      $target.parent().append(response)
    });
  })

  $("ul").on("click", ".group-list .edit-link", function(){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
      $target.removeAttr('href');
      $target.first('.student-list').replaceWith(response)
    });
  })

  $("ul").on("submit", ".group-list .remove-student-form", function(){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('action'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
      $target.replaceWith(response)
    });
  })


});