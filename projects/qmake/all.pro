TEMPLATE  = subdirs
CONFIG *= ordered

SUBDIRS = libbacktrace crashlogger example

libbacktrace.file = $${PWD}/libbacktrace.pro
crashlogger.file = $${PWD}/crashlogger.pro
example.file = $${PWD}/example.pro


