# Herramientas

## Burp Suite

### Características

Burp Suite es una herramienta que nos facilita las tareas a la hora de examinar las peticiones web.

La herramienta (principal) que nos ofrece Burp suite es la posibilidad de establecer un proxy entre nuestro equipo y cualquier petición web que realizamos hacia un servidor web.

Esta herramienta nos permite modificar cualquier petición. Además podemos utilizar otras funcionalidades como:

1.- Intruder: Nos permite modificar las peticiones web, por ejemplo, centrándonos en un punto concreto de la petición, de forma que podemos probar diferentes valores. La característica principal es __realizar ataques automatizados__.

2.- Repeater: Nos permite reenviar las peticiones web modificando los valores y observar la respuesta del servidor de forma muy sencilla (sin tener que salid de la aplicación)

3.- Target: Esta funcionalidad nos ofrece la posibilidad de escanear la aplicación web en busca de información sobre la misma

4.- Sequencer: Esta funcionalidad nos permite analizar la _aleatoriedad_ de las partes de la aplicación como los _token de sessión_

5.- Decoder: Nos permite Codificar / Decodificar diferentes Strings (útil por ejemplo para realizar encoding en formularios)

6.- Comparer: Integra la funcionalidad del comando diff para peticiones web

7.- DOM Invader: Nos permite encontrar __vulnerabilidades DOM XSS__ en la web.

8.- Logger: Nos permite tener un control de todas las peticiones hechas por burp suite

### Instalación y configuración

Podemos obtener la version _community__ desde la ![Web oficial de Burp Suite](https://portswigger.net/burp/communitydownload).

Obtendremos un paquete compilado _.jar_ el cual podremos abrir en cualquier sistema que tengamos Java instalado. Desde terminal, podemos usar el comando
````shell
java -jar burp.jar
````
Como resultado obtendremos la posibilidad de crear un proyecto (donde se almacenará toda la información del análisis realizado a una aplicación web). En el caso de realizar pequeñas pruebas, podemos seleccionar la opción de _temporal project_

#### Configurar la funcionalidad proxy
Una vez abierto podemos configurar la funcionalidad de proxy.

En la barra superior tenemos que seleccionar la opción de proxy. Dentro de este menú seleccionamos la opción de _Options_. Obtendremos una ventana igual a la siguiente.
![](../images/web/burp/proxy-options.PNG)

Dentro de la sección __Proxy Listeners__ tendremos que agregar un nuevo elemento.
Al agregar un proxy nuevo tendremos que configurarlo. Lo más importante a configurar es el puerto donde va a escuchar el proxy. Este campo se corresponde al _Bind to Port_ del siguiente formulario.
![](../images/web/burp/proxy-config.PNG)
Por defecto Burp Suite configura el puerto 8080. En el caso de que tengamos corriendo algún servicio en este puerto,puede causar problema por lo cual podemos escoger cualquiera de los disponibles.
Una vez seleccionado el puerto se creará el proxy. Solo quedaía configurarlo dentro de nuestro navegador.

### Configuración de proxy en Firefox

Dentro de Firefox tenemos que irnos a las opciones y seleccionar la funcionalidad de proxy. Introducimos los datos como se muestran en pantalla. __Teniendo en cuenta el puerto que hemos configurado anteriormente en Burp Suite__
![](../images/web/burp/firefox-config.PNG)

Una vez realizado todos los pasos, activamos el modo _intercept_ y obtendremos todos los paquetes que accedamos en el navegador.

![](../images/web/burp/http-capture.PNG)

### Configuración de SSL

Cuando tenemos que atacar cualquier página con SSL. El navegador nos dará un error al estar trabajando con el proxy de Burp Suite (ya que este no tiene SSL configurado)
El error es el siguiente:

![](../images/web/burp/burp-error.PNG)

Para poder solucionar esto, tenemos que generar un certificado CA. Este certificado nos lo genera burp suite en la configuración del proxy.
![](../images/web/burp/proxy-config.PNG)
Tenemos que generar el archivo en _Import/Export CA certificate_. 
Esta opción nos generará un archivo que tendremos que importar posteriormente.
Dentro de esta opción tenemos que exportar el formato como DER
![](../images/web/burp/export.PNG)

Para importar el certificado tenemos que irnos a las opciones del navegador e importarlo dentro de las configuraciones de seguridad.

Al importarlo tendremos el siguiente _Warning_
![](../images/web/burp/import-cer.PNG)
Esto es causado porque el certificado de CA no es aprobado por una entidad reconocida (este generado por nosotros mismos). como sabemos que ester certificado es nuestro, no corremos ningún riesgo y por lo tanto podemos importarlo.
Una vez importado lo tendremos en el listado bajo el nombre PortSwingger
![](../images/web/burp/imported.PNG)

Tenemos que darle a la opción de _edit trust_ y seleccionar ambas opciones.
![](../images/web/burp/trust.PNG)

Con todo esto configurado podremos acceder a cualquier página con SSL capturando las peticiones sin problema.