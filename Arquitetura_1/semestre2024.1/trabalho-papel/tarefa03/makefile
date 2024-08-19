TARGET = tarefa03

ASM_SOURCES = tarefa03.asm par.asm fim.asm

OBJ_FILES = $(ASM_SOURCES:.asm=.o)

$(TARGET): $(OBJ_FILES)
	gcc -m32 -o $(TARGET) $(OBJ_FILES)

%.o: %.asm
	nasm -f elf -o $@ $<

clean:
	rm -f $(OBJ_FILES) $(TARGET)