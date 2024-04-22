<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Modify so it sorts items in ascending order of quantity-->

<xsl:output method="html"/>

<xsl:template match="/">

    <h1>Invoice Number: <xsl:value-of select="invoice/invoice_number"/></h1>
    <h2>Invoice Date: <xsl:value-of select="invoice/invoice_date"/></h2>

    <!-- apply templates, quantity > 1-->
    <xsl:apply-templates select="invoice/item[quantity > 1]">
    <xsl:sort select="quantity" data-type="number" order="ascending"/> <!-- CHANGES HERE!-->
    </xsl:apply-templates>

    <h2>Payment Info: <xsl:value-of select="invoice/payment_information"/></h2><br/>

    <!-- Display hyperlink tudublin at the bottom of page-->
    <xsl:element name="a">		
		<xsl:attribute name="href">
            http://www.tudublin.ie
        </xsl:attribute>		
		www.tudublin.ie
	</xsl:element>

</xsl:template>

<xsl:template match="item">
    <b>Item: </b><xsl:value-of select="item_name"/>
    <p>Price: <xsl:value-of select="price"/></p>
    <p>Quantity: <xsl:value-of select="quantity"/></p><br/>
</xsl:template>

</xsl:stylesheet>
