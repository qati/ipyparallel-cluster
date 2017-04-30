#!/bin/bash

rm -r ~/.ipython/profile_job*

source ~/.bashrc

profile=job_${SLURM_JOB_ID}

echo $profile > slurm_profile

echo "Creating profile ${profile}"
ipython profile create --profile=${profile}

ipcontroller --ip="*" --profile=${profile} &

srun ipengine --profile=${profile} --location=$(hostname)