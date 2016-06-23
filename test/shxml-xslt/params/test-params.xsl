<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.w3.org/1999/xhtml"
    version="1.0">
    <xsl:output omit-xml-declaration="yes"/>
    <xsl:param name="param1"/>
    <xsl:param name="param2"/>
    <xsl:template match="/">
        <params>
            <param1><xsl:value-of select="$param1"/></param1>
            <param2><xsl:value-of select="$param2"/></param2>
        </params>
    </xsl:template>
</xsl:stylesheet>
