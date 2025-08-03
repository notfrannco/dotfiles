# Folder location to copy
```
on macOS         -> ~/Library/Application Support/Code/User/
on Linux(Fedora) -> ~/.config/Code/User/
```

# Install extension
```
cat extensions.txt | xargs -L 1 code --install-extension
```


# Export extension
```
code --list-extensions > extensions.txt
```

# OBS: On MacOS
Si no se encuentra el comando "code" en el PATH
```
1) Abrir VS Code
2) Presionar cmd+shift+P
3) Escribir "shell command"
4) Click en Install 'code' command in PATH

```
