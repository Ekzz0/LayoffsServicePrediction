function diagram(dates, probability){
  const ctx = document.getElementById('myChart');
  const dates = dates;
  const probability = probability;

  chart =  new Chart(ctx, {
      type: 'line',
      data: {
        labels: dates,
        datasets: [{
          label: '% вероятность увольнения',
          data: probability,
          borderColor: '#36A2EB',
          backgroundColor: '#9BD0F5',
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: false
          }
        }
      }
  });
}