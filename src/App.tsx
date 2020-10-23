import React from 'react';

declare global {
  interface Window {
    STRIPE_PUBLISHABLE_KEY: string;
  }
}

const stripeKey = window.STRIPE_PUBLISHABLE_KEY

function App() {
  return (
    <div>
      <p>StripeKey: {stripeKey}</p>
    </div>
  );
}

export default App;
