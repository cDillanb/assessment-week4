log_file = open("um-server-01.txt") # Opens the um-server-01.txt file and calls it log_file


def sales_reports(log_file): # defines a function and names it sales_reports, which has a perameter called log_file
    for line in log_file: # For every line(value) in log_file(whatever we passed into the function) do something
        line = line.rstrip() # rstrip without any argument removes any trailing spaces from the end of a string
        day = line[0:3] # defines a new variable named day and sets it equal to index 0-3 in line
        if day == "Mon": # if day is equal to the string "Tue" then do something
            print(line) # print the contents of line to the console

sales_reports(log_file) # calls upon the sales_reports function and passes in log_file we defined earlier



# for some reason this only works if I dont run the other function, cant figure out why
def melons_check(log_file):
    for line in log_file:
        line = line.rstrip()
        melon_count = line[16:18]
        melon_count = int(melon_count)
        if melon_count > 10:
            print(line)


melons_check(log_file)

log_file.close()