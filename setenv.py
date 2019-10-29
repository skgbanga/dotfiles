#!/usr/bin/env python

import argparse

ROOT='/home/sandeep/workspace/'

def conda_command(env):
    profile = env.rsplit('-', 1)[-1]  # maxsplit
    return 'source activate {}'.format(profile)

def ld_library_path(env):
    paths = []
    env_path = env.replace('-','/')

    # add standard libstdc++ symbol names (e.g. GLIBCXX_3.4)
    std_lib_path = '/opt/vatic/gcc/gcc-7.2.0/lib64/'
    paths.append(std_lib_path)

    # add third party libs (like libboost_filesystems.so)
    third_party_libs = '{}{}/tools/lib/'.format(ROOT, env_path)
    paths.append(third_party_libs)

    return ':'.join(paths)

def python_path(env):
    paths = []
    env_path = env.replace('-','/')

    # python modules so that imports work fine
    py_modules_path='{}{}/src/py'.format(ROOT, env_path)
    paths.append(py_modules_path)

    # python modules so that c++ imports work fine (verax_pydl)
    # both for release and cl-debug
    cpp_path='{}{}/build/{}/lib'
    paths.extend([cpp_path.format(ROOT, env_path, 'release'),
        cpp_path.format(ROOT, env_path, 'cl-debug')])

    # add infra's python modules at the end for qr2 repo
    infra_path = '{}{}/extern/infra/python'.format(ROOT, env_path)
    paths.append(infra_path)

    return ':'.join(paths)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('env', help='name of the env you want to activate')
    args = parser.parse_args()

    cmds = [conda_command(args.env),
            'export LD_LIBRARY_PATH={}'.format(ld_library_path(args.env)),
            'export PYTHONPATH={}'.format(python_path(args.env))
            ]
    print ';'.join(cmds)
