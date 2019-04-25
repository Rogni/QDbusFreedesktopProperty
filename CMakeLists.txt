
cmake_minimum_required(VERSION 3.9)

project(QDbusFreedesktopProperty CXX)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

set (QDbusFreedesktopPropertySource 
    src/QDBusFreedesktopInterface.cpp
    src/QDBusFreedesktopInterfaceManager.cpp
    src/QDBusFreedesktopProperty.cpp
    )
    
# Find the Qt5Core library
find_package(Qt5Core CONFIG REQUIRED)
find_package(Qt5DBus CONFIG REQUIRED)

add_library(QDbusFreedesktopProperty SHARED ${QDbusFreedesktopPropertySource})
set_property(TARGET QDbusFreedesktopProperty PROPERTY CXX_STANDARD 17)
set_target_properties(QDbusFreedesktopProperty PROPERTIES PUBLIC_HEADER "${QDbusFreedesktopPropertyInclude}")

target_include_directories(QDbusFreedesktopProperty PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>/include/
    $<INSTALL_INTERFACE:include>
    )

target_link_libraries(QDbusFreedesktopProperty Qt5::Core)
target_link_libraries(QDbusFreedesktopProperty Qt5::DBus)

install(TARGETS QDbusFreedesktopProperty
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib/static
        PUBLIC_HEADER DESTINATION include/QDbusFreedesktopProperty
        )
