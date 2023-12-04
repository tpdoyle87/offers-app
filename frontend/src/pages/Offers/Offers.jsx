import React from 'react';
import { useQuery } from 'react-query';
import axios from 'axios';
import './Offers.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faSpinner } from '@fortawesome/free-solid-svg-icons';
import AuthManager from "../../helpers/AuthManager.js";


const fetchOffers = async () => {
    const tokens = AuthManager.getTokens()
    const headers = {
        'Access-Control-Allow-Origin': '*',
        'access-token': tokens.accessToken,
        'client': tokens.client,
        'uid': tokens.uid
    }
    const { data } = await axios.get('http://localhost:5000/api/offers', { headers } );

    return data;
};

function OfferCards() {
    const { data, isLoading, error } = useQuery('offers', fetchOffers);

    if (isLoading) return <div className="container m-auto mt-24"><FontAwesomeIcon icon={faSpinner} spin /></div>;
    if (error) return <div>An error occurred: {error.message}</div>;


    return (
        <div className="container  mt-24">
            <div>
                <p>Total Offers: {data['offers'].length}</p>
            </div>
            <div className="mt-5 grid grid-cols-3 gap-4">
                {
                    data['offers'] && data['offers'].length > 0 ? (
                        data['offers'].map((offer, index) => (
                            <div className="card" key={index}>
                                <div className="card-body">
                                    <p className="card-text">{offer.description}</p>
                                </div>
                            </div>
                        ))
                    ) : (
                        <div className="text-center">
                            <p>Sorry, no offers currently. Check back soon!</p>
                        </div>
                    )
                }
            </div>

        </div>
    );
}

export default OfferCards;
