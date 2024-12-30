CPREFIX = x86_64-w64-mingw32-
TARGET = cheburnet.exe
LIBS = -lws2_32
CC = $(CPREFIX)gcc
CFLAGS = -std=c99 -O2 -s -mtune=generic -march=x86-64 -pipe \
         -fstack-protector -pie -fPIE -D_FORTIFY_SOURCE=2 \
         -Werror -Wall -Wextra -Wpedantic \
         -Wformat=2 -Wformat-overflow=2 -Wformat-truncation=2 -Wformat-signedness \
         -Wnull-dereference -Winit-self -Wuninitialized \
         -Wstrict-overflow=5 -Wstringop-overflow=4 -Warray-bounds=2 \
         -Wduplicated-branches -Wduplicated-cond -Wfloat-equal -Wshadow \
         -Wundef -Wbad-function-cast -Wcast-qual -Wcast-align=strict \
         -Wconversion -Wlogical-op -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations \
         -Wstack-protector

.PHONY: default all clean

default: $(TARGET)
all: default

SOURCES = $(wildcard *.c)
HEADERS = $(wildcard *.h)

$(TARGET): Makefile $(SOURCES) $(HEADERS)
	$(CC) $(CFLAGS) $(SOURCES) $(LIBS) -o $(TARGET)

clean:
	-rm -f $(TARGET)
