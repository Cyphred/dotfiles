# !/bin/sh
# Compiles, uploads and opens a serial monitor for an arduino

arduino-cli compile -b arduino:avr:nano:cpu=atmega328old && \
arduino-cli upload -b arduino:avr:nano:cpu=atmega328old -v -p $1 && \
minicom -D $1 -b $2
