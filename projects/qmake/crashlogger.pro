TEMPLATE = lib
QT = core
include( $${PWD}/config.pri )
include( $${PROJECT_ROOT_PATH}/modules/crashlogger/crashlogger.pri )
DESTDIR = $${LIBS_PATH}
SOURCES = $${PROJECT_ROOT_PATH}/modules/crashlogger/src/crashlogger.cpp
shared: LIBS *= -lbacktrace
