# lua nvim
Mi configuracion de nvim utilizando [lazy.nvim](https://github.com/folke/lazy.nvim) 
Es un copy-paste de muchas configuraciones que han compartido otros, pero esta es una versión minimalista con 
el menor número de plugins, sin muchos elementos de GUI como: Buffer o Status Lines, GUI para GIT, Which Key, pantalla de bienvenida, etc. 


Debemos instalar primero nvim 

https://github.com/neovim/neovim/blob/master/INSTALL.md

En caso de no haberlo hecho antes, instalamos:

* [Nerd Fonts](https://www.nerdfonts.com/). Una buena fuente es [DejaVuSans](https://www.programmingfonts.org/#dejavu).
* [Finder](https://github.com/sharkdp/fd),
* [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation)

Corremos `nvim` y el comando:  

```:echo stdpath("config")```

Creamos un link simbólico al directorio, especificando como <Target> el contenido de este repositorio.
Por ejemplo en Windows desde `cmd.exe`:

```
mklink /D C:\Users\mario\AppData\Local\nvim C:\Users\mario\lua-nvim
```

![Screen Shot Windows con Catppuccin](./img/windows.png?raw=true "En Windows, `colorscheme`: catppuccin")
