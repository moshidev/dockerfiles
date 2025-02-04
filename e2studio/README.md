# Motivación Dockerfile e2studio

Desgraciadamente, nuestros scripts de exportación de muchos
de nuestros proyectos dependen en utilizar la CLI de e2studio.

Obliga al desarrollador a ejecutar estos scripts en su ordenador
de trabajo. No tenemos forma de ejecutar el script en un ordenador
remoto y automatizar la publicación de la última versión de un
proyecto en Github Releases.

Como solución proponemos crear un contenedor con una instalación
de e2studio de forma que el script de exportación pueda llamar
bien a la instalación local de E2STUDIO, bien al contenedor Docker,
para compilar los ficheros que son parte de los proyectos e2studio.

## Uso

Ejemplo de uso:

Creación de Workspace Eclipse: `docker run --rm -it -v <full-path to directory to be mounted>:/work/ e2studio --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data /work/.tmpwk -import /work/<project> -no-indexer -markerType cdt`

Compilación de proyecto Eclipse: `docker run --rm -it -v <full-path to directory to be mounted>:/work/ e2studio --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data /work/.tmpwk -cleanBuild <eclipse project name> -no-indexer -markerType cdt`

## Pasos para crear esta imagen Docker

Muy a mi pesar la creación de esta imagen Docker es difícilmente
automatizable. De ahí el que, en vez de ofrecer alguna especie de
script, esté ofreciendo esta secuencia de pasos.

Para estos pasos utilizaremos la versión 2024-10 con el FSP v5.7.0.
La URL de descarga se puede encontrar bien en la página web de Renesas,
bien en el apartado Releases del repositorio dedicado al FSP en
la cuenta de Renesas en Github.

1. Descargar la versión de e2studio que estimemos. Bajo el directorio
   [./resources/](./resources/), ejecutando `make`, podemos descargar
   la versión 2024-10 con el FSP v5.7.0.
2. Instalar e2studio en una máquina Ubuntu 22.04. Seguir [Quick Start Guide for the Linux Hosted Version of the e2 studio](https://www.renesas.com/en/document/mat/quick-start-guide-linux-hosted-version-e-studio?r=488826)
   o bien:
    1. Instalar dependencias libncurses5, libncurses5:i386, libpython3.10, libpython2.7.
    2. chmod +x 'setup_fsp_*.xz.run'
    3. Botón derecho -> Ejecutar como programa.
    4. Seguir los pasos.
3. Localizar dónde se ha instalado la herramienta.
4. Instalar los paquetes FSP que nos interesen.
5. Copiar la carpeta eclipse bajo [./resources/e2studio](./resources/e2studio).
   El binario de e2studio debe quedar bajo `resources/e2studio/eclipse/e2studio`.
6. Ejecutar `make build` en caso de que queramos que la etiqueta
   del contenedor sea e2studio.
