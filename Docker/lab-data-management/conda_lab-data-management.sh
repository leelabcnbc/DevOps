#!/usr/bin/env bash

conda create --name lab-data-management python nose pip enum34
. activate lab-data-management
pip install pymongo jsonschema rfc3987 strict-rfc3339
