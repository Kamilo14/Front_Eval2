# Usamos una imagen de Python ligera
FROM python:3.9-slim

# Directorio de trabajo
WORKDIR /app

# Instalamos las dependencias directamente
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el resto del código
COPY . .

# Creamos el usuario no root por seguridad (IE1)
RUN useradd -m flaskuser
USER flaskuser

# Comando para ejecutar
CMD ["python", "app.py"]