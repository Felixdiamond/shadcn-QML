# shadcn-QML

This project aims to port components from the [shadcn](https://ui.shadcn.com) UI library into QML for use in modern desktop and mobile applications.

I'll keep adding on my need basis for my [medication tracker](https://github.com/Felixdiamond/nine-medics) project but you can also contribute and add more components! Every help is appreciated

Note: These components may not FULLY replicate the functionality of shadcn but I'll try to make it as close as possible

## Components

### Ported Components
- **Button**: A fully customizable button component with support for multiple variants (default, destructive, outline, etc.) and sizes (small, large, icon).

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Felixdiamond/shadcn-QML.git
   cd shadcn-QML/components
   ```

3. **Copy and Paste the component** to your QML project:
   - Ensure the `CnButton.qml` file (and other components) are either in the same directory as your main QML file or imported properly from a subdirectory.

This is a bit manual for now but hopefully soon we'll have a website or a cli tool or something

## Usage

### Example Usage of the Button Component

To use the `CnButton` component in your QML project:

1. Import the `Button.qml` file in your `Main.qml` or any other QML file.

```qml
import QtQuick
import QtQuick.Controls
import "."  // Assuming Button.qml is in the same directory

ApplicationWindow {
    visible: true
    width: 400
    height: 300

    // Using the Button component
    CnButton {
        variant: "default"
        size: "lg"
        buttonText: "Primary"
        anchors.centerIn: parent
        onClicked: console.log("Primary button clicked")
    }
}
```

### Button Variants
- `default`: The primary button style (blue background).
- `destructive`: Destructive style (red background).
- `outline`: Border with no background.
- `secondary`: A less prominent style (gray background).
- `ghost`: Transparent background with hover effect.
- `link`: Text-only button with an underline on hover.

### Button Sizes
- `default`: Standard button size.
- `sm`: Smaller version of the button.
- `lg`: Larger version of the button.
- `icon`: Square button typically used for icons.

## Roadmap (for now)

- [x] Port `Button` component
- [ ] Port `Input` component
- [ ] Port `Card` component
- [ ] Implement utility functions for easier theming and layout
- [ ] Add documentation for each component

I would make another directory or something for the docs as the project grows bigger

## Contributing

We welcome contributions! If you'd like to contribute, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

