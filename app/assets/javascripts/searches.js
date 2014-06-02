window.loadSearches = function() {

// glossing over this today, we'll talk more about it next week

$.ajax({
  type: 'GET',
  url: 'http://localhost:3000/searches.json',
  dataType: 'json'
}).done(function(data) {

  // grab the template we're going to use

  var source = $("#searches-template").html();


  // compile it with Handlebars

  var template = Handlebars.compile(source);

  // displays compiled template with our comic books filled in

  $('#searches-destination').html(template(data));

})

};