<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Modify invoice.xsl to use xsl:apply-templates instead of for-each tag-->

<xsl:output method="html"/>

<xsl:template match="/">

    <h1>Invoice Number: <xsl:value-of select="invoice/invoice_number"/></h1>
    <h2>Invoice Date: <xsl:value-of select="invoice/invoice_date"/></h2>

    <!-- apply templates-->
    <xsl:apply-templates select="invoice/item"/>

    <h2>Payment Info: <xsl:value-of select="invoice/payment_information"/></h2>
</xsl:template>

<xsl:template match="item">
    <b>Item: </b><xsl:value-of select="item_name"/>
    <p>Price: <xsl:value-of select="price"/></p>
    <p>Quantity: <xsl:value-of select="quantity"/></p><br/>
</xsl:template>

</xsl:stylesheet>
