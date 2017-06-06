import { applyStyles, appendChildren } from './ad';
import Element from './element';

class Screen {
    constructor(screenJSON, assetsJSON) {
        this.assets = assetsJSON;
        this.json = screenJSON;
    }

    render() {
        const elementNodes = this.getElements();
        let screenNode = document.createElement('div');
        screenNode = appendChildren(screenNode, elementNodes);
        screenNode = applyStyles(screenNode, this.json.style);
        return screenNode;
    }

    getElements() {
        const { json, assets } = this;
        const { elements } = json;
        const elementNodes = elements.map( elementJSON => new Element(elementJSON, assets).render());
        return elementNodes;
    }

    applyScreenStyles(screenNode, styles) {
        Object.keys(styles).forEach( key => {
            screenNode.style[key] = styles[key];
        });
        return screenNode;
    }
}

export default Screen;