$(function () {
  var activityChart = $('#activity-chart');
  var months = activityChart.data().months;
  var sessions = activityChart.data().sessions;
  activityChart.highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: 'Activity'
    },
    xAxis: {
      categories: months
    },
    yAxis: {
      title: {
        text: 'Sessions'
      }
    },
    series: [{
      name: 'Entries per month',
      data: sessions
    }]
  });
});
