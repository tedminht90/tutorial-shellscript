# <count> ERROR: DB_CONN_FAILURE: Connection to database failed

# cat ${logfile} | grep DB_CONN_FAILURE | sort | uniq -c

#!/usr/bin/env bash

set -o pipefail

# This is the log file we're interested in
logfile="/etc/logs/error.log"

echo "Number of times each error message appears:"
cat "${logfile}" | grep "ERROR" | sort  | uniq  -c ||{ echo "Error encountered in pipe commands" >&2; exit 1; }

exit 0