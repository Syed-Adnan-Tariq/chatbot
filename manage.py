#!/usr/bin/env python3
import os
import sys
api_dir = (os.path.abspath(os.path.join(
    os.path.dirname('__file__'), '.')) + '/ai/packages/')
sys.path.append(api_dir)


if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "temba.settings")
    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
