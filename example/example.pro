include($${PWD}/../config.pri)
include($${PWD}/../crashlogger.prf)
TEMPLATE = app
QT = core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
QMAKE_CXXFLAGS += -std=c++11 -funwind-tables -rdynamic -g
SOURCES += *.cpp
HEADERS += *.h
LIBS *= -lcrashlogger -lbacktrace
