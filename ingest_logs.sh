DATE=$1  # Accepts date as input (YYYY-MM-DD)
YEAR=$(echo $DATE | cut -d'-' -f1)
MONTH=$(echo $DATE | cut -d'-' -f2)
DAY=$(echo $DATE | cut -d'-' -f3)

# Define HDFS Paths
HDFS_LOGS_DIR="/raw/logs/$YEAR/$MONTH/$DAY/"
HDFS_METADATA_DIR="/raw/metadata/$YEAR/$MONTH/$DAY/"

# Create directories in HDFS
hdfs dfs -mkdir -p $HDFS_LOGS_DIR
hdfs dfs -mkdir -p $HDFS_METADATA_DIR

# Move files from local to HDFS
hdfs dfs -put /local/logs/$DATE/* $HDFS_LOGS_DIR
hdfs dfs -put /local/metadata/$DATE/* $HDFS_METADATA_DIR

echo "Data ingestion complete for $DATE"

