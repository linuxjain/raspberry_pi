
ARMGNU ?= /usr/arm-linux-gnueabi/bin/

BUILD = build/

SOURCE = source/

TARGET = kernel.img

LIST = kernel.list

MAP = kernel.map

LINKER = kernel.ld

OBJECTS := $(patsubst $(SOURCE)%.s,$(BUILD)%.o,$(wildcard $(SOURCE)*.s))

all: $(TARGET) $(LIST)

rebuild: all

$(LIST) : $(BUILD)output.elf
	$(ARMGNU)objdump -d $(BUILD)output.elf > $(LIST)

$(TARGET) : $(BUILD)output.elf
	$(ARMGNU)objcopy $(BUILD)output.elf -O binary $(TARGET) 

$(BUILD)output.elf : $(OBJECTS) $(LINKER)
	$(ARMGNU)ld --no-undefined $(OBJECTS) -Map $(MAP) -o $(BUILD)output.elf -T $(LINKER)

$(BUILD)%.o: $(SOURCE)%.s $(BUILD)
	$(ARMGNU)as -I $(SOURCE) $< -o $@

$(BUILD):
	mkdir $@

clean : 
	-rm -rf $(BUILD)
	-rm -f $(TARGET)
	-rm -f $(LIST)
	-rm -f $(MAP)
