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
        <div className="w-1/2 m-auto container mt-24">
            <form onSubmit={handleSubmit} className="bg-gray-200 p-4 rounded-lg space-y-5 w-1/2 m-auto">
                <div className="flex flex-col">
                    <label htmlFor="username" className="block text-sm font-medium text-gray-700 mr-4 text-start">
                        Username:
                    </label>
                    <input
                        type="text"
                        id="username"
                        value={username}
                        onChange={(e) => setUsername(e.target.value)}
                        placeholder="Username"
                        className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    />
                </div>
                <div className="flex flex-col">
                    <label htmlFor="password" className="block text-sm font-medium text-gray-700 mr-4 text-start">
                        Password:
                    </label>
                    <input
                        type="password"
                        id="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        placeholder="Password"
                        className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                    />
                </div>
                <button type="submit" className="w-full bg-black text-white px-4 py-2 rounded hover:bg-gray-700">
                    Sign In
                </button>
                <button type="button" onClick={() => { setUsername(''); setPassword(''); }} className="w-full bg-black text-white px-4 py-2 rounded hover:bg-gray-700">
                    Clear
                </button>
            </form>
        </div>

    );
}

export default SignInForm;