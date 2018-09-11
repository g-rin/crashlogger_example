include($${PWD}/config.pri)
include( $${PROJECT_ROOT_PATH}/modules/crashlogger/crashlogger.prf )
TEMPLATE = app
QT = core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
QMAKE_CXXFLAGS += -std=c++11 -funwind-tables -rdynamic -g
SOURCES += $${PROJECT_ROOT_PATH}/example/*.cpp
HEADERS += $${PROJECT_ROOT_PATH}/example/*.h
LIBS *= -lcrashlogger -lbacktrace
