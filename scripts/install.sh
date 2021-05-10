#!/usr/bin/env bash
set -e

export CURRENT_DIR=`realpath $(dirname "$0")`
export PARENT_DIR=`dirname "$CURRENT_DIR"`

if compgen -G "${PARENT_DIR}/dist/*.whl" > /dev/null; then
    echo "Install plugin"
    pip install --no-deps "${PARENT_DIR}/dist/*.whl" --force
else
    pip uninstall airflow-code-editor &>/dev/null
    export PYTHONPATH="${PARENT_DIR}:${PYTHONPATH}"
fi
