# How to create/update stallings records via JSON

## new

```sh
$ ./new.sh new.json
{"message":"app[stalling] prof[clarin.eu:cr1:p_1708423613607] record[14] created","nr":14,"when":"1754299478"}
```

gives you the info to update the record later:
- the `nr` of the record, i.e. `14`
- the epoch of this (first) version , i.e. `1754299478`

## update

```sh
$ ./update.sh 14 1754299478 update.json
{"message":"App[stalling] record[14] modified","when":"1754299661"}
```

gives you the new epoch for a next update, i.e. `1754299661`

## retrieve

```sh
$ ./retrieve.sh 14
<?xml version="1.0" encoding="UTF-8"?><cmd:CMD xmlns:cmd="http://www.clarin.eu/cmd/1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.clarin.eu/cmd/1 https://infra.clarin.eu/CMDI/1.x/xsd/cmd-envelop.xsd http://www.clarin.eu/cmd/1/profiles/clarin.eu:cr1:p_1708423613607 http://catalog.clarin.eu/ds/ComponentRegistry/rest/registry/1.2/profiles/clarin.eu:cr1:p_1708423613607/xsd" CMDVersion="1.2">
   <cmd:Header>
      <cmd:MdCreator>server</cmd:MdCreator>
      <cmd:MdCreationDate xmlns:clariah="http://www.clariah.eu/" clariah:epoch="1754299661">2025-08-04</cmd:MdCreationDate>
      <cmd:MdSelfLink>unl://14</cmd:MdSelfLink>
      <cmd:MdProfile>clarin.eu:cr1:p_1708423613607</cmd:MdProfile>
      <cmd:MdCollectionDisplayName/>
   </cmd:Header>
    ...
```

If you need to find the epoch of a record its in the `clariah:epoch` attribute of the `cmd:MdCreationDate` in the record header.