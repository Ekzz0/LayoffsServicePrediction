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


function LineChart({days, probabilities, title}) {
  
  const data = {
    labels: days,
    datasets: [
      {
        label: 'Вероятность увольнения в %',
        data: probabilities,
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
      <h2 className='chart-title'>{title}</h2>
      <div className='chart-container'>
        <Line data={data} options={options} />
      </div>
    </div>
  );
};

export { LineChart }

