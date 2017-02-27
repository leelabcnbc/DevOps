#!/usr/bin/env bash

NOTEBOOKPORT=$(shuf -i8888-8899 -n1)
NOTEBOOKPORTHOST=$(hostname -i)
## open a tunnel between compute and login nodes
echo -e "\n"
echo    "  Paste ssh command in a terminal on local host (i.e., laptop)"
echo    "  ------------------------------------------------------------"
echo -e "  ssh -N -L $NOTEBOOKPORT:localhost:$NOTEBOOKPORT $USER@$SLURM_SUBMIT_HOST\n"
echo    "  Open this address in a browser on local host; see token below"
echo    "  ------------------------------------------------------------"
echo -e "  localhost:$NOTEBOOKPORT                                 \n\n"
echo -e 'In the end, run ''kill $(lsof -t -i:'"${NOTEBOOKPORT}) for potential needed cleanup\n"

ssh -N -R $NOTEBOOKPORT:localhost:$NOTEBOOKPORT $SLURM_SUBMIT_HOST
