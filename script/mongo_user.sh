#!/bin/bash
# MongoDB connection details
ADMIN_USER="abc"
ADMIN_PASS="xyzxyz"
DATABASE="admin"  

# Function to create a new user
create_user() {
    read -p "Enter username: " NEW_USERNAME
    read -s -p "Enter password: " NEW_PASSWORD
    echo     
    read -p "Enter the name of access required database: " DB_NAME
    read -p "Enter the access role read or readWrite: " ACCESS_ROLE
    echo
    mongo -u $ADMIN_USER -p $ADMIN_PASS --authenticationDatabase $DATABASE <<EOF
    use $DB_NAME
    db.createUser({user: "$NEW_USERNAME", pwd: "$NEW_PASSWORD", roles: [{role: "$ACCESS_ROLE", db: "$DB_NAME"}]})
EOF
}

# Function to list all users
list_users() {
    read -p "Enter DATABASE_NAME to list users: " DATABASE_NAME
    echo "------------------------"
    mongo -u $ADMIN_USER -p $ADMIN_PASS --authenticationDatabase $DATABASE <<EOF | grep -o '"user" : "[^"]*"' | awk -F'"' '{print $4}'
    use $DATABASE_NAME
    db.getUsers()
    echo  
EOF
}

# Function to list all databases
list_databases() {
    echo "------------------------"
    mongo -u $ADMIN_USER -p $ADMIN_PASS --authenticationDatabase $DATABASE <<EOF | grep -o '"name" : "[^"]*"' | awk -F'"' '{print $4}'
    db.adminCommand("listDatabases")
EOF
}

# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " DEL_USERNAME
    read -p "Enter DATABASE_NAME to delete users: " DATABASE_NAME
    echo "-------------------------"
    mongo --quiet -u $ADMIN_USER -p $ADMIN_PASS --authenticationDatabase $DATABASE <<EOF
    use $DATABASE_NAME
    db.dropUser("$DEL_USERNAME")
EOF
}

# Main menu
while true; do
    echo 
    echo "Select an action:"
    echo "1. Create a new user"
    echo "2. List all users"
    echo "3. List all databases"
    echo "4. Delete a user"
    echo "5. Exit"
    read -p "Enter your action: " action

    case $action in
        1) create_user ;;
        2) list_users ;;
        3) list_databases ;;
        4) delete_user ;;
        5) break ;;
        *) echo "Invalid choice. Please enter a number from 1 to 5." ;;
    esac
done
