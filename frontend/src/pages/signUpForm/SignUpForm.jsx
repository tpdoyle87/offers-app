import React, { useState } from 'react';
import { useMutation } from 'react-query';
import axios from 'axios';
import snakecaseKeys from "snakecase-keys";
import { toast } from 'react-toastify';
import { useNavigate } from 'react-router-dom';
import AuthManager from "../../helpers/AuthManager.js";

function SignUpForm() {
  const navigate = useNavigate();
  const [userData, setUserData] = useState({
    username: '',
    firstName: '',
    lastName: '',
    birthdate: '',
    gender: '',
    password: '',
    email: ''
  });

  const handleChange = (e) => {
    setUserData({ ...userData, [e.target.name]: e.target.value });
  };

  // Set up the mutation
  const signUpMutation = useMutation(data => {
      const headers = {
          'Access-Control-Allow-Origin': '*',
      }
    return axios.post('http://localhost:5000/auth', snakecaseKeys(data), { headers });
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    signUpMutation.mutate(userData, {
      onSuccess: (response) => {
        // Handle successful sign up
          AuthManager.setTokens({
              accessToken: response.headers['access-token'],
              client: response.headers['client'],
              uid: response.headers['uid'],
          });
        navigate('/offers');
      },
      onError: (error) => {
        // Handle error
        toast.error(`Error during sign up: ${error.response?.data?.errors?.full_messages[0] || 'Unknown error'}`, {
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
      <div className='container w-1/2 m-auto mt-24'>
          <form onSubmit={handleSubmit} className="bg-gray-200 p-4 rounded-lg space-y-5">
              <div>
                  <label htmlFor="username" className="block text-sm font-medium text-gray-700 text-start">
                      Username
                  </label>
                  <input
                      type="text"
                      id="username"
                      name="username"
                      placeholder="Username"
                      value={userData.username}
                      onChange={handleChange}
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                  />
              </div>
              <div>
                  <label htmlFor="firstName" className="block text-sm font-medium text-gray-700 text-start">
                      First Name
                  </label>
                  <input
                      type="text"
                      id="firstName"
                      name="firstName"
                      placeholder="First Name"
                      value={userData.firstName}
                      onChange={handleChange}
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                  />
              </div>
              <div>
                  <label htmlFor="lastName" className="block text-sm font-medium text-gray-700 text-start">
                      Last Name
                  </label>
                  <input
                      type="text"
                      id="lastName"
                      name="lastName"
                      placeholder="Last Name"
                      value={userData.lastName}
                      onChange={handleChange}
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                  />
              </div>
              <div>
                  <label htmlFor="birthdate" className="block text-sm font-medium text-gray-700 text-start">
                      Birthdate
                  </label>
                  <input
                      type="date"
                      id="birthdate"
                      name="birthdate"
                      value={userData.birthdate}
                      onChange={handleChange}
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                  />
              </div>
              <div>
                  <label htmlFor="gender" className="block text-sm font-medium text-gray-700 text-start">
                      Gender
                  </label>
                  <select
                      id="gender"
                      name="gender"
                      value={userData.gender}
                      onChange={handleChange}
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                  >
                      <option value="" disabled>Select Gender</option>
                      <option value="Male">Male</option>
                      <option value="Female">Female</option>
                      <option value="">Other</option>
                  </select>
              </div>
              <div>
                  <label htmlFor="email" className="block text-sm font-medium text-gray-700 text-start">
                      Email
                  </label>
                  <input
                      type="email"
                      id="email"
                      name="email"
                      placeholder="Email"
                      value={userData.email}
                      onChange={handleChange}
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                  />
              </div>
              <div>
                  <label htmlFor="password" className="block text-sm font-medium text-gray-700 text-start">
                      Password
                  </label>
                  <input
                      type="password"
                      id="password"
                      name="password"
                      placeholder="Password"
                      value={userData.password}
                      onChange={handleChange}
                      className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
                  />
              </div>
              <button type="submit" className="w-full bg-black text-white px-4 py-2 rounded hover:bg-gray-700">
                  Sign Up
              </button>
          </form>
      </div>

  );
}

export default SignUpForm;
