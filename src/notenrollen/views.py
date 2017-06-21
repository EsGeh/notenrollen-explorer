from .settings import BASE_DIR
from os.path import join
from django.http import HttpResponse


RES_BASE_DIR = "/res"

xslt_path = join(RES_BASE_DIR, "gen_catalogue_html.xslt")
cataloge_index_path = join(RES_BASE_DIR, "index.xml")

def gen_catalogue(request):
    from lxml import etree

    transformation = etree.XSLT(etree.parse(xslt_path))
    source_xml = etree.parse(cataloge_index_path)
    ret_xml = transformation(source_xml)

    return HttpResponse(etree.tostring(ret_xml))
