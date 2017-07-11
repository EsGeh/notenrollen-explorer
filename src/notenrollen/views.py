from .settings import RES_BASE_DIR, XSLT_DIR
from os.path import join
from django.http import HttpResponse
from django.shortcuts import render
# from django.template.loader import render_to_string

from .utils import database, dbpedia_request
from lxml import etree


def index_page(request, **args):
    context = {}
    return render(request, "index.html", context )

def explore(request, **args):

    objectID = request.GET.get("objectID")
    xml_data = database.search(objectID)

    # xml to python:
    from lxml import etree
    # the dummy "root" element is necessary for valid xml:
    source_xml = etree.XML( "<root>" + xml_data + "</root>" )

    entry = {}
    if len(source_xml) == 0:
        raise( "object not found in database" )

    xml_object = source_xml[0]
    entry = xml_object_to_python_dict(xml_object)

    context = {
        "entry": entry
    }

    return render(request, "explore.html", context )

def player(request, **args):
    context = {}
    return render(request, "player.html", context )

def impressum(request, **args):
    context = {}
    return render(request, "impressum.html", context )

def search(request, **args):
    if not "keyword" in request.GET:
        # print( "no keyword" )
        xml_data = database.list_entries(50,0)
    else:
        keyword = request.GET.get("keyword")
        # print( "keyword: {}".format( keyword ) )
        xml_data = database.search( keyword )

    # xml to python:
    from lxml import etree
    # the dummy "root" element is necessary for valid xml:
    source_xml = etree.XML( "<root>" + xml_data + "</root>" )
    search_entries = []
    for xml_object in source_xml:
        entry = xml_object_to_python_dict(xml_object)
        search_entries.append( entry )

    context = {
        "search_entries": search_entries
    }
    return render(request, "search.html", context )


# rest api to ask for search requests:
def search_database(request, **args):
    keyword = args['keyword']
    xmldata=database.search(keyword)
    return HttpResponse(xmldata, content_type='application/xml')


def composer(composer_name, **args):
    name = args['name']
    # name = composer_name.GET.get("name")
    dbpedia_data = dbpedia_request.dbp_request(name)
    composer_details = dbpedia_response_to_dict(dbpedia_data)
    context = {"details": composer_details}
    return render(composer_name, "composer.html", context )



################################################
## utils:
################################################

def xml_object_to_python_dict(xml_object):
    entry = {}
    
    objectID = xml_object.find("descriptiveMetadata/objectID")
    if objectID is not None:
        strObjectID = objectID.text
    else:
        strObjectID = "unknown"
    title = xml_object.find("descriptiveMetadata/title")
    if title is not None:
        strTitle = title.text
    else:
        strTitle = "unknown"
    instrument = xml_object.find("descriptiveMetadata/instrument")
    if instrument is not None:
        strInstrument = instrument.text
    else: strInstrument = "unknown"
    composer = xml_object.find("actors/Komponist")
    if composer is not None:
        strComposer = composer.text
    else: strComposer = "unknown"
    interpreter = xml_object.find("actors/Interpret")
    if interpreter is not None:
        strInterpreter = interpreter.text
    else: strInterpreter = "unknown"

    type = xml_object.find("descriptiveMetadata/objectType")
    if type is not None:
        strType = type.text
    else:
        strType = "unknown"

    description = xml_object.find("descriptiveMetadata/objectDescription")
    strDescription = ""
    if description is not None:
        for term in description:
            if term.text is not None:
                strDescription = strDescription + term.text + "\n"
            else:
                print( "WARNING: empty text field for object {}!".format( strObjectID ) )
                print( etree.tostring( xml_object, pretty_print=True, encoding="unicode") )
    else: strDescription = "unknown"

    actors = xml_object.find("actors")
    strHersteller = ""
    strKomponist = ""
    strInterpret = ""
    if actors is not None:
        for actor in actors:
            if(actor.tag == "Hersteller"):
                strHersteller = strHersteller + actor.text + "\n"
            if(actor.tag == "Komponist"):
                strKomponist = strKomponist + actor.text + "\n"
            if(actor.tag == "Interpret"):
                strInterpret = strInterpret + actor.text + "\n"

        if strHersteller == "":
            strHersteller = "unknown"
        if strKomponist == "":
            strKomponist = "unknown"
        if strInterpret == "":
            strInterpret = "unknown"

    objectData = xml_object.find("objectData")
    images = []
    for image in objectData:
        print(image.text)
        images.append(image.text)

    entry["objectID"] = strObjectID
    entry["title"] = strTitle
    entry["instrument"] = strInstrument
    entry["composer"] = strKomponist
    # entry["composer"] = composer
    entry["interpreter"] = strInterpret
    # entry["interpreter"] = interpreter

    entry["type"] = strType
    entry["description"] = strDescription
    entry["hersteller"] = strHersteller
    entry["images"] = images

    return entry


def dbpedia_response_to_dict(dbpedia_response):
    from lxml import etree
    entry = {}
    xml = etree.XML(dbpedia_response)

    ns = {"d":"http://www.w3.org/2005/sparql-results#", "xsi":"http://www.w3.org/2001/XMLSchema-instance"}

    try:
        entry['name'] = xml.xpath("d:results/d:result/d:binding[@name=\"name\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)
    try:
        entry['gender'] = xml.xpath("d:results/d:result/d:binding[@name=\"gender\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)
    try:
        entry['birth'] = xml.xpath("d:results/d:result/d:binding[@name=\"birth\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)
    try:
        entry['death'] = xml.xpath("d:results/d:result/d:binding[@name=\"death\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)
    try:
        entry['birthplace'] = xml.xpath("d:results/d:result/d:binding[@name=\"birthplace\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)
    try:
        entry['deathplace'] = xml.xpath("d:results/d:result/d:binding[@name=\"deathplace\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)
    try:
        entry['description'] = xml.xpath("d:results/d:result/d:binding[@name=\"description\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)
    try:
        entry['thumbnail'] = xml.xpath("d:results/d:result/d:binding[@name=\"thumbnail\"]/d:literal/text()", namespaces=ns)[0]
    except IndexError as e:
        print(e)

    return entry
