# Now, it’s time to fix app.js by modifying /usr/bin/book-publisher.sh script.

# We want to include a sed command in the book-publisher.sh script to replace all occurrences of the string pdf with txt.

# After making the required changes, make sure to execute the script to verify the same. You should execute the script as below:

# /usr/bin/book-publisher.sh "https://github.com/kodekloudhub/kodekloud-lab-book-publisher.git"
# Note: In case you see below error while running the app:

# events.js:174
#       throw er; // Unhandled 'error' event
#       ^
# Error: listen EADDRINUSE: address already in use :::3000
#     at Server.setupListenHandle [as _listen2] (net.js:1280:14)
#     at listenInCluster (net.js:1328:12)
#     at Server.listen (net.js:1415:7)

# Execute below command:

# kill -9 $(ps -e | grep node | sed 's/^[ \t]*//' | cut -d ' ' -f1)


#!/usr/bin/env bash

# Check if exactly one command line argument is passed
if [[ $# -ne 1 ]]; then
    echo "Error: Git project not specified or too many arguments"
    exit 1
fi

project=${1}
project_dir="$(basename "${project}" .git)"

clone_project() {
    if [[ ! -d "${project_dir}" ]]; then
        git clone ${1}
    fi
}

clone_project "${project}"

# Change to the project directory
cd "${project_dir}"

# Install the project dependencies
npm install

# Your sed to replace all occurrences of the 'pdf' string to 'txt'
sed -i 's/pdf/txt/g' app.js

# Modify the /usr/bin/book-publisher.sh script by adding two sed commands to swap the color black to white and white to black.
# Execute the /usr/bin/book-publisher.sh again using below command, and verify if the changes were made to the landing page.
# A line selector in sed with a substitute function, should be expressed just before the s (substitute) function, inside the script block:

# sed -i '<yourlinenumber>s/value/replacement/' file

# Replace the occurrence of the #000000 color with #FFFFFF
sed -i '25s/000000/FFFFFF/' app.js

# Replace just the second occurrence of the #FFFFFF color with #000000 to complete the swap.
sed -i '25s/FFFFFF/000000/2' app.js

# Run the application
node app.js