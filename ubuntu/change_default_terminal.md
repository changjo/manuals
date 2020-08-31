# Default Terminal 변경

```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator <terminal-bin-path> 50

sudo update-alternatives --config x-terminal-emulator
```

예:
```bash
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /home/username/.local/bin/kitty 50

sudo update-alternatives --config x-terminal-emulator
```
