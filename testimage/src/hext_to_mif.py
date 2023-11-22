import sys

def create_32_bit_hex_codes():
    with open('hexcode.txt', 'r') as entrada:
        contenido = entrada.read().replace(' ', '').upper()
    
    conjuntos = [contenido[i:i+8] for i in range(0, len(contenido), 8)]

    with open('hexcode.txt', 'w') as salida:
        for conjunto in conjuntos:
            salida.write(conjunto + '\n')


def read(file_in):
    with open(file_in) as f:
        return [int(i, 16) for i in f if len(i)!= 0]

def write(file_out, data, width = 32, depth = 2048):
    if len(data) > depth:
        print('Data larger than memory suze, abort.')
    
    else:
        buf = 'WIDTH={:d};\nDEPTH={:d};\nADDRESS_RADIX=UNS;\nDATA_RADIX=UNS;\nCONTENT BEGIN\n'.format(width, depth)
        l_index = str(len('{:x}'.format(depth)))
        l_data = str(int(width / 4))
        s = '\t{:0' + l_index + 'X} : {:0' + l_data + 'X};\n'
        for i, j in enumerate(data):
            buf += s.format(i, j)
        
        if len(buf) == depth - 1:
            buf += s.format(depth - 1, 0)
        elif len(buf) < depth - 1:
            buf += ('\t[{:0' + l_index + 'X}..{:0' + l_index + 'X}] : {:0' + l_data + 'X};\n').format(len(data), depth - 1, 0)
        buf += 'END;\n'
        
        with open(file_out, 'w') as f:
            f.write(buf)

def convert(file_in, file_out):
    write(file_out, read(file_in))

convert('hexcode.txt', 'ROM.mif')