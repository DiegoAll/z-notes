# Git repo filter


sudo apt install git-filter-repo  # Ubuntu/Debian
brew install git-filter-repo      # macOS
2️⃣ Cambiar el email y nombre en todos los commits
Ejecuta el siguiente comando, reemplazando los valores por los nuevos:

bash
Copiar
Editar
git filter-repo --commit-callback '
    if commit.author_email == b"antonioluciovivaldi4seasons@gmail.com":
        commit.author_email = b"nuevo@email.com"
        commit.author_name = b"NuevoUsuario"
    if commit.committer_email == b"antonioluciovivaldi4seasons@gmail.com":
        commit.committer_email = b"nuevo@email.com"
        commit.committer_name = b"NuevoUsuario"
'
3️⃣ Forzar el push al repositorio remoto
Si el repositorio ya ha sido subido a un remoto (origin), debes sobrescribir la historia con:

bash
Copiar
Editar
git push origin --force --all
git push origin --force --tags