import qbs

Project {
    StaticLibrary {
        Depends {name: "cpp" }
        Depends {name: "Qt.core" }
        Depends {name: "Qt.dbus" }
        files: [
            "src/QDBusFreedesktopInterface.cpp",
            "include/QDBusFreedesktopInterface.h",
            "src/QDBusFreedesktopInterfaceManager.cpp",
            "include/QDBusFreedesktopInterfaceManager.h",
            "src/QDBusFreedesktopProperty.cpp",
            "include/QDBusFreedesktopProperty.h",
        ]
        name: "QDbusFreedesktopProperty"

        Export {
            Depends {
                name: "cpp"
            }
            cpp.includePaths: product.sourceDirectory
            cpp.defines: ["USING_" + product.name.toUpperCase()]

        }
    }
}

