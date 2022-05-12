project (HomeAssistant LANGUAGES CXX)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)

macro(print_all_variables)
    message(STATUS "print_all_variables-{")
    get_cmake_property(_variableNames VARIABLES)
    foreach (_variableName ${_variableNames})
        message(STATUS "${_variableName}=${${_variableName}}")
    endforeach()
    message(STATUS "print_all_variables-}")
endmacro()

FILE(GLOB SOURCE_FILES
    src/*.cpp
    src/*.h
    )
link_directories(${CMAKE_SOURCE_DIR}/lib)

find_package(Qt5 COMPONENTS Core Quick Qml Concurrent Widgets Multimedia REQUIRED)
find_package(Qt5QuickCompiler)

qt5_add_resources(RESOURCES ui/resources.qrc)
qt5_add_resources(RESOURCES ui/images.qrc)

#qtquick_compiler_add_resources(RESOURCES ui/resources.qrc)

add_executable(${PROJECT_NAME}
    ${SOURCE_FILES}
    ${RESOURCES}
    )

target_link_libraries(${PROJECT_NAME}
    Qt5::Core
    Qt5::Quick
    Qt5::Qml
    Qt5::Concurrent
    Qt5::Widgets
    Qt5::Multimedia
)

set(QML_DIR ui)
set(QML_DIR_CMP ui/Components)
set(QML_DIR_VWS ui/Views)
set(QML_DIR_FONTS ui/fonts)
set(QML_DIR_ITEMS ui/Items)

FILE(GLOB QmlFiles "${QML_DIR}/*.qml")
FILE(GLOB QmlFiles_CMP "${QML_DIR_CMP}/*.qml")
FILE(GLOB QmlFiles_VWS "${QML_DIR_VWS}/*.qml")
FILE(GLOB QmlFiles_ITM "${QML_DIR_ITEMS}/*.qml")
FILE(GLOB QmlFiles_FNT "${QML_DIR_FONTS}/*.ttf")
FILE(GLOB QmlFiles_RSC "${QML_DIR}/*.qrc")

add_custom_target(${PROJECT_NAME}-qml SOURCES ${QmlFiles})
add_custom_target(${PROJECT_NAME}-views SOURCES ${QmlFiles_VWS})
add_custom_target(${PROJECT_NAME}-components SOURCES ${QmlFiles_CMP})
add_custom_target(${PROJECT_NAME}-items SOURCES ${QmlFiles_ITM})
add_custom_target(${PROJECT_NAME}-fonts SOURCES ${QmlFiles_FNT})
add_custom_target(${PROJECT_NAME}-recources SOURCES ${QmlFiles_RSC})


# Make Qt Creator aware of where the QML modules live
set (_QML_IMPORT_PATHS "")

## Add new module paths here.
list (APPEND _QML_IMPORT_PATHS ${QML_DIR})
list (APPEND _QML_IMPORT_PATHS ${QML_DIR_CMP})
#list (APPEND _QML_IMPORT_PATHS ${QML_DIR_VWS})

set (
    QML_IMPORT_PATH
    ${_QML_IMPORT_PATHS}
    CACHE
    STRING
    "Path used to locate CMake modules by Qt Creator"
    FORCE
)


print_all_variables()
