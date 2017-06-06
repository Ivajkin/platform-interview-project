import ImageElement from './image-element';
import TextElement from './text-element';

class Element {
    constructor(elementJSON, assets) {
        switch (elementJSON.type) {
            case "image": {
                return new ImageElement(elementJSON, assets);
            }
            case "text": {
                return new TextElement(elementJSON);
            }
            default: {
                throw new Error("No element type specified or improper element type.");
            }
        }
    }
};

export default Element;