#!/usr/bin/env bash

echo \*\*\* Cleaning logs... \*\*\*
sleep 2
bash scripts/clean_logs.sh
echo \*\*\* Logs cleaned. \*\*\*
sleep 2

echo \*\*\* Generating transaction graph... \*\*\*
sleep 2
python scripts/transaction_graph_generator.py conf.json
echo \*\*\* Transaction graph successfully generated. \*\*\*
sleep 2

echo \*\*\* Building AMLSim Java source... \*\*\*
sleep 2
bash scripts/build_AMLSim.sh
echo \*\*\* AMLSim build successful. \*\*\*
sleep 2

echo \*\*\* Running AMLSim Java source... \*\*\*
sleep 2
bash scripts/run_AMLSim.sh conf.json
echo \*\*\* AMLSim Java source executing successful. \*\*\*
sleep 2

echo \*\*\* Converting logs... \*\*\*
sleep 2
python3 scripts/convert_logs.py conf.json
echo \*\*\* Logs converted. \*\*\*
sleep 2

echo \*\*\* Plotting distributions... \*\*\*
sleep 2
python3 scripts/visualize/plot_distributions.py conf.json
echo \*\*\* Distribution plotted. \*\*\*
