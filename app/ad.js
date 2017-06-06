import Screen from './screen';

class Ad {
    constructor(adJSON) {
        this.json = adJSON;
    }

    render() {
        const screenNodes = this.getScreens();
        let adContainerNode = document.createElement('div');
        adContainerNode = appendChildren(adContainerNode, screenNodes);
        adContainerNode = applyStyles(adContainerNode, this.json.style);
        return adContainerNode;
    }

    getScreens() {
        const { assets } = this.json;
        const { screens } = this.json.settings;
        const screenNodes = screens.map( screenJson => new Screen(screenJson, assets).render());
        return screenNodes;
    }
}

export function appendChildren(parent, nodes) {
    nodes.forEach( s => parent.appendChild(s));
    return parent;
}

export function applyStyles(node, styles) {
    Object.keys(styles).forEach( key => {
        node.style[key] = styles[key];
    });
    return node;
}

export default Ad;