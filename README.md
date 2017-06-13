# Set Up a Development Environment

## About

This is a set of scripts for setting up a light-weight host machine that runs docker shells for particular development environments. The only applications installed on host are `vim`, `git`, `tmux`, and `docker`. Any other applications or resources needed for development are installed in dedicated docker conatiners. 

## Files

The root directory contains files for the host machine as well as files for a docker container. 

### Host

- `host-setup.sh` should be run once to initialize the host machine. It installs `vim`, `git`, `tmux`, and `docker`. It also clones a git repository containing dotfiles and places creates a basic `vimrc` file at `~/.vimrc`.
- `start-env.sh` is a short script to pull the latest docker image from the docker repository and run the docker container. The `run` command mounts the current host directory as a volume in the container at `/src`. The docker image should be changed to the appropriate one for your preferred environment. 
- `docker-cleaner.sh` is a short script that removes any exited containers and any dangling images from the host machine to save space. 

### Docker Container

- `conda-environment.yml` is a sample of an Anaconda3 environment containing a few standard python libraries. This particular file is a clone of the Udacity AI Nanodegree Anaconda environment. This may be used in a docker container with an Anaconda installation for further environment control. 

## Instructions
1. Clone this repository. 
2. Run 
    ```shell
    cd dev-env
    chmod +x host-setup.sh
    ./host-setup.sh
    ```
3. Edit `start-env.sh` to use your chosen Docker image 
4. Run `./start-env.sh` or a custom `docker run` command to start the container.
5. Install necessary applications and dotfiles to the docker container (if the image doesn`t have them already). 
6. Enjoy!

7. If any changes are made to the docker container during the session, and you want to save them, run the following in a separate terminal session on host: 
    ```shell
    sudo docker container ls
    ``` 
Find the ID of the container you are running. 
    ```shell 
    sudo docker commit <container ID> <repo name>/<image name>
    sudo docker push <repo name>/<image name>[:TAG]
    ```
You can then close the container. 

8. You may wish to run `docker-cleaner.sh` on host after closing the container to free space on host. 
