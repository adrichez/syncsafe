<p align="center">
  <img src="assets/cover.png" alt="SyncSafe Banner" style="width:100%">
</p>

<div align="center">
  <h1><span style="color: #6bafae;">Copia y mueve carpetas de forma segura y controlada usando Bash y rsync</span></h1>

  <hr style="border:none; height:0.3px; background-color:#777; width:65%; margin:30px auto 35px auto;">

  <p>
    <a href="https://www.gnu.org/software/bash/"><img src="https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnubash&logoColor=white" alt="Bash"></a>
    <a href="https://rsync.samba.org/"><img src="https://img.shields.io/badge/rsync-000000?style=flat&logo=linux&logoColor=white" alt="rsync"></a>
    <a href="https://www.apple.com/macos/"><img src="https://img.shields.io/badge/macOS-000000?style=flat&logo=apple&logoColor=white" alt="macOS"></a>
    <a href="https://git-scm.com/"><img src="https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white" alt="Git"></a>
    <a href="https://github.com/"><img src="https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white" alt="GitHub"></a>
    <a href="https://www.markdownguide.org/"><img src="https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white" alt="Markdown"></a>
  </p>

  <p>
    <a href="## 📄 Descripción">Descripción</a> •
    <a href="## 📂 Estructura del Repositorio">Estructura</a> • 
    <a href="## ⚙️ Requisitos">Requisitos</a> • 
    <a href="## 💻 Instalación">Instalación</a> • 
    <a href="## 🚀 Uso">Uso</a> • 
    <a href="## 📝 Notas">Notas</a> • 
    <a href="## 📌 Opcional">Opcional</a>
    <a href="## 🔧 Licencia">Licencia</a>
  </p>
</div>






<br>

---

## 📄 Descripción

**SyncSafe** es un script interactivo en **Bash** diseñado para **copiar o mover carpetas completas de forma segura** utilizando `rsync`.

Está pensado para escenarios reales como:
- Copias de seguridad a discos externos
- Migración de carpetas grandes (decenas de GB)
- Trabajo diario con carpetas que contienen **todos tus documentos**
- Rutas con espacios o comillas

El script guía al usuario paso a paso, valida las rutas introducidas y solicita confirmación antes de ejecutar cualquier operación potencialmente crítica.






<br>

---

## 📂 Estructura del Repositorio

```plaintext
syncsafe/
├── assets               # Imagen de portada y recursos visuales
├── syncsafe.sh          # Script principal en Bash
├── README.md            # Documentación del proyecto
├── .gitignore           # Archivos a ignorar por Git
└── LICENSE              # Licencia del proyecto
```






<br>

---

## ⚙️ Requisitos

* Bash (preinstalado en macOS y la mayoría de sistemas Linux)
* `rsync`

Comprobar que `rsync` está disponible:

```bash
rsync --version
```

> No se requieren dependencias adicionales ni lenguajes externos.






<br>

---

## 💻 Instalación

1. **Clonar el repositorio:**

```bash
git clone https://github.com/tu-usuario/syncsafe.git
cd syncsafe
```

2. **Dar permisos de ejecución al script:**

```bash
chmod +x syncsafe.sh
```

Con esto el script queda listo para usarse.






<br>

---

## 🚀 Uso

Ejecuta el script desde la terminal:

```bash
./syncsafe.sh
```

El script te pedirá de forma interactiva:

1. **Ruta completa de la carpeta de origen**
2. **Ruta completa de la carpeta de destino**
3. **Tipo de operación**

   * Copiar
   * Mover
4. Confirmación antes de ejecutar

**Ejemplo de interacción:**

```plaintext
📂 Ruta de origen: '/Users/Usuario/Carpeta'
📁 Ruta de destino: /Volumes/Documentos

¿Qué desea hacer?
  1) Copiar
  2) Mover

¿Está seguro de que desea continuar? (s/n)
```

### 🔹 Comportamiento importante

* La **carpeta completa** se copia o mueve (no solo su contenido).
* Si la carpeta ya existe en destino, `rsync` sincroniza de forma segura.
* Compatible con rutas con espacios y comillas.






<br>

---

## 📝 Notas

* El script elimina automáticamente comillas simples y dobles introducidas por el usuario.
* Usa `rsync -avh --progress` para máxima seguridad y visibilidad.
* Ideal para carpetas grandes (decenas o cientos de GB).
* Antes de mover, se recomienda probar primero con la opción de copia.
* Funciona especialmente bien en **macOS**.






<br>

---

## 📌 Opcional

Para poder ejecutar el script desde cualquier ubicación:

1. Moverlo a un directorio del PATH, por ejemplo:

```bash
sudo mv syncsafe.sh /usr/local/bin/syncsafe
```

2. Ejecutarlo desde cualquier sitio:

```bash
syncsafe
```






<br>

---

## 🔧 Licencia

Este proyecto es de código abierto bajo la **Licencia MIT**.
Libre para usar, modificar y compartir.
