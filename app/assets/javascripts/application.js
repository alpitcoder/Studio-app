
// Load all Boo1tstrap JavaScript
//= require jquery
//= require jquery_ujs
//= require moment
//= require bootstrap-sprockets
//= require bootstrap-datetimepicker


$(function () {
    $('#start_time').datetimepicker(
      {
        format: 'DD-MM-YYYY HH:mm:ss'
      }
    );
    $('#end_time').datetimepicker(
      {
        format: 'DD-MM-YYYY HH:mm:ss'
      }
    );
});
