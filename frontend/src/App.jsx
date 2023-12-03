import { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, useNavigate } from 'react-router-dom';
import reactLogo from './assets/react.svg';
import viteLogo from '/vite.svg';
import './App.css';

function Offers() {
    const navigate = useNavigate();
    const [isLoggedIn, setIsLoggedIn] = useState(false); // Assuming you're tracking logged-in status

    useEffect(() => {
        if (!isLoggedIn) {
            navigate('/signin'); // Redirect to sign-in if not logged in
        }
    }, [isLoggedIn, navigate]);

    return isLoggedIn ? <h2>Offers Page</h2> : null;
}

function SignIn({ onSignIn }) {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');

    const handleSubmit = (event) => {
        event.preventDefault();
        onSignIn(username, password);
    };

    return (
        <form onSubmit={handleSubmit}>
            <input
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                placeholder="Username"
            />
            <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                placeholder="Password"
            />
            <button type="submit">Sign In</button>
            <button type="button" onClick={() => { setUsername(''); setPassword(''); }}>Clear</button>
        </form>
    );
}

function App() {
    const [isLoggedIn, setIsLoggedIn] = useState(false);
    const [count, setCount] = useState(0)
    const handleSignIn = (username, password) => {
        // Implement your sign-in logic here
        setIsLoggedIn(true);
    };

    return (
        <Router>
            <Routes>
                <Route path="/offers" element={<Offers />} />
                <Route path="/signin" element={<SignIn onSignIn={handleSignIn} />} />
                <Route path="/" element={
                    <>
                        <div>
                            <a href="https://vitejs.dev" target="_blank">
                                <img src={viteLogo} className="logo" alt="Vite logo" />
                            </a>
                            <a href="https://react.dev" target="_blank">
                                <img src={reactLogo} className="logo react" alt="React logo" />
                            </a>
                        </div>
                        <h1>Vite + React</h1>
                        <div className="card">
                            <button onClick={() => setCount((count) => count + 1)}>
                                count is {count}
                            </button>
                            <p>
                                Edit <code>src/App.jsx</code> and save to test HMR
                            </p>
                        </div>
                        <p className="read-the-docs">
                            Click on the Vite and React logos to learn more
                        </p>
                    </>
                } />
            </Routes>
        </Router>
    );
}

export default App;
