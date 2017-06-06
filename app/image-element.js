import { applyStyles } from './ad';

class ImageElement {
    constructor(elementJSON, assetsJSON) {
        this.json = elementJSON;
        this.assets = assetsJSON;
    }

    render() {
        let imageNode = document.createElement('img');
        imageNode.src = this.assets[this.json.image.masterAssetId];
        imageNode = applyStyles(imageNode, this.json.style);
        return imageNode;
    }
}

export default ImageElement;