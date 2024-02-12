// import { Chart } from 'chart.js';
// import { Line } from 'react-chartjs-2';
// import { LinearScale, CategoryScale, PointElement, LineElement } from 'chart.js';


import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import { Line } from 'react-chartjs-2';


ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);


function LineChart() {
  const data = {
    labels: ['10.1.2000', '11.1.2000','12.1.2000','13.1.2000'],
    datasets: [
      {
        label: 'Вероятность увольнения в %',
        data: [65, 59, 80, 81],
        fill: false,
        borderColor: '#F4C430',
        tension: 0.1
      }
    ]
  };

  const options = {
    scales: {
      x: {
        type: 'category',
      },
      y: {
        type: 'linear',
      },
    },
  };
  
  return (
    <div className='chart'>
      <h2 className='chart-title'>Общая вероятность увольнения</h2>
      <div className='chart-container'>
        <Line data={data} options={options} />
      </div>
    </div>
  );
};

export { LineChart }

