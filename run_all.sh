#!/usr/bin/env bash

conf_json=$1

echo \*\*\* Cleaning logs... \*\*\*
sleep 2
bash scripts/clean_logs.sh
echo \*\*\* Logs cleaned. \*\*\*
sleep 2

echo \*\*\* Generating transaction graph... \*\*\*
sleep 2
python scripts/transaction_graph_generator.py $conf_json
echo \*\*\* Transaction graph successfully generated. \*\*\*
sleep 2

echo \*\*\* Building AMLSim Java source... \*\*\*
sleep 2
bash scripts/build_AMLSim.sh
echo \*\*\* AMLSim build successful. \*\*\*
sleep 2

echo \*\*\* Running AMLSim Java source... \*\*\*
sleep 2
bash scripts/run_AMLSim.sh $conf_json
echo \*\*\* AMLSim Java source executing successful. \*\*\*
sleep 2

echo \*\*\* Converting logs... \*\*\*
sleep 2
python3 scripts/convert_logs.py $conf_json
echo \*\*\* Logs converted. \*\*\*
sleep 2

echo \*\*\* Plotting distributions... \*\*\*
sleep 2
python3 scripts/visualize/plot_distributions.py $conf_json
echo \*\*\* Distribution plotted. \*\*\*
sleep 2

echo \*\*\* Validating transaction subgraphs... \*\*\*
sleep 2
python3 scripts/validation/validate_alerts.py $conf_json
echo \*\*\* Transaction subgraphs validated. \*\*\*
