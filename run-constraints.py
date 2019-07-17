import csv, sqlite3, os, os.path

if __name__ == "__main__":
    conn = sqlite3.connect("db.sqlite", isolation_level=None)
    curs = conn.cursor()
    
    for i in range(1,18):
        print('Now executing constraint %s'%(i))
        print('running script')
        data = curs.execute(open('constraint-%s.sql'%(i)).read())
        print('opening output file')
        file = open('constraint_%s.csv'%(i), 'w')
        writer = csv.writer(file)
        print('writing output')
        writer.writerows(data)
        file.close()
        