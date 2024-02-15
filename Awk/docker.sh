#!/usr/bin/env bash
# Function to run the PostgresSQL query inside the Docker container
docker_run(){
    docker exec -it employees_db psql -U postgres -d employees -tAq <<EOF
SELECT 
    trim(id_employee::text) as id_employee,
    trim(first_name),
    trim(last_name),
    trim(area),
    trim(job_title),
    trim(email),
    trim(phone),
    trim(salary::text) as salary
FROM "employees";
EOF
}
docker_run
exit 0

# dump data from the employees table 
# ./docker.sh > employees.txt