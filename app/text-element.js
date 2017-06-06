import { applyStyles } from './ad';

class TextElement {
    constructor(elementJSON, assetsJSON) {
        this.json = elementJSON;
        this.assets = assetsJSON;
    }

    render() {
        let textNode = document.createElement('div');
        textNode.textContent = this.json.text.content;
        textNode = applyStyles(textNode, this.json.style);
        return textNode;
    }
}

export default TextElement;