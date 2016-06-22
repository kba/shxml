<xsl:stylesheet version="1.0"
    exclude-result-prefixes="#all"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="param1">default-param1</xsl:param>
    <xsl:param name="string-param1" as="xs:string">default-string-param1</xsl:param>
    <xsl:template match="/">
        <root>
            <param1><xsl:value-of select="$param1"/> </param1>
            <string-param1><xsl:value-of select="$string-param1"/> </string-param1>
        </root>
    </xsl:template>
  <!-- <xsl:template match="@*|*|processing-instruction()|comment()"></xsl:template> -->
</xsl:stylesheet>
