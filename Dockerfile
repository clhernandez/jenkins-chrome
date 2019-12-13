FROM jenkins/jenkins:lts
# run as root
USER root

#descargar chrome
RUN wget http://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# el exit 0 es para que docker piense que chrome se instalo bien (aunque le falten dependencias)
RUN dpkg -i google-chrome-stable_current_amd64.deb; exit 0

#actualizar e instalar dependencias
RUN apt update --fix-missing
RUN apt install -fy

#verificar que este chrome y java instalado
RUN google-chrome --version && java -version

USER jenkins
RUN echo "Build number: $buildno"