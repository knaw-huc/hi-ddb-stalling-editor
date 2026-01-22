from saxonche import PySaxonProcessor, PyXdmNode
from src.profiles import prof_xml
from fastapi import Request, Response,  HTTPException
from fastapi.encoders import jsonable_encoder
from starlette.responses import HTMLResponse,  JSONResponse, RedirectResponse
from datetime import datetime
from time import strftime, localtime

import toml
import os
import json
import math
import logging
import glob
import operator

from src.records import rec_history

from src.commons import settings, convert_toml_to_xml, def_user
# Configure basic logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)
# Create a logger instance
logger = logging.getLogger(__name__)


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

def validation(req:Request,action: str, app: str, prof: str, nr: str, user:str) -> None:
    res = "This will be the response"
    res = to_validation_report(app,prof,nr)
    return Response(content=res, media_type="application/xml")
    

def to_validation_report(app: str,prof: str,nr: str):
    with PySaxonProcessor(license=False) as proc:
        xpproc = proc.new_xpath_processor()
        xpproc.set_cwd(os.getcwd())
        xsltproc = proc.new_xslt30_processor()
        xsltproc.set_cwd(os.getcwd())
        executable = xsltproc.compile_stylesheet(stylesheet_file=f"{settings.URL_DATA_APPS}/{app}/resources/xslt/validation.xsl")
        executable.set_parameter("cwd", proc.make_string_value(os.getcwd()))
        executable.set_parameter("app", proc.make_string_value(app))
        config_app_file = f"{settings.URL_DATA_APPS}/{app}/config.toml"
        convert_toml_to_xml(toml_file=config_app_file,xml_file=f"{settings.URL_DATA_APPS}/{app}/config.xml")
        config = proc.parse_xml(xml_file_name=f"{settings.URL_DATA_APPS}/{app}/config.xml")
        executable.set_parameter("config", config)
        tweak = prof_xml(app, prof)
        tweak = proc.parse_xml(xml_text=tweak)
        executable.set_parameter("tweak", tweak)
        if nr:
            executable.set_parameter("nr", proc.make_string_value(nr)) 
        null = proc.parse_xml(xml_text="<null/>")
        return executable.transform_to_string(xdm_node=null)

# def history(req:Request,action: str, app: str, prof: str, nr: str, user:str) -> None:
#     logger.debug("History endpoint accessed")
#     print(user, nr, prof, app, action, req)
#     return rec_history(app,prof,nr)

