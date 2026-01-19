# GPU Node - AFK

Sistema para nodo AFK:
- Vast.ai prioridad
- Salad fallback
- OCR jobs escalables
- Linux Ubuntu Server 24.04 + RTX 4060

## Instalación en Linux Server

```bash
git clone https://github.com/TU_USUARIO/gpu-node.git
cd gpu-node
chmod +x scripts/*.sh
Configuración systemd
bash
Copiar código
sudo cp scripts/fallback.sh /scripts/fallback.sh
sudo nano /etc/systemd/system/fallback.service
# Pegar configuración systemd (ver guía)
sudo systemctl daemon-reexec
sudo systemctl enable fallback
sudo systemctl start fallback
yaml
Copiar código

Commit: `Update README.md`

---

# **PASO 3: Clonar el repositorio en Ubuntu Server**

1. Conéctate vía SSH a tu servidor headless.  
2. Instalar Git si no lo tienes:

```bash
sudo apt update
sudo apt install git -y
Clonar repositorio:

bash
Copiar código
cd ~
git clone https://github.com/TU_USUARIO/gpu-node.git
cd gpu-node
Hacer scripts ejecutables:

bash
Copiar código
chmod +x scripts/*.sh
