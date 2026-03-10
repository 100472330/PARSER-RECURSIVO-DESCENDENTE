CC      = gcc
CFLAGS  = -Wall -Wextra -std=c11
TARGET  = drLL
SRC     = drLL.c

TESTS   = drLL.txt

.PHONY: all test clean

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

test: $(TARGET)
	./$(TARGET) < $(TESTS)

clean:
	rm -f $(TARGET)
