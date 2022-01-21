from io import open

def float_bin(num, places=3):   #funcion que convierte de decimal a binario
    ent, dec = str(num).split(".") #separamos la parte entera de la decimal
    ent = int(ent)
    res = (str(bin(ent)) + ".").replace('0b', '') #convertimos el numero decimal en binario

    for i in range(places):
        dec = str('0.') + str(dec) #encadenamos en un string el valor decimal con un "0."
        temp = '%1.20f' % (float(dec) * 2) #convertimos la parte decimal en binario
        ent, dec = temp.split(".")
        res += ent   #unimos la parte entera y decimal (en binario)
    return res


def IEEE754(n): #funcion que identifica el signo del numero decimal, calcula la matisa, el exponente y los une,
    sign = 0    #para formar la notacion IEEE 754
    if n < 0:
        sign = 1
        n = n * (-1)
    p = 30

    dec = float_bin(n, places=p) #convierte de flotante a binario

    dotPlace = dec.find('.')
    onePlace = dec.find('1')

    if onePlace > dotPlace: #calcula la matisa
        dec = dec.replace(".", "")
        onePlace -= 1
        dotPlace -= 1
    elif onePlace < dotPlace:
        dec = dec.replace(".", "")
        dotPlace -= 1
    mantisa = dec[onePlace + 1:]

    exp = dotPlace - onePlace #calcula el exponente
    exp_bits = exp + 127

    exp_bits = bin(exp_bits).replace("0b", '') #convierte el exponente de decimal a binario

    mantisa = mantisa[0:23]

    final = str(sign) + "-" + exp_bits.zfill(8) + "-" + mantisa #unimos las tres partes para formar la notacion IEEE 754

    return (final)


num=float(input("Digite el numero decimal a convertir: "))
print(IEEE754(num))
almacenar_datos = open('almacenar_datos_float_bin.txt','a')
#almacenar_datos.write('el numero decimal es: '+str(num)+'\n')
almacenar_datos.write(str(IEEE754(num))+'\n') 
almacenar_datos.close()



