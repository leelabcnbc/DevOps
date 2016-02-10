#!/usr/bin/env bash

conda create -y --name lab-data-management python=3 nose pip
. activate lab-data-management
pip install pymongo jsonschema rfc3987 strict-rfc3339
