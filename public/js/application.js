$(document).ready(function(){
  $("#new-groups-link").click(function(){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
      $target.parent().append(response)
    });
  })

  $(".group-by-cohort").click(function(event){
    event.preventDefault();

    $target = $(event.target);

    $.ajax({
      url: $target.attr('href'),
      method: 'GET',
      data: $target.serialize()
    }).done(function(response){
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
      $target.parent().append(response)
    });
  })
});