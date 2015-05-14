kivaSnapshot.controller('MoneyAvailableController', function($scope, $http) {
  var colors = [ 'RGBA(116, 180, 70, 1)', 'RGBA(125, 56, 131, 1)' ];

  var centsToDollars = function(collection) {
    return collection.map(function(item) {
      item.y = item.y / 100;
      return item;
    })
  };
  $scope.dataSeries = {};

  $http.get('/api/available_vs_loaned.json').success(function(data, status, headers, config) {

    $scope.dataSeries.available = centsToDollars(data['available']);
    $scope.dataSeries.loaned    = centsToDollars(data['loaned']);

    $scope.money_available_config = {
      credits: {
        enabled: false
      },
      colors: colors,
      chart: {
        type: 'spline'
      },
      title: {
        text: 'Money Available vs Loaned'
      },
      xAxis: {
        type: 'datetime'
      },
      yAxis: {
        title: {
          text: '$(USD)'
        },
        labels: {
          formatter: function () {
            return this.value;
          }
        },
        min: 0
      },
      tooltip: {
        crosshairs: true,
        shared: true
      },
      plotOptions: {
        spline: {
          marker: {
            radius: 1,
            lineColor: '#666666',
            lineWidth: 1
          }
        }
      },
      series: [{
        name: 'Available',
        color: colors[1],
        marker: {
          enabled: false
        },
        data: $scope.dataSeries.available
      },
        {
          name: 'Loaned',
          color: colors[0],
          marker: {
            enabled: false
          },
          data: $scope.dataSeries.loaned
        }]
    };
  });

});
