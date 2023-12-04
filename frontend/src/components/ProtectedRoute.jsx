import React from 'react';
import {Navigate, useNavigate} from 'react-router-dom';
import AuthManager from '../helpers/AuthManager';

const ProtectedRoute = ({ component: Component }) => {
    const isAuthenticated = AuthManager.isAuthenticated();
    console.log(isAuthenticated)
    const navigate = useNavigate()

    return isAuthenticated ? <Component /> : <Navigate to="/" /> ;
};

export default ProtectedRoute;