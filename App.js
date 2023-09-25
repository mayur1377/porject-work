import React, { Component } from 'react';
import './App.css';
import CanvasJSReact from './canvasjs.react';
import data from './data.json'; // Import data from data.json

const CanvasJSChart = CanvasJSReact.CanvasJSChart;

class App extends Component {
  constructor() {
    super();
    this.state = {
      scatterDataPoints: [],
      circleData: {},
    };
  }

  componentDidMount() {
    // Assign the scatter data and circle data from data.json to the state
    this.setState({
      scatterDataPoints: data.scatterData.dataPoints,
      circleData: data.circleData,
    });
  }

  render() {
    const options = {
      title: {
        text: 'BEEP BOOP',
      },
      data: [
        {
          type: 'scatter',
          markerColor: 'black',
          dataPoints: this.state.scatterDataPoints,
        },
        {
          type: 'scatter',
          markerType: 'circle', // Set marker type to 'circle'
          markerSize: 0, // Set marker size to 0 to hide the circle fill
          lineColor: 'red', // Set line color to the desired border color
          lineThickness: 2, // Set line thickness to control the border width
          toolTipContent: null, // Remove tooltip for the circle
          dataPoints: [
            {
              x: this.state.circleData.x,
              y: this.state.circleData.y,
              markerSize: this.state.circleData.radius * 200, // Adjust the marker size based on the radius
            },
          ],
        },
      ],
    };

    return (
      <div className="App">
        <h1>CanvasJS Scatter Plot</h1>
        <CanvasJSChart options={options} />
      </div>
    );
  }
}

export default App;
