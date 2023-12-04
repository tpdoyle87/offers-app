// src/api/axiosInstance.js
import axios from 'axios';
import AuthManager from '../helpers/AuthManager';
import {useNavigate} from "react-router-dom"; // Adjust the path as needed

const axiosInstance = axios.create({
    baseURL: 'http://localhost:5000/api'
});

axiosInstance.interceptors.response.use(
    response => response,
    error => {
        if (error.response && error.response.status === 401) {
            AuthManager.clearTokens(); // Adjust as per your auth logic
            useNavigate('/'); // Redirect to sign-in or home
        }
        return Promise.reject(error);
    }
);

export default axiosInstance;
