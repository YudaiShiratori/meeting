// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require moment 
//= require fullcalendar
//= require fullcalendar/locale-all
//= require_tree .


$(document).ready(function() {
  $('#calendar').fullCalendar({
        header:{
            left:'prev,next,today',
            center:'title',
            right:'month agendaWeek agendaDay'
        },
        buttonText: {
            month:'月',
            week: '週',
            day:'日'
        },
        selectable: true,
        dayClick: function(date) {
          alert('clicked ' + date.format());
        },
        select: function(startDate, endDate) {
          alert('selected ' + startDate.format() + ' to ' + endDate.format());
        }
  });
});

// $(document).ready(function() {

//     create_schedule = function(title, start, end){
//       $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
//         var token;
//         if (!options.crossDomain) {
//           token = $('meta[name="csrf-token"]').attr('content');
//           if (token) {
//             return jqXHR.setRequestHeader('X-CSRF-Token', token);
//           }
//         }
//       });
//       $.ajax({
//         type: "post",
//         url: "/schedules/create",
//         data: {
//           title: title,
//           start: start.toISOString(),
//           end: end.toISOString()
//         }
//       }).done(function(data){
//         alert("登録しました!");
//       }).fail(function(data){
//         alert("登録できませんでした。");
//       });
//     };

//     $('#calendar').fullCalendar({
//       header: {
//         left: 'prev,next today',
//         center: 'title',
//         right: 'month,agendaWeek,agendaDay'
//       },
//       navLinks: true,
//       selectable: true,
//       selectHelper: true,
//       select: function(start, end) {
//         var title = prompt('イベントを追加');
//         var scheduleData;
//         if (title) {
//           scheduleData = {
//             title: title,
//             start: start,
//             end: end
//           };
//           $('#calendar').fullCalendar('renderschedule', scheduleData, true);
//           $('#calendar').fullCalendar('unselect');
//           create_schedule(title, start, end);
//         }
//       },
//       timezone: 'UTC',
//       schedules: '/schedules.json',
//       editable: true
//     });

// });

