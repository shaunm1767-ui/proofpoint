import React from "react";

export default function App() {
  const ping = async () => {
    try {
      const res = await fetch("http://localhost:3000/health");
      const data = await res.json();
      alert("Backend response: " + JSON.stringify(data));
    } catch (err) {
      alert("Fetch error: " + err.message);
    }
  };

  return (
    <div style={{ fontFamily: "Segoe UI, Arial", padding: 20 }}>
      <h1>ProofPoint Frontend (dev)</h1>
      <p>
        Click the button to ping backend <code>/health</code>
      </p>
      <button onClick={ping} style={{ padding: "8px 14px" }}>
        Ping Backend
      </button>
    </div>
  );
}
