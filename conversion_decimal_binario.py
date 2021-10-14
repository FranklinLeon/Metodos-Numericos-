from io import open


def float_bin(num, n_flotantes=0):   #funcion que convierte de decimal a binario
    ent, dec = str(num).split(".") #separamos la parte entera de la decimal
    ent = int(ent)
    res = (str(bin(ent)) + ".").replace('0b', '') #convertimos el numero decimal en binario

    for i in range(n_flotantes):
        dec = str('0.') + str(dec) #encadenamos en un string el valor decimal con un "0."
        temp = '%1.20f' % (float(dec) * 2) #convertimos la parte decimal en binario
        ent, dec = temp.split(".")
        res += ent   #unimos la parte entera y decimal (en binario)
    return res




num=float(input("Digite el numero decimal a convertir: "))
print(float_bin(num, n_flotantes=0))
almacenar_datos = open('almacenar_datos_dec_bin.txt','a')
almacenar_datos.write('el numero decimal es: '+str(num)+'\n')
almacenar_datos.write('su conversion a binario es: '+str(float_bin(num, n_flotantes=0))+'\n') 
almacenar_datos.close()