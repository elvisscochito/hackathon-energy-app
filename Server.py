import socket
import tkinter as tk
from tkinter import messagebox

def start_server():
    # Crear el socket del servidor
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    # Enlazar el socket a una dirección IP y puerto
    server_address = ('0.0.0.0', 65432)  # '0.0.0.0' escucha en todas las interfaces de red
    server_socket.bind(server_address)
    
    # Escuchar conexiones entrantes
    server_socket.listen(1)
    print("Servidor esperando conexiones...")
    
    while True:
        # Esperar una conexión
        connection, client_address = server_socket.accept()
        try:
            print(f"Conexión desde {client_address}")
            
            # Recibir datos en bloques de 1024 bytes
            data = connection.recv(1024)
            print(f"Solicitud recibida: {data.decode()}")
            
            def on_button_click(respuesta):
                if respuesta == "¡Si!":
                    messagebox
                elif respuesta == "¡No!":
                    messagebox
                connection.sendall(respuesta.encode())
                root.destroy()

            def auto_select_no():
                on_button_click("¡No!")

            def update_timer():
                nonlocal time_left
                if time_left > 0:
                    time_left -= 1
                    label.config(text=f"¿Sigues ahí? Apagado automático en: {time_left} segundos")
                    root.after(1000, update_timer)
                else:
                    auto_select_no()

            # Crear la ventana principal
            root = tk.Tk()
            root.title("Notificación")
            root.geometry("400x150")

            # Tiempo inicial en segundos
            time_left = 10

            # Etiqueta con el mensaje de la notificación y el temporizador
            label = tk.Label(root, text=f"¿Sigues ahí? Apagado automático en: {time_left} segundos", pady=20)
            label.pack()

            # Botón para la respuesta "Sí"
            yes_button = tk.Button(root, text="¡Sí!", command=lambda: on_button_click("¡Si!"))
            yes_button.pack(side=tk.LEFT, padx=20)

            # Botón para la respuesta "No"
            no_button = tk.Button(root, text="¡No!", command=lambda: on_button_click("¡No!"))
            no_button.pack(side=tk.RIGHT, padx=20)

            # Iniciar el temporizador y la cuenta regresiva
            root.after(1000, update_timer)

            # Iniciar el bucle principal de la ventana
            root.mainloop()
        finally:
            # Cerrar la conexión
            connection.close()

if __name__ == "__main__":
    start_server()
