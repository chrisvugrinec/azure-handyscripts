az vm list --query "[].{Group:resourceGroup,Name:name}" -o tsv | while read LINE
do
   node=$(echo $LINE | awk '{ print $2 }')
   group=$(echo $LINE | awk '{ print $1 }')
   echo "Stopping VM: $node from group $group"
   az vm stop --name $node -g $group </dev/null &>/dev/null & done
done
