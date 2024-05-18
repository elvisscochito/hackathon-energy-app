import socket
import subprocess
import random
import tkinter as tk
from tkinter import messagebox

def generar_casos_prueba(num_casos=100):
    casos_prueba = []
    for _ in range(num_casos):
        valor = random.uniform(-100, 700)
        casos_prueba.append(valor)
    return casos_prueba

def evaluar_casos(casos_prueba):
    for i, valor in enumerate(casos_prueba):
        if valor < 45 or valor > 600:
            if 0.1 <= valor <= 11:
                enviar_peticion_apagar(i, valor)

def enviar_peticion_apagar(indice, valor):
    print(f"Petición al servidor para apagar el equipo. Caso {indice + 1}: valor = {valor}")
    message = "Apagar para ahorrar energia"
    client_socket.sendall(message.encode())
    data = client_socket.recv(1024)
    if data.decode() == "¡No!":
        def update_timer():
            global time_left
            if time_left > 0:
                time_left -= 1
                label.config(text=f"¿Sigues ahí? Apagado automatico en: {time_left} segundos")
                root.after(1000, update_timer)
        subprocess.run("shutdown -s")

        # Crear la ventana principal
        root = tk.Tk()
        root.title("Notificación")
        root.geometry("400x150")

        # Tiempo inicial en segundos
        # Etiqueta con el mensaje de la notificación y el temporizador
        label = tk.Label(root, text=f"Tu electrodomestico se va a apagar en: {time_left} segundos", pady=20)
        label.pack()
        # Iniciar el temporizador y la cuenta regresiva
        root.after(1000, update_timer)

        # Iniciar el bucle principal de la ventana
        root.mainloop()
    else:
        print("Permiso denegado por el servidor.")

# Crear el socket del cliente
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Conectar al servidor
server_address = ('localhost', 65432)
client_socket.connect(server_address)

try:
    # Generar y evaluar casos de prueba
    casos_prueba = generar_casos_prueba()
    evaluar_casos(casos_prueba)
finally:
    # Cerrar la conexión
    client_socket.close()
