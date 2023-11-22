import csv
import numpy as np

def read_csv_as_list(file_input):
    data_list = []

    with open(file_input, newline='') as pixels_and_data:
        reader_csv = csv.reader(pixels_and_data)

        for row in reader_csv:
            int_convert = [int(index) for index in row]
            data_list.append(int_convert)
    
    pixels_and_data.close()
    
    length = data_list[-1][0]
    width = data_list[-1][1] 

    select_pixels_for_search(data_list, length, width)

def select_pixels_for_search(data_list, max_x, max_y):
    pixels_values = []
    start_x = 1
    start_y = 1

    while max_x > start_x:
        while max_y > start_y:
            pixels = []
            pixels.append(data_list[start_x-1][start_y-1])
            pixels.append(data_list[start_x][start_y-1])
            pixels.append(data_list[start_x+1][start_y+1])
            pixels.append(data_list[start_x-1][start_y])
            pixels.append(data_list[start_x][start_y])
            pixels.append(data_list[start_x+1][start_y])
            pixels.append(data_list[start_x-1][start_y+1])
            pixels.append(data_list[start_x][start_y+1])
            pixels.append(data_list[start_x+1][start_y+1])
            pixels_values.append(pixels)
            
            start_y += 3
        start_x += 3
    
    for pixel_list in pixels_values:
        write_ARMv4_code(pixel_list)


def write_ARMv4_code(pixels):
    code = ""
    temp = 0
    code += "MOV R0, #0\n"
    index = 0
    code += "MOV R1, #0\n"
    item = 0
    code += "MOV R2, #0\n"

    code += f"MOV R3, #{pixels[0]}\nMOV R4, #{pixels[1]}\nMOV R5, #{pixels[2]}\nMOV R6, #{pixels[3]}\nMOV R7, #{pixels[4]}\nMOV R8, #{pixels[5]}\nMOV R9, #{pixels[6]}\nMOV R10, #{pixels[7]}\nMOV R11, #{pixels[8]}\n"
    while index < len(pixels) - 1:
        item = pixels[index]
        code += f"MOV R2, #{pixels[index]}\n"
        if item > pixels[index + 1]:
            temp = pixels[index + 1]
            code += f"MOV R0, #{pixels[index + 1]}\n"
            pixels[index + 1] = pixels[index]
            code += f"MOV R{index + 1}, R{index}\n"
            pixels[index] = temp
            code += f"MOV R{index}, R0\n"
            index = 0
            code += "MOV R1, #0\n"
        else:
            index += 1
            code += "ADD R1, R1, #1\n"    
    
    # La mediana sería el indice 4

    text_file = open("ARMv4 Code.txt", "w")
    text_file.write(code)
    text_file.close()

read_csv_as_list('colores.csv')