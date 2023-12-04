// AuthManager.js
import axios from 'axios';

class AuthManager {

    static isAuthenticated = () => {
        const token = localStorage.getItem('accessToken');
        return !!token; // returns true if token exists, false otherwise
    };
    static setTokens(tokens) {
        localStorage.setItem('accessToken', tokens.accessToken);
        localStorage.setItem('client', tokens.client);
        localStorage.setItem('uid', tokens.uid);

        axios.defaults.headers.common['access-token'] = tokens.accessToken;
        axios.defaults.headers.common['client'] = tokens.client;
        axios.defaults.headers.common['uid'] = tokens.uid;
    }

    static getTokens() {
        return {
            accessToken: localStorage.getItem('accessToken'),
            client: localStorage.getItem('client'),
            uid: localStorage.getItem('uid')
        };
    }

    static clearTokens() {
        localStorage.removeItem('accessToken');
        localStorage.removeItem('client');
        localStorage.removeItem('uid');

        axios.defaults.headers.common['access-token'] = null;
        axios.defaults.headers.common['client'] = null;
        axios.defaults.headers.common['uid'] = null;
    }
}

export default AuthManager;
