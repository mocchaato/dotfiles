pragma Singleton

import "root:/config"
import "root:/utils"
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property list<string> colourNames: ["rosewater", "flamingo", "pink", "mauve", "red", "maroon", "peach", "yellow", "green", "teal", "sky", "sapphire", "blue", "lavender"]

    property bool showPreview
    property string scheme
    property string flavour
    property bool light
    readonly property Colours palette: showPreview ? preview : current
    readonly property Colours current: Colours {}
    readonly property Colours preview: Colours {}
    readonly property Transparency transparency: Transparency {}

    function alpha(c: color, layer: bool): color {
        if (!transparency.enabled)
            return c;
        c = Qt.rgba(c.r, c.g, c.b, layer ? transparency.layers : transparency.base);
        if (layer)
            c.hsvValue = Math.max(0, Math.min(1, c.hslLightness + (light ? -0.2 : 0.2))); // TODO: edit based on colours (hue or smth)
        return c;
    }

    function on(c: color): color {
        if (c.hslLightness < 0.5)
            return Qt.hsla(c.hslHue, c.hslSaturation, 0.9, 1);
        return Qt.hsla(c.hslHue, c.hslSaturation, 0.1, 1);
    }

    function load(data: string, isPreview: bool): void {
        const colours = isPreview ? preview : current;
        const scheme = JSON.parse(data);

        if (!isPreview) {
            root.scheme = scheme.name;
            flavour = scheme.flavour;
        }

        light = scheme.mode === "light";

        for (const [name, colour] of Object.entries(scheme.colours)) {
            const propName = colourNames.includes(name) ? name : `m3${name}`;
            if (colours.hasOwnProperty(propName))
                colours[propName] = `#${colour}`;
        }
    }

    function setMode(mode: string): void {
        Quickshell.execDetached(["caelestia", "scheme", "set", "--notify", "-m", mode]);
    }

    FileView {
        path: `${Paths.state}/scheme.json`
        watchChanges: true
        onFileChanged: reload()
        onLoaded: root.load(text(), false)
    }

    component Transparency: QtObject {
        readonly property bool enabled: false
        readonly property real base: 0.78
        readonly property real layers: 0.58
    }

    component Colours: QtObject {
        property color m3primary_paletteKeyColor: "#ebdbb2"
        property color m3secondary_paletteKeyColor: "#ebdbb2"
        property color m3tertiary_paletteKeyColor: "#b8bb26"
        property color m3neutral_paletteKeyColor: "#928374"
        property color m3neutral_variant_paletteKeyColor: "#938374"
        property color m3background: "#3c3836"
        property color m3onBackground: "#ebdbb2"
        property color m3surface: "#1d2021"
        property color m3surfaceDim: "#3c3836"
        property color m3surfaceBright: "#504945"
        property color m3surfaceContainerLowest: "#1d2021"
        property color m3surfaceContainerLow: "#282828"
        property color m3surfaceContainer: "#282828"
        property color m3surfaceContainerHigh: "#504945"
        property color m3surfaceContainerHighest: "#665c54"
        property color m3onSurface: "#d5c4a1"
        property color m3surfaceVariant: "#928374"
        property color m3onSurfaceVariant: "#a89984"
        property color m3inverseSurface: "#fbf1c7"
        property color m3inverseOnSurface: "#1d2021"
        property color m3outline: "#a89984"
        property color m3outlineVariant: "#48454E"
        property color m3shadow: "#000000"
        property color m3scrim: "#000000"
        property color m3surfaceTint: "#ebdbb2"
        property color m3primary: "#ebdbb2"
        property color m3onPrimary: "#928374"
        property color m3primaryContainer: "#83a598"
        property color m3onPrimaryContainer: "#E5DEFF"
        property color m3inversePrimary: "#5F5791"
        property color m3secondary: "#bdae93"
        property color m3onSecondary: "#312E41"
        property color m3secondaryContainer: "#3c3836"
        property color m3onSecondaryContainer: "#fbf1c7"
        property color m3tertiary: "#b8bb26"
        property color m3onTertiary: "#b8bb26"
        property color m3tertiaryContainer: "#B38397"
        property color m3onTertiaryContainer: "#000000"
        property color m3error: "#fb4934"
        property color m3onError: "#cc241d"
        property color m3errorContainer: "#93000A"
        property color m3onErrorContainer: "#FFDAD6"
        property color m3primaryFixed: "#fbf1c7"
        property color m3primaryFixedDim: "#ebdbb2"
        property color m3onPrimaryFixed: "#fbf1c7"
        property color m3onPrimaryFixedVariant: "#ebdbb2"
        property color m3secondaryFixed: "#b8bb26"
        property color m3secondaryFixedDim: "#b8bb26"
        property color m3onSecondaryFixed: "#b8bb26"
        property color m3onSecondaryFixedVariant: "#b8bb26"
        property color m3tertiaryFixed: "#b8bb26"
        property color m3tertiaryFixedDim: "#b8bb26"
        property color m3onTertiaryFixed: "#b8bb26"
        property color m3onTertiaryFixedVariant: "#b8bb26"

        property color rosewater: "#d3869b"
        property color flamingo: "#fb4934"
        property color pink: "#d3869b"
        property color mauve: "#b16286"
        property color red: "#cc241d"
        property color maroon: "#fb4934"
        property color peach: "#E4B7F4"
        property color yellow: "#fabd2f"
        property color green: "#b8bb26"
        property color teal: "#689d6a"
        property color sky: "#8ec07c"
        property color sapphire: "#458588"
        property color blue: "#83a598"
        property color lavender: "#b16286"
    }
}
