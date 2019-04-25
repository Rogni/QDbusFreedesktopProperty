
cmake_minimum_required(VERSION 3.9)

project(QDbusFreedesktopProperty CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set (QDbusFreedesktopPropertyInclude
    include/QDBusFreedesktopInterface.h
    include/QDBusFreedesktopInterfaceManager.h
    include/QDBusFreedesktopProperty.h
)

set (QDbusFreedesktopPropertySource 
    src/QDBusFreedesktopInterface.cpp
    src/QDBusFreedesktopInterfaceManager.cpp
    src/QDBusFreedesktopProperty.cpp
    ${QDbusFreedesktopPropertyInclude}
    )

# Find the Qt5Core library
find_package(Qt5Core CONFIG REQUIRED)
find_package(Qt5DBus CONFIG REQUIRED)

add_library(QDbusFreedesktopProperty STATIC ${QDbusFreedesktopPropertySource})
set_property(TARGET QDbusFreedesktopProperty PROPERTY CXX_STANDARD 17)
set_target_properties(QDbusFreedesktopProperty PROPERTIES PUBLIC_HEADER "${QDbusFreedesktopPropertyInclude}")

target_include_directories(QDbusFreedesktopProperty PUBLIC include/)

qt5_use_modules(QDbusFreedesktopProperty Core DBus)

install(TARGETS QDbusFreedesktopProperty
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static
        PUBLIC_HEADER DESTINATION include/QDbusFreedesktopProperty
        )
