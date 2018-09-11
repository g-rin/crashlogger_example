include( $${PWD}/config.pri )

TEMPLATE = aux
DESTDIR = $${LIBS_PATH}

static {
    CONFFLAGS += --disable-shared
}
shared {
    CONFFLAGS += --enable-shared
}

fake_target.target = libbacktrace
fake_target.CONFIG = phony no_link
fake_target.commands += cd $${PROJECT_ROOT_PATH}/modules/libbacktrace
fake_target.commands += && if [ ! -e Makefile ]; then ./configure $${CONFFLAGS}; fi
fake_target.commands += && $(MAKE)
win32 {
    fake_target.commands += && cp .libs/libbacktrace.a $${LIBS_PATH}/libbacktrace.a
}
unix {
    static {
        fake_target.commands += && cp .libs/libbacktrace.a $${LIBS_PATH}/libbacktrace.a
    }
    shared {
        fake_target.commands += && cp .libs/libbacktrace.so $${LIBS_PATH}/libbacktrace.so
    }
    fake_target.commands += && cd -

    shared: {
        fake_target.commands += && cd $${LIBS_PATH}
        fake_target.commands += && ln -sf libbacktrace.so libbacktrace.so.0
        fake_target.commands += && cd -
    }
}
QMAKE_EXTRA_TARGETS += fake_target

QMAKE_CLEAN =
QMAKE_CLEAN *= *.a
QMAKE_CLEAN *= *.so
