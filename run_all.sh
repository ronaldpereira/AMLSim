#!/usr/bin/env bash

conf_json=$1

echo \*\*\* Generating transaction graph... \*\*\*
python3 scripts/transaction_graph_generator.py $conf_json
echo \*\*\* Transaction graph successfully generated. \*\*\*

echo \*\*\* Building AMLSim Java source... \*\*\*
bash scripts/build_AMLSim.sh
echo \*\*\* AMLSim build successful. \*\*\*

echo \*\*\* Running AMLSim Java source... \*\*\*
bash scripts/run_AMLSim.sh $conf_json
echo \*\*\* AMLSim Java source executing successful. \*\*\*

echo \*\*\* Converting logs... \*\*\*
python3 scripts/convert_logs.py $conf_json
echo \*\*\* Logs converted. \*\*\*

echo \*\*\* Plotting distributions... \*\*\*
python3 scripts/visualize/plot_distributions.py $conf_json
echo \*\*\* Distribution plotted. \*\*\*

echo \*\*\* Validating transaction subgraphs... \*\*\*
python3 scripts/validation/validate_alerts.py $conf_json
echo \*\*\* Transaction subgraphs validated. \*\*\*
