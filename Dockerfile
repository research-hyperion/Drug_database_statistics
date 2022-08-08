FROM python:3.10-bullseye
ARG wolframId
ARG wolframPass
# prepare workdir
WORKDIR /code

# copy python requirements
COPY requirements.txt requirements.txt

#install python requirements
RUN pip3 install -r requirements.txt

# install wolfram engine
RUN apt update && apt install -y curl avahi-daemon wget sshpass sudo locales locales-all ssh vim expect libfontconfig1 libgl1-mesa-glx libasound2

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

RUN wget https://account.wolfram.com/download/public/wolfram-engine/desktop/LINUX && sudo bash LINUX -- -auto -verbose && rm LINUX


CMD ["/usr/bin/wolframscript -username $wolframId -password $wolframPass -version"]

# copy all files into image
COPY . .

# Run execute_script
WORKDIR /code/DrugBank_statistics
RUN chmod +x execute_scripts.sh
RUN ./execute_scripts.sh

WORKDIR /code


