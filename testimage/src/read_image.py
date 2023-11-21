import cv2

def main():
    image = cv2.imread('test.jpg')

    height, width, channels = image.shape

    with open('coordenadas.txt', 'w') as f:
        for x in range (width):
            for y in range(height):
                pixel_value = image[x, y]

                pixel_grey_color = pixel_value[0]

                pixel_info = (f'{pixel_grey_color},')

                f.writelines(pixel_info)
            f.writelines('\n')
    f.close()

    # Abre el archivo de entrada en modo lectura y el de salida en modo escritura
    with open('coordenadas.txt', 'r') as archivo_entrada, open('colores.csv', 'w') as archivo_salida:
        # Lee línea por línea del archivo de entrada
        for linea in archivo_entrada:
            # Elimina el último carácter de la línea y escribe la línea modificada en el archivo de salida
            linea_modificada = linea.rstrip('\n')[:-1] + '\n'
            archivo_salida.write(linea_modificada)

def to_hex(num, fill):
    return hex(num).replace("0x", "").zfill(fill)

main()