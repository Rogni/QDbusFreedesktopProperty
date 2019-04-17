import qbs

Project {
    StaticLibrary {
        Depends {name: "cpp" }
        Depends {name: "Qt.core" }
        Depends {name: "Qt.dbus" }
        files: [
            "QDBusFreedesktopInterface.cpp",
            "QDBusFreedesktopInterface.h",
            "QDBusFreedesktopInterfaceManager.cpp",
            "QDBusFreedesktopInterfaceManager.h",
            "QDBusFreedesktopProperty.cpp",
            "QDBusFreedesktopProperty.h",
        ]
        name: "QDBusProperty"

        Export {
            Depends {
                name: "cpp"
            }
            cpp.includePaths: product.sourceDirectory
            cpp.defines: ["USING_" + product.name.toUpperCase()]

        }
    }
}

