// This exercise can be completed with vanilla JS, but feel
// free to add any productivity dependencies that you use in your 
// normal workflow. If they're unusual let us know what they do :).

import $ from 'jquery'; // If you want jQuery.
import _ from 'lodash'; // If you want underscore/lodash.
import styles from './styles/app.scss';

function buildAd() {
    $.get('http://live.spongecell.com/interview/ad_revision.json', function(data) {
        var adScreen = $('<div id="ad-screen"/>');
        adScreen.css({
            height: data.size.height,
            width: data.size.width,
            'max-height': data.size.height,
            'max-width': data.size.width
        });
        $('#main-container').append(adScreen);
        function createElement(elementData) {
            var domElement = $('<div/>');
            domElement.css({
                    background: "red",
                    height: elementData.size.height,
                    width: elementData.size.width,
                    position: 'fixed',
                    left: (elementData.position.left * data.size.width) + 'px',
                    top: (elementData.position.top * data.size.height) + 'px'
            });
            return domElement;
        }
        function configureElement(elementSettings, domElement) {
            if(elementSettings.type === 'image') {
                domElement.css({
                    background: "url('" + data.assets[elementSettings.image.masterAssetId] + "')",
                })
            } else {
                domElement.append(elementSettings.text.text);
            }
            domElement.css({
                'background-size': elementSettings.size.width + 'px ' + elementSettings.size.height + 'px'
            });
        }
        data.settings.screens[0].elements.map(function(elementSettings) {
            var domElement = createElement(elementSettings);
            adScreen.append(domElement);
            configureElement(elementSettings, domElement);
        });
    });
}

$(document).ready(function() {
    buildAd();
});
