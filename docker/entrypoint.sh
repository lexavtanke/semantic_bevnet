#!/bin/bash
cd /workspace/spconv && python setup.py bdist_wheel  && cd dist && pip install *.whl
cd /workspace
/bin/bash "$@"