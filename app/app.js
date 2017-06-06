// This exercise can be completed with vanilla JS, but feel
// free to add any productivity dependencies that you use in your 
// normal workflow. If they're unusual let us know what they do :).

import $ from 'jquery'; // If you want jQuery.
import _ from 'lodash'; // If you want underscore/lodash.
import styles from './styles/app.scss';

import Ad from './ad';


function buildAd() {
    fetch('/assets/ad.json').then( res => res.json()).then( adJSON => {
        const ad = new Ad(adJSON);
        document.body.appendChild(ad.render());
    })
}

document.addEventListener('DOMContentLoaded', buildAd);
