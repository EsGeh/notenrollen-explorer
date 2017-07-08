from .settings import RES_BASE_DIR, XSLT_DIR
from os.path import join
from django.http import HttpResponse
from django.shortcuts import render
# from django.template.loader import render_to_string

from .utils import database


xslt_path = join(XSLT_DIR, "gen_catalogue_html.xslt")


def index_page(request, **args):
    context = {}
    return render(request, "index.html", context )

def explore(request, **args):
    context = {}
    return render(request, "explore.html", context )

def search(request, **args):
    if not "keyword" in request.GET:
        # print( "no keyword" )
        xml_data = database.list_entries(50,0)
    else:
        keyword = request.GET.get("keyword")
        # print( "keyword: {}".format( keyword ) )
        xml_data = database.search( keyword )

    # print( "xml response:" )
    # print( xml_data )

    # xml to python:
    from lxml import etree
    # the dummy "root" element is necessary for valid xml:
    source_xml = etree.XML( "<root>" + xml_data + "</root>" )
    search_entries = []
    for xml_object in source_xml:
        entry = {}

        title = xml_object.find("descriptiveMetadata/title")
        if title is not None:
            title = title.text
        else:
            title = "unknown"
        instrument = xml_object.find("descriptiveMetadata/instrument")
        if instrument is not None:
            instrument = instrument.text
        else: instrument = "unknown"
        composer = xml_object.find("actors/Komponist")
        if composer is not None:
            composer = composer.text
        else: composer = "unknown"
        interpreter = xml_object.find("actors/Interpret")
        if interpreter is not None:
            interpreter = interpreter.text
        else: interpreter = "unknown"

        entry["title"] = title
        entry["instrument"] = instrument
        entry["composer"] = composer
        entry["interpreter"] = interpreter
        search_entries.append( entry )

    context = {
        "search_entries": search_entries
    }
    return render(request, "search.html", context )

def quiz(request, **args):
    context = {}
    return render(request, "quiz.html", context )


# rest api to ask for search requests:
def search_database(request, **args):
    keyword = args['keyword']

    xmldata=database.search(keyword)
    return HttpResponse(xmldata, content_type='application/xml')

def gen_catalogue(request, **args):
    from lxml import etree
    import requests as httplib

    transformation = etree.XSLT(etree.parse(xslt_path))
    url = basex_uri + "/rest/notenrollen/all_objects.xml"
    headers={"Authorization": "Basic YWRtaW46YWRtaW4=", "request": "/" }
    response = httplib.get(url=url, headers=headers)
    source_xml = etree.XML( response.text )

    # source_xml = etree.parse(cataloge_index_path)
    catalog_html = transformation(source_xml, **args)

    context = {
        'catalog_html' : catalog_html
    }

    return render(request, "main.html", context )
