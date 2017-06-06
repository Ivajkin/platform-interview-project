import { applyStyles } from './ad';
import Element from './element';

class Screen {
    constructor(screenJSON, assetsJSON) {
        this.assets = assetsJSON;
        this.json = screenJSON;
    }

    render() {
        const elementNodes = this.getElements();
        let screenNode = document.createElement('div');
        screenNode = this.appendElements(screenNode, elementNodes);
        screenNode = applyStyles(screenNode, this.json.style);
        return screenNode;
    }

    getElements() {
        const { json, assets } = this;
        const { elements } = json;
        const elementNodes = elements.map( elementJSON => new Element(elementJSON, assets).render());
        return elementNodes;
    }

    appendElements(screenNode, elementNodes) {
        elementNodes.forEach( e => screenNode.appendChild(e));
        return screenNode;
    }

    applyScreenStyles(screenNode, styles) {
        Object.keys(styles).forEach( key => {
            screenNode.style[key] = styles[key];
        });
        return screenNode;
    }
}

export default Screen;