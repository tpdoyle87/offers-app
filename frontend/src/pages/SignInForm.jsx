import {useState} from "react";
import { useMutation } from 'react-query';
import axios from 'axios';
import {useNavigate} from "react-router-dom";
import {toast} from "react-toastify";
import AuthManager from "../helpers/AuthManager.js";

function SignInForm() {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();
    const signInMutation = useMutation(({ username, password }) => {
        const headers = {
            'Access-Control-Allow-Origin': '*',
        }
        return axios.post('http://localhost:5000/auth/sign_in', { username, password }, {headers});
    });
    const handleSubmit = (event) => {
        event.preventDefault();
        signInMutation.mutate({ username, password }, {
            onSuccess: (response) => {

                 AuthManager.setTokens({
                    accessToken: response.headers['access-token'],
                    client: response.headers['client'],
                    uid: response.headers['uid']
                });
                console.log('User signed in:', response.data);
                navigate('/offers'); // Pass the data back up if needed
            },
            onError: (error) => {
                // Handle error
                console.error('Error during sign in:', error);
                toast.error(`Error during sign up: ${error.response?.data?.error_description[0] || 'Unknown error'}`, {
                    position: "top-center",
                    autoClose: 3000,
                    hideProgressBar: false,
                    closeOnClick: true,
                    pauseOnHover: true,
                    draggable: true,
                    progress: undefined,
                });
            }
        });
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

export default SignInForm;