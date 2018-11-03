from time import sleep

from fabric.api import *
from fabric.contrib import *

@task
def test_sudo_connection():
    sudo('ls')

@task
def test_connection():
    run('ls')

@task
def docker_compose_deploy(image_tag='latest', file_path='', project_name=''):
    target_file_path = '~/deploy_temp/docker-compose-deploy.yml'
    put(file_path, target_file_path)

    sleep(16)

    with shell_env(DEPLOY_TAG=image_tag):
        run('source /home/tinisi/bin/set-docker-host-env.sh && \
            docker-compose \
            --file {target_file_path} \
            --project-name  {project_name} \
            stop'.format(target_file_path=target_file_path, project_name=project_name))

        run('source /home/tinisi/bin/set-docker-host-env.sh && \
            docker-compose \
            --file {target_file_path} \
            --project-name {project_name} \
            up \
            --detach'.format(target_file_path=target_file_path, project_name=project_name))

