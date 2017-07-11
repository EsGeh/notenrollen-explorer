from ..settings import BASE_DIR

def dbp_request(search_term):
    from SPARQLWrapper import SPARQLWrapper
    import re
    import os.path

    with open(os.path.join(BASE_DIR, "notenrollen", "utils", 'composer_request.sparql') ,'r') as f:
        query = f.read()

    surname = re.match("^\w+[-\s]*\w*", search_term).group(0)
    query = query.replace("SEARCH_TERM", surname)

    sparql = SPARQLWrapper("http://dbpedia.org/sparql")
    sparql.setQuery(query)
    try :
       result = sparql.query()
    except:
       print("dbpedia request failed")

    xml=""
    for line in result:
        xml += line.decode('utf-8')

    return xml
