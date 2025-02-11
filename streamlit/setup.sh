#!/bin/bash

conda init
source ~/.bashrc
conda create -n stenv python=3.9 --yes
conda activate stenv
pip install streamlit