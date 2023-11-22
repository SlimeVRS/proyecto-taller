from PIL import Image

def convert_to_bitmap(image_path, output_path):
    try:
        img = Image.open(image_path)
        img.convert('1').save(output_path)
    except IOError:
        print("No se pudo convertir la imagen")

input_image = 'test.jpg'
output_image = 'test.bmp'

convert_to_bitmap(input_image, output_image)