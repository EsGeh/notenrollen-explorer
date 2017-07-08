from ..settings import RES_BASE_DIR, XSLT_DIR
from os.path import join


xslt_path = join(XSLT_DIR, "gen_catalogue_html.xslt")
cataloge_index_path = join(RES_BASE_DIR, "all_objects.xml")
basex_uri = "http://basex:8984"

# base64( <user>:<passwd> ) :
login_data = "YWRtaW46YWRtaW4="

def search(keyword):
    return search_by_xpath("//*[contains(text(),${term},'i')]/../..".format(term=keyword))

def list_entries(entries_per_page, page):
    xpath_expr = "/notenrollen/object[position() &lt; 5]"
    return search_by_xpath(xpath_expr)

def search_by_xpath(xpath_expr):
    import requests as httplib
    url = basex_uri + "/rest/notenrollen/notenrollen_production_data.xml"
    headers={"Authorization": "Basic YWRtaW46YWRtaW4=", "request": xpath_expr }
    response = httplib.get(url=url, headers=headers)
    return response.text
