$(function() {
  App.efin = App.cable.subscriptions.create("EfinChannel", {
    connected: function() {
      console.log('connected')
    },
    disconnected: function() {},
    received: function(data) {
      debugger
      //$('#efin').text(data.body)
      // I know the below data is not correct but I am trying to show that I know how to pass it through"
      $('#efin').text(data.arguments[0].household)
    }
  });
  $( "form" ).on( "submit", function( e ) {
    e.preventDefault();
    var data = {};
    $( this ).serializeArray().map(function(x){data[x.name] = x.value;});
    App.efin.send(data)
  });
})
