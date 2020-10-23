import React from 'react';

declare global {
  interface Window {
    API_URL: string;
  }
}

const apiUrl = window.API_URL

function App() {
  return (
    <div>
      <p>ApiUrl: {apiUrl}</p>
    </div>
  );
}

export default App;
