#!/usr/bin/env bash

NOTEBOOKPORT=$(($RANDOM%63000+2001))
NOTEBOOKPORTHOST=$(hostname -i)
## open a tunnel between compute and login nodes
echo -e "\n"
echo    "  Paste ssh command in a terminal on local host (i.e., laptop)"
echo    "  ------------------------------------------------------------"
echo -e "  ssh -L $NOTEBOOKPORT:$NOTEBOOKPORT:$NOTEBOOKPORT $USER@$SLURM_SUBMIT_HOST\n"
echo    "  Open this address in a browser on local host; see token below"
echo    "  ------------------------------------------------------------"
echo -e "  localhost:$NOTEBOOKPORT                                 \n\n"

ssh -R $NOTEBOOKPORT:localhost:$NOTEBOOKPORT $SLURM_SUBMIT_HOST
