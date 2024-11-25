FROM python:3.12
RUN apt-get update && apt-get upgrade -y
RUN apt install git neovim curl zsh -y
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
RUN chsh -s $(which zsh)


ENV AppHome=/usr/src/app
WORKDIR $AppHome

ENV PYTHONUNBUFFERED 1
COPY . $AppHome
RUN pip install -r requirements.txt


# docker network create dsp
# docker network connect dsp dsp-py
# Connect nerwork if you need it
# docker network connect dsp dsp
# docker start dsp-py
# docker rm -f dsp-py && docker image rm dsp-web && docker compose up -d

