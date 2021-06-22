cmake_minimum_required(VERSION 3.13)
project(qml_osgearth)

if(NOT DEFINED 3D_LIB_PATH )
    set(3D_LIB_PATH "${CMAKE_CURRENT_LIST_DIR}/../../../3d3rdparty/" CACHE PATH "Path to 3D osgEarth libs")
endif()
message("3D_LIB_PATH: ${3D_LIB_PATH}")

if(NOT DEFINED 3D_LIB_PATH )
    message( FATAL_ERROR "Please set variable 3D_LIB_PATH - path to 3D osgEarth libs")
endif()

# ------- OSG, osgearth -------
set(OSG_DIR "${3D_LIB_PATH}/OpenSceneGraph" CACHE PATH "Path to OpenSceneGraph installation dir, that contains bin, include, lib" FORCE)
set(OSGEARTH_DIR "${3D_LIB_PATH}/osgearth" CACHE PATH "Path to osgearth installation dir, that contains bin, include, lib" FORCE)
# ------- OSG, osgearth -------

# ------- CMake Modules -------
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
include(cmake/Unset3dCacheVariables.cmake)
# ------- CMake Modules -------

# ------- OpenSceneGraph library -------
message("")
message(STATUS "--------- START OpenSceneGraph ---------")
unset_3d_cache_variables()

find_package(OpenSceneGraph 3.6.5 REQUIRED osgAnimation osgDB osgGA osgManipulator osgShadow osgSim osgTerrain osgText osgUtil osgViewer)
if(${OPENSCENEGRAPH_FOUND})
    message(STATUS "Found following OSG libraries:")
    foreach(osgLib ${OPENSCENEGRAPH_LIBRARIES})
        message(STATUS " - ${osgLib}")
    endforeach()
else(${OPENSCENEGRAPH_FOUND})
    message(STATUS "OpenSceneGraph NOT found")
endif(${OPENSCENEGRAPH_FOUND})
message(STATUS "--------- END OpenSceneGraph ---------")
# ------- OpenSceneGraph library -------

# ------- osgEarth library -------
message("")
message(STATUS "--------- START ogEarth ---------")
find_package(OsgEarth 3.1.0 REQUIRED osgEarth)
if(${OSGEARTH_FOUND})
    message(STATUS "Found and using following ogEarth libraries:")
    message(STATUS " - ${OSGEARTH_LIBRARY}")
    message(STATUS " - ${OSGEARTH_LIBRARY_DEBUG}")
else(${OSGEARTH_FOUND})
    message(STATUS "ogEarth NOT found")
endif(${OSGEARTH_FOUND})
message(STATUS "--------- END ogEarth ---------")
# ------- osgEarth library -------


# ------- Compiler settings -------
    # MSVC Specific
    if(MSVC)
        message(STATUS "Multi-configuration generator (MSVC) ")
        set(CMAKE_CONFIGURATION_TYPES "Debug;Release" CACHE STRING "Multi-configuration types for MSVC" FORCE)
    endif(MSVC)

    if(WIN32)
        SET(CMAKE_DEBUG_POSTFIX "d" CACHE STRING "add a postfix, usually d on windows")
        # Remove 'lib' prefix for shared libraries on Windows
        set(CMAKE_SHARED_LIBRARY_PREFIX "")
    endif()

    # Instruct CMake to run moc automatically when needed.
    set(CMAKE_AUTOMOC ON)
    # Find includes in corresponding build directories
    set(CMAKE_INCLUDE_CURRENT_DIR ON)

    #Compiler settings
    if(MSVC)
        set_property(GLOBAL PROPERTY USE_FOLDERS ON)

        set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

        set(CMAKE_MODULE_LINKER_FLAGS_DEBUG "${CMAKE_MODULE_LINKER_FLAGS_DEBUG} /INCREMENTAL:NO")
        set(CMAKE_MODULE_LINKER_FLAGS_RELEASE "${CMAKE_MODULE_LINKER_FLAGS_RELEASE} /MANIFEST:NO")

        set(gtest_force_shared_crt ON CACHE BOOL "Always use msvcrt.dll" FORCE)

        # Add compiler flag for c++14
        if (MSVC_VERSION GREATER_EQUAL "1900")

            include(CheckCXXCompilerFlag)
            CHECK_CXX_COMPILER_FLAG("/std:c++14" _cpp_14_flag_supported)
            if (_cpp_14_flag_supported)
                add_compile_options("/std:c++14")
            endif()

        endif()
    else(MSVC)
        # Not for MSVC, because /std::c++latest conflicts with c++14
        set(CMAKE_CXX_STANDARD 14)
    endif(MSVC)
# ------- Compiler settings -------

# ------- Deploy settings -------
    if(MSVC)
        set(RESULT_DIR "${CMAKE_SOURCE_DIR}" CACHE PATH "Result directory")
    else(MSVC)
        if (CMAKE_BUILD_TYPE STREQUAL "Debug")
            set(RESULT_DIR ${CMAKE_SOURCE_DIR}/debug)
        else(CMAKE_BUILD_TYPE STREQUAL "Debug")
            set(RESULT_DIR ${CMAKE_SOURCE_DIR}/release)
        endif (CMAKE_BUILD_TYPE STREQUAL "Debug")
    endif(MSVC)

# ------- First for the generic no-config case (e.g. with mingw) -------
    set( CMAKE_RUNTIME_OUTPUT_DIRECTORY "${RESULT_DIR}/${DIR}" )
    set( CMAKE_LIBRARY_OUTPUT_DIRECTORY "${RESULT_DIR}/${DIR}" )
    set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${RESULT_DIR}/${DIR}/lib" )
    set( CMAKE_PDB_OUTPUT_DIRECTORY "${RESULT_DIR}/${DIR}" )

# ------- Second, for multi-config builds (e.g. msvc) -------
    foreach( OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES} )
        string( TOLOWER ${OUTPUTCONFIG} LOWER_OUTPUTCONFIG )
        string( TOUPPER ${OUTPUTCONFIG} UPPER_OUTPUTCONFIG )
        set( CMAKE_RUNTIME_OUTPUT_DIRECTORY_${UPPER_OUTPUTCONFIG} "${RESULT_DIR}/${LOWER_OUTPUTCONFIG}/${DIR}" )
        set( CMAKE_LIBRARY_OUTPUT_DIRECTORY_${UPPER_OUTPUTCONFIG} "${RESULT_DIR}/${LOWER_OUTPUTCONFIG}/${DIR}" )
        set( CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${UPPER_OUTPUTCONFIG} "${RESULT_DIR}/${LOWER_OUTPUTCONFIG}/${DIR}/lib" )
        set( CMAKE_PDB_OUTPUT_DIRECTORY_${UPPER_OUTPUTCONFIG}     "${RESULT_DIR}/${LOWER_OUTPUTCONFIG}/${DIR}" )
    endforeach( OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES )
# ------- Deploy settings -------

add_executable(${PROJECT_NAME})

# ------- OpenGL library -------
    find_package(OpenGL)
# ------- OpenGL library -------

# ------- Qt library -------
    find_package(Qt5 ${QT_REQUIRED_VERSION} CONFIG REQUIRED COMPONENTS Core Gui Widgets Network OpenGL Xml Quick PrintSupport)
# ------- Qt library -------

# ------- External includes -------
    target_include_directories(${PROJECT_NAME} PUBLIC ${OPENSCENEGRAPH_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${OSGEARTH_INCLUDE_DIRS})

    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5Core_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5Gui_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5Widgets_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5Network_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5OpenGL_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5Xml_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5Quick_INCLUDE_DIRS})
    target_include_directories(${PROJECT_NAME} PUBLIC ${Qt5PrintSupport_INCLUDE_DIRS})
# ------- External includes -------

# ------- Core includes and sources -------
    target_include_directories(${PROJECT_NAME} PUBLIC "include")
    file(GLOB_RECURSE SOURCES "include/*.h" "src/*.h" "src/*.cpp" "src/*.hpp")
    target_sources(${PROJECT_NAME} PRIVATE ${SOURCES})
# ------- Core includes and sources -------

# Local resources
file(GLOB_RECURSE LOC_QRC_FILES "*.qrc")

# Compile resources
qt5_add_resources(QRC_SOURCES ${QRC_FILES} ${LOC_QRC_FILES})
target_sources(${PROJECT_NAME} PRIVATE ${QRC_SOURCES})

# ------- External libraries -------
    target_link_libraries(${PROJECT_NAME} PUBLIC ${OPENSCENEGRAPH_LIBRARIES})

    if(NOT "${OSGEARTH_LIBRARY_DEBUG}" STREQUAL "OSGEARTH_LIBRARY_DEBUG-NOTFOUND")
      target_link_libraries(${PROJECT_NAME} PUBLIC 
        debug ${OSGEARTH_LIBRARY_DEBUG} optimized ${OSGEARTH_LIBRARY}
      )
    else()
      target_link_libraries(${PROJECT_NAME} PUBLIC 
        ${OSGEARTH_LIBRARY}
      )
    endif()
    
    target_link_libraries(${PROJECT_NAME} PUBLIC
                        Qt5::Core
                        Qt5::Gui
                        Qt5::Widgets
                        Qt5::Network
                        Qt5::OpenGL
                        Qt5::Xml
                        Qt5::Quick
                        Qt5::PrintSupport)
                        
    target_link_libraries(${PROJECT_NAME} PUBLIC ${OPENGL_gl_LIBRARY})
# ------- External libraries -------


# Copy data to result
if(MSVC)
  foreach(OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOLOWER ${OUTPUTCONFIG} LOWER_OUTPUTCONFIG)
    file(COPY "data_osg" DESTINATION ${RESULT_DIR}/${LOWER_OUTPUTCONFIG})
  endforeach(OUTPUTCONFIG CMAKE_CONFIGURATION_TYPES)
else(MSVC)
  file(COPY "data_osg" DESTINATION ${RESULT_DIR})
endif()

# StartUp project in Visual Studio
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})