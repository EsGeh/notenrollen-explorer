from ..settings import RES_BASE_DIR, XSLT_DIR
from os.path import join


xslt_path = join(XSLT_DIR, "gen_catalogue_html.xslt")
cataloge_index_path = join(RES_BASE_DIR, "all_objects.xml")
basex_uri = "http://basex:8984"

# base64( <user>:<passwd> ) :
login_data = "YWRtaW46YWRtaW4="

def search(keyword):
     return search_by_xpath("//(descriptiveMetadata|actors)//*[matches(text(),'{term}','i')]/ancestor::object".format(term=keyword))

def list_entries(entries_per_page, page):
    xpath_expr = \
        "/notenrollen/object[(position() > {entries_per_page}*{page}) and (position() < ({entries_per_page}*({page}+1)))]" \
        .format( entries_per_page=entries_per_page, page=page )
    # print( xpath_expr )
    return search_by_xpath(xpath_expr)

def get_object_by_id(obj_id):
    print( "get_object_by_id {}".format( obj_id ) )
    return search_by_xpath("//notenrollen/object[@id='{obj_id}']".format(obj_id=obj_id))

def search_by_xpath(xpath_expr):
    import requests as httplib

    url = basex_uri + "/rest/notenrollen/notenrollen_production_data.xml"
    headers={"Authorization": "Basic YWRtaW46YWRtaW4=" }
    params = \
        { "command": "XQUERY " + xpath_expr }

    response = httplib.get(url=url, headers=headers, params=params)
    return response.text
