import cv2

def main():
    image = cv2.imread('test.jpg')

    height, width, channels = image.shape

    with open('coordenadas.txt', 'w') as f:
        for x in range (width):
            for y in range(height):
                pixel_value = image[x, y]

                pixel_grey_color = pixel_value[0]

                pixel_info = (f'({x}, {y}), - ({pixel_grey_color})\n')

                f.writelines(pixel_info)
    f.close()

def to_hex(num, fill):
    return hex(num).replace("0x", "").zfill(fill)

main()