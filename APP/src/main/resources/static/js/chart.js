diagram(["10.1.2000","17.1.2000"],[10,20],'modal-chart')//тест
diagram(["10.1.2000","17.1.2000"],[10,20],'my-chart')
function diagram(dates, probability, id){
  console.log(id)
  
  const ctx = document.getElementById(id);
  chart =  new Chart(ctx, {
      type: 'line',
      data: {
        labels: dates,
        datasets: [{
          label: '% вероятность увольнения',
          data: probability,
          borderColor: '#403F3D',
          backgroundColor: '#f4c430',
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