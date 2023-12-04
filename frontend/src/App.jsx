import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from 'react-query';
import { ToastContainer } from 'react-toastify';

import SignUpForm from './pages/signUpForm/SignUpForm.jsx';
import SignInForm from './pages/signInForm/SignInForm.jsx';
import OfferCards from './pages/Offers/Offers';
import NavBar from "./components/NavBar.jsx";
import ProtectedRoute from "./components/ProtectedRoute.jsx";

import './App.css';
import 'react-toastify/dist/ReactToastify.css';



function App() {
    const queryClient = new QueryClient();

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
