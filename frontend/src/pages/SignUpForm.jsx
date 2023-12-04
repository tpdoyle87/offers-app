import React, { useState } from 'react';
import { useMutation } from 'react-query';
import axios from 'axios';
import snakecaseKeys from "snakecase-keys";
import { toast } from 'react-toastify';
import { useNavigate } from 'react-router-dom';
import AuthManager from "../helpers/AuthManager.js";

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
    return axios.post('http://localhost:5000/auth', snakecaseKeys(data), {headers});
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
        console.error('Error during sign up:', error);
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
            name="username"
            placeholder="Username"
            value={userData.username}
            onChange={handleChange}
        />
        <input
            type="text"
            name="firstName"
            placeholder="First Name"
            value={userData.firstName}
            onChange={handleChange}
        />
        <input
            type="text"
            name="lastName"
            placeholder="Last Name"
            value={userData.lastName}
            onChange={handleChange}
        />
        <input
            type="date"
            name="birthdate"
            value={userData.birthdate}
            onChange={handleChange}
        />
        <select name="gender" value={userData.gender} onChange={handleChange}>
          <option value="" disabled>Select Gender</option>
          <option value="male">Male</option>
          <option value="female">Female</option>
          <option value="">Other</option>
        </select>
        <input
            type="email"
            name="email"
            placeholder="Email"
            value={userData.email}
            onChange={handleChange}
        />
        <input
            type="password"
            name="password"
            placeholder="Password"
            value={userData.password}
            onChange={handleChange}
        />
        <button type="submit">Sign Up</button>
      </form>
  );
}

export default SignUpForm;
