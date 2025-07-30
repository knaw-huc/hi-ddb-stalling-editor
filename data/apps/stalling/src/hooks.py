from saxonche import PySaxonProcessor, PyXdmNode
from src.profiles import prof_xml
from fastapi import Request, Response, HTTPException
import toml
import os
import logging
from src.commons import settings, convert_toml_to_xml


def ingest(req:Request, action:str, app: str, prof: str, nr: str, user:str) -> None:
    res = "This will be the response"
    with PySaxonProcessor(license=False) as proc:
        xpproc = proc.new_xpath_processor()
        record_file = f"{settings.URL_DATA_APPS}/{app}/profiles/{prof}/records/record-{nr}.xml"
        node = proc.parse_xml(xml_file_name=record_file)
        xpproc.set_context(xdm_item=node)
        id = xpproc.evaluate_single("string(/*:CMD/*:Components/*:DataEnvelope/*:ID)")
        res = f"<p>Ingest Data Envelop[{id}]</p>"
    return Response(content=res, media_type="text/html")
