import { useState, useEffect } from 'react';
import { BrowserRouter as Router, Routes, Route, useNavigate } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from 'react-query';
import { ToastContainer } from 'react-toastify';

import SignUpForm from './pages/signUpForm/SignUpForm.jsx';
import SignInForm from './pages/signInForm/SignInForm.jsx';
import OfferCards from './pages/Offers/Offers';
import NavBar from "./components/NavBar.jsx";
import ProtectedRoute from "./components/ProtectedRoute.jsx";

import './App.css';
import 'react-toastify/dist/ReactToastify.css';


function Offers() {
    const navigate = useNavigate();
    const [isLoggedIn, setIsLoggedIn] = useState(true); // Set to true for demonstration

    useEffect(() => {
        if (!isLoggedIn) {
            navigate('/'); // Redirect to sign-in if not logged in
        }
    }, [isLoggedIn, navigate]);

    const handleSignOut = () => {
        setIsLoggedIn(false); // Update the logged-in state to false
        navigate('/signin'); // Navigate back to the sign-in page
    }

    return isLoggedIn ? (
        <div>
            <h2>Offers Page</h2>
            <button onClick={handleSignOut}>Sign Out</button>
        </div>
    ) : null;
}

const queryClient = new QueryClient();
function App() {
    return (
        <>
            <ToastContainer />
            <QueryClientProvider client={queryClient}>
                <Router>
                    <NavBar />
                    <Routes>
                        <Route path="/offers" element={<ProtectedRoute component={OfferCards}/>} />
                        <Route path="/" element={<SignInForm />} />
                        <Route path="/signout" element={<h2>Sign Out</h2>} />
                        <Route path="/signup" element={<SignUpForm />} />
                    </Routes>
                </Router>
            </QueryClientProvider>
        </>

    );
}

export default App;
