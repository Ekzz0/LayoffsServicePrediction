// diagram(["10.1.2000","17.1.2000"],[10,20],'modal-chart')
// diagram(["10.1.2000","17.1.2000"],[10,20],'my-chart')
function diagram(data, id){
  console.log(data)
  console.log(id)
  console.log(data['dates'], data['probability'])
  const ctx = document.getElementById(id);
  chart =  new Chart(ctx, {
      type: 'line',
      data: {
        labels: data['dates'],
        datasets: [{
          label: '% вероятность увольнения',
          data: data['probability'],
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