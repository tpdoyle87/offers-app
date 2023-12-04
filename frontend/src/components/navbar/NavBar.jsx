import React from 'react';
import {Link, useNavigate} from 'react-router-dom';
import AuthManager from '../../helpers/AuthManager'; // Adjust this path as needed
import './NavBar.css';
const NavBar = () => {
    const isAuthenticated = AuthManager.isAuthenticated(); // Implement this based on your auth logic

    const handleSignOut = () => {
        AuthManager.clearTokens(); // Clear authentication tokens
        useNavigate('/')
    };

    return (
        <nav>
            <Link to="/offers">Offers</Link>
            <div style={{ float: 'right' }}>
                {isAuthenticated ? (
                    <button onClick={handleSignOut}>Sign Out</button>
                ) : (
                    <Link to="/signup">Sign Up</Link>
                )}
            </div>
        </nav>
    );
};

export default NavBar;
