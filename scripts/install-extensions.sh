chmod +x install-extensions.sh
while read -r ext; do
    [[ -z "$ext" || "$ext" =~ ^# ]] && continue
    code --install-extension "$ext"
done < extensions.txt
