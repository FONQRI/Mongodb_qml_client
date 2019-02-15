cmake_minimum_required(VERSION 3.1)

project(Mongodb_qml_client LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_STANDARD 17)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -std=gnu++17 -lsasl2 -lssl -lcrypto -D__STRICT_ANSI__")

find_package(Qt5 COMPONENTS Core Quick REQUIRED)
find_package (Threads)
find_package(libbsoncxx)
find_package(libmongocxx)
include_directories(${LIBBSONCXX_INCLUDE_DIRS} ${LIBMONGOCXX_INCLUDE_DIRS} )

find_package(Boost 1.68 REQUIRED COMPONENTS
  date_time
  filesystem
  iostreams
  thread
  )


if(Boost_FOUND)
  include_directories(${Boost_INCLUDE_DIRS})
  add_executable(${PROJECT_NAME} "main.cpp" "qml.qrc" src/cpp/JsonModle.h src/cpp/JsonModle.cpp )
  target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick
    Boost::date_time
    Boost::filesystem
    Boost::iostreams
    Boost::thread

    ${CMAKE_THREAD_LIBS_INIT}
    ${LIBBSONCXX_LIBRARIES}
    ${LIBMONGOCXX_LIBRARIES}
    )
endif(Boost_FOUND)
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
