PROJECT_ROOT_PATH = $${PWD}/../..

CONFIG(debug, debug|release) {
    CONFIG-=release
    BUILD_PATH = $${PROJECT_ROOT_PATH}/build/debug
} else {
    BUILD_PATH = $${PROJECT_ROOT_PATH}/build/release
    !win32 {
        QMAKE_CXXFLAGS += -g
        QMAKE_CFLAGS += -g
    }
}

CONFIG *= c++11
CONFIG = $$unique(CONFIG)
win32 {
    APPS_PATH = $${BUILD_PATH}
    LIBS_PATH = $${BUILD_PATH}
} else {
    APPS_PATH = $${BUILD_PATH}/bin
    LIBS_PATH = $${BUILD_PATH}/lib
}

GENERATED_FILES_DIR=$${BUILD_PATH}/.obj/$${TARGET}
OBJECTS_DIR = $${GENERATED_FILES_DIR}/o
MOC_DIR = $${GENERATED_FILES_DIR}/moc
RCC_DIR = $${GENERATED_FILES_DIR}/rcc
LIBS *= -L$${LIBS_PATH}
