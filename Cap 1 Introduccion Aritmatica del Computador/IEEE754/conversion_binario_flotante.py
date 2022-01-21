from io import open


def binario_flotante(mantisa_str):
    potencia = -1
    mantisa_entero = 0
    for i in mantisa_str:
        mantisa_entero += (int(i) * pow(2, potencia)) #recorremos la mantisa y convertimos a decimal
        potencia -= 1
    return (mantisa_entero + 1)
 



ieee_32 = input('ingrese el numero binario separando el signo, exponente y la mantisa: ')
almacenar_datos = open('almacenar_datos_bin_float.txt','a')
sign_bit = int(ieee_32[0])
exp_sesgado = int(ieee_32[2 : 10], 2)
exp_no_sesgado = exp_sesgado - 127
mantisa_str = ieee_32[11 : ]

mantisa_entero = binario_flotante(mantisa_str)
real_no = pow(-1, sign_bit) * mantisa_entero * pow(2, exp_no_sesgado)
print("El valor float de la representación IEEE-754 dada es:",real_no)
almacenar_datos.write("El binario dado es:"+ieee_32+'\n')
almacenar_datos.write("El valor float de la representación IEEE-754 dada es:"+str(real_no)+'\n')
almacenar_datos.write("\n")
almacenar_datos.close()
