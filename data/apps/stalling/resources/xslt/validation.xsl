<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:clariah="http://www.clariah.eu/"
    exclude-result-prefixes="xs math clariah"
    version="3.0">
    
    <xsl:param name="tweakFile" select="'file:/Users/menzowi/Documents/GitHub/hi-ddb-stalling-editor/data/apps/stalling/profiles/clarin.eu:cr1:p_1708423613607/tweaks/tweak-1.xml'"/>
    <xsl:variable name="tweak" select="document($tweakFile)"/>
    
    <xsl:param name="prof" select="$tweak/ComponentSpec/Header[1]/ID[1]"/>
    <xsl:variable name="rec" select="/"/>
    
    <xsl:param name="profile" select="'RDM'"/>
    <xsl:param name="phase" select="'ingest'"/>
    
    <xsl:param name="vers" select="'1.2'"/>
    <xsl:variable name="cmd-ns" select="
        if ($vers = '1.1') then
        'http://www.clarin.eu/cmd/'
        else
        'http://www.clarin.eu/cmd/1'"/>
    <xsl:variable name="cmdp-ns" select="
        if ($vers = '1.1') then
        'http://www.clarin.eu/cmd/'
        else
        concat('http://www.clarin.eu/cmd/1/profiles/', $prof)"/>
    <xsl:variable name="NS" as="element()">
        <xsl:element namespace="{$cmd-ns}" name="cmd:ns">
            <xsl:if test="exists($cmdp-ns)">
                <xsl:namespace name="cmdp" select="$cmdp-ns"/>
            </xsl:if>
        </xsl:element>
    </xsl:variable>
    
    <xsl:template match="/">
        <xsl:variable name="paths">
            <xsl:for-each select="$tweak//clariah:validation[@profile=$profile][@phase=$phase]">
                <xsl:variable name="v" select="."/>
                <xsl:variable name="p" select="concat('//cmdp:',string-join(ancestor::*/@name,'/cmdp:'))"/>
                <xsl:variable name="i" as="item()*">
                    <xsl:evaluate xpath="$p" context-item="$rec" namespace-context="$NS" as="item()*"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$v/@cardinality=('1','+')">
                        <xsl:choose>
                            <xsl:when test="count($i) lt 1">
                                <xsl:message expand-text="yes">DBG: validate[{$p}][{$v/@cardinality}][{count($i)}] failed</xsl:message>
                                <path xsl:expand-text="yes" freq="{count($i)}" card="{$v/@cardinality}" path="{$p}" status="{($v/@level,'error')[1]}">{$v}</path>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:message expand-text="yes">DBG: validate[{$p}][{$v/@cardinality}][{count($i)}] passed</xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:message expand-text="yes">DBG: validate[{$p}][{$v/@cardinality}][{count($i)}] skipped</xsl:message>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <validation profile="{$profile}" phase="{$phase}" status="{if (exists($paths/*[@status='error'])) then ('failed') else ('passed')}">
            <xsl:copy-of select="$paths"/>
        </validation>
    </xsl:template>
    
</xsl:stylesheet>