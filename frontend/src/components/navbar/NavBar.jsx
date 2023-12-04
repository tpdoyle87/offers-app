import React from 'react';
import { useQueryClient } from 'react-query';
import {Link, useNavigate} from 'react-router-dom';
import AuthManager from '../../helpers/AuthManager';
import {useMutation} from "react-query";
import axios from "axios";
import {toast} from "react-toastify";
import snakecaseKeys from "snakecase-keys";
const NavBar = () => {
    const isAuthenticated = AuthManager.isAuthenticated();
    const navigate = useNavigate();
    const queryClient = useQueryClient();

    const handleSignOut = () => {
        AuthManager.clearTokens(); // Clear authentication tokens
        queryClient.removeQueries('offers');
        navigate('/'); // Navigate back to home page
    };

    return (
        <nav className="bg-gray-800 text-white fixed top-0 left-0 right-0 px-6 h-20 flex justify-between items-center">
            <Link to="/" className="text-lg font-semibold">Offers</Link>
            <div>
                {isAuthenticated ? (
                    <button onClick={handleSignOut} className="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
                        Sign Out
                    </button>
                ) : (
                    <Link to="/signup" className="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                        Sign Up
                    </Link>
                )}
            </div>
        </nav>

    );
};

export default NavBar;
