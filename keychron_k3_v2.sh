# A série de teclados Keychron utiliza do driver hid_apple (tanto no modo windows quanto no macos), em ambos modo bluethooth e a cabo.
# Por padrão esse modo usa as teclas FN no modo multimidia, sendo necessário pressionar fn + tecla para ter seu comportamento original
# No meu caso, mesmo pressionando Fn+Fx elas não estavam funcionando. Sendo necessário realizar algumas configurações para corrigir o comportamento
# https://gist.github.com/andrebrait/961cefe730f4a2c41f57911e6195e444

echo "2" | sudo tee /sys/module/hid_apple/parameters/fnmode
