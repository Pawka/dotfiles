import os
from ycmd import utils

GOLANG_ROOT_FILES = ['main.go', 'README.md', 'go.mod']


def Settings(**kwargs):
    """Custom settings per language.

    Golang: default YCM Golang completer detects project root by go.mod file.
    With such configuration gopls can consume all free memory on huge
    repositories. To avoid such situations, project root should be detected by
    extended list of files defined in GOLANG_ROOT_FILES (order is important).
    """
    if kwargs['language'] == 'go':
        filename = kwargs['filename']
        for folder in utils.PathsToAllParentFolders(filename):
            for root_file in GOLANG_ROOT_FILES:
                if os.path.isfile(os.path.join(folder, root_file)):
                    return {'project_directory': folder}
