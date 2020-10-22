#run partition finder
mkdir -p partitionfinder.results && cp aligmnt_COI.py.txt partitionfinder.results
#create cfg file
aligmnt_py=aligmnt_COI.py.txt
branchlengths=linked
model_selection=BIC
gene_len=`head $aligmnt_py -n 1 | awk '{print $2}'`
scheme=greedy

echo '## ALIGNMENT FILE ##' > partitionfinder.results/partition_finder.cfg
echo "alignment = $aligmnt_py;" >> partitionfinder.results/partition_finder.cfg
echo '## BRANCHLENGTHS: linked | unlinked ##' >> partitionfinder.results/partition_finder.cfg
echo "branchlengths = $branchlengths;" >> partitionfinder.results/partition_finder.cfg
echo '' >> partitionfinder.results/partition_finder.cfg
echo '## MODELS OF EVOLUTION: all | allx | mrbayes | beast | gamma | gammai | <list> ##' >> partitionfinder.results/partition_finder.cfg
echo 'models = HKY, HKY+I, HKY+G, HKY+I+G, GTR, GTR+I, GTR+G, GTR+I+G, TrN, TrN+I, TrN+G, TrN+I+G;' >> partitionfinder.results/partition_finder.cfg
echo '' >> partitionfinder.results/partition_finder.cfg
echo '# MODEL SELECCTION: AIC | AICc | BIC #' >> partitionfinder.results/partition_finder.cfg
echo "model_selection = $model_selection;" >> partitionfinder.results/partition_finder.cfg
echo '' >> partitionfinder.results/partition_finder.cfg
echo '## DATA BLOCKS: see manual for how to define ##' >> partitionfinder.results/partition_finder.cfg
echo '[data_blocks]' >> partitionfinder.results/partition_finder.cfg
echo "Gene1_pos1 = 1-$gene_len;" >> partitionfinder.results/partition_finder.cfg
echo '' >> partitionfinder.results/partition_finder.cfg
echo '## SCHEMES, search: all | user | greedy | rcluster | rclusterf | kmeans ##' >> partitionfinder.results/partition_finder.cfg
echo '[schemes]' >> partitionfinder.results/partition_finder.cfg
echo "search = $scheme;" >> partitionfinder.results/partition_finder.cfg
python bin/partitionfinder-2.1.1/PartitionFinder.py partitionfinder.results

#get best scheme
best_scheme=`cat partitionfinder.results/analysis/best_scheme.txt | grep -A 2 Best | grep 1 | awk '{print $3}'`
echo '=============='
echo "$best_scheme"
echo '=============='
