COMPILER = $(CXX)
CPPFLAGS=-Wall -DNDEBUG -std=c++11 -g2 -I$(HELIB) -pthread -DFHE_THREADS -DFHE_DCRT_THREADS -DFHE_BOOTS_THREADS
LIBS=$(HELIB)/fhe.a -lntl -lgmp -lm -lrt
TARGET=scalarProduct

.PHONY: all clean run

all: $(TARGET)

$(TARGET): main.cpp
	$(COMPILER) $(CPPFLAGS) $< -o $(TARGET) $(LIBS)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)
