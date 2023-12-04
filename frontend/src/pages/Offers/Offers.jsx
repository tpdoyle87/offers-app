import React, {useState, useEffect} from 'react';
import { useQuery } from 'react-query';
import axios from 'axios';
import './Offers.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSpinner } from '@fortawesome/free-solid-svg-icons';
import AuthManager from "../../helpers/AuthManager.js";


const fetchOffers = async () => {
    const tokens = AuthManager.getTokens()
    const headers = {
        'access-token': tokens.accessToken,
        'client': tokens.client,
        'uid': tokens.uid
    }
    const { data } = await axios.get('http://localhost:5000/api/offers', { headers } );
    console.log(data['offers'])

    return data;
};

function OfferCards() {
    const { data, isLoading, error } = useQuery('offers', fetchOffers);


    if (isLoading) return <div><FontAwesomeIcon icon={faSpinner} spin /></div>;
    if (error) return <div>An error occurred: {error.message}</div>;


    return (
        <div className="offers-container">
            { data['offers'].map((offer, index) => (
                <div className="card" key={index}>
                    <div className="card-body">
                        <p className="card-text">{offer.description}</p>
                    </div>
                </div>
            ))}
        </div>
    );
}

export default OfferCards;
