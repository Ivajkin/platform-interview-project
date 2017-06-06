import Screen from './screen';

class Ad {
    constructor(adJSON) {
        this.json = adJSON;
    }

    render() {
        const screenNodes = this.getScreens();
        let adContainerNode = document.createElement('div');
        adContainerNode = this.appendScreens(adContainerNode, screenNodes);
        adContainerNode = applyStyles(adContainerNode, this.json.style);
        return adContainerNode;
    }

    appendScreens(adContainerNode, screenNodes) {
        screenNodes.forEach( s => adContainerNode.appendChild(s));
        return adContainerNode;
    }

    getScreens() {
        const { assets } = this.json;
        const { screens } = this.json.settings;
        const screenNodes = screens.map( screenJson => new Screen(screenJson, assets).render());
        return screenNodes;
    }
}

export function applyStyles(node, styles) {
    Object.keys(styles).forEach( key => {
        node.style[key] = styles[key];
    });
    return node;
}

export default Ad;