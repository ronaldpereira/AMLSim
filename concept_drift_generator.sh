sh run_all.sh paramFiles/concept_drift/conf1.json
sh run_all.sh paramFiles/concept_drift/conf2.json
sh run_all.sh paramFiles/concept_drift/conf3.json

mkdir -p outputs/concept_drift
touch outputs/concept_drift/transactions.csv

cat outputs/concept_drift-01-04/transactions.csv > outputs/concept_drift/transactions.csv
cat outputs/concept_drift-05-08/transactions.csv >> outputs/concept_drift/transactions.csv
cat outputs/concept_drift-09-12/transactions.csv >> outputs/concept_drift/transactions.csv
