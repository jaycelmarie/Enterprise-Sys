<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		
<xsl:template match="/">

    <xsl:element name="order_document">
        <xsl:attribute name="order_id_num">
            <xsl:value-of select="order/@orderid"/>
        </xsl:attribute>

        <!-- Person responsible from order_company_Y -->
        <person_responsible>
            <xsl:value-of select="order/person"/> 
        </person_responsible>

        <!-- Start of Parties-->
        <parties>
            <ship_to_party>
                <name><xsl:value-of select="order/shipto/name"/></name>
                <address_info>
                    <address_line><xsl:value-of select="order/shipto/address"/></address_line>
                    <city><xsl:value-of select="order/shipto/city"/></city>
                    <destination_country><xsl:value-of select="order/shipto/destination_country"/></destination_country>
                </address_info>
            </ship_to_party>
        </parties> <!-- End of parties-->

        <!-- Item List -->
        <items>
            <xsl:copy-of select="order/item"/> <!-- Copy of: copy the nodes selected by  XPath expression into the output doc. -->
        </items>

        <!-- Quantity Calculation -->
        <quantity_total>
            <xsl:value-of select="sum(order/item/quantity)"/>
        </quantity_total>

        <!-- Order Total -->
        <!-- call-template: call a named template within an XSLT stylesheet.  -->
        <order_total>
            <xsl:call-template name="calculate_total">

                <xsl:with-param name="items" select="order/item"/> <!-- pass parameters to calculate_total -->
                <xsl:with-param name="total" select="0"/>

            </xsl:call-template>
        </order_total>

    </xsl:element> <!-- End of order_document-->

</xsl:template> <!-- End of / template -->

<!-- Make a new template to cal total -->
<xsl:template name="calculate_total">
    <xsl:param name="items"/> <!-- get items param-->
    <xsl:param name="total" select= "0"/> <!-- default value of 0-->

    <!-- 
        when is used as part of a conditional statement within choose.
        allows you to specify a condition that evaluates to true or false.
        if the condition is true, -> $items not empty 
        code inside the <xsl:when> block is executed.
    -->
    <xsl:choose>
        <xsl:when test="$items">
            <xsl:variable name="first" select="$items[1]"/>
                <xsl:call-template name="calculate_total">

                    <!-- 
                        "$items[position()>1] specifies the value that will be assigned to the items parameter.

                        [position()>1]: This is a predicate applied to the $items variable.
                        filters the nodes in the node-set to include only those nodes
                        where their position in the node-set is greater than 1.
                    -->
                    <xsl:with-param name="items" select="$items[position()>1]"/>
                    <xsl:with-param name="total" select="($first/quantity * $first/price + $total)"/>
                </xsl:call-template>
        </xsl:when>
        <!-- Else -->
        <xsl:otherwise>
            <xsl:value-of select="format-number($total, '###,##0.00')"/>
        </xsl:otherwise>
    </xsl:choose>

</xsl:template>

</xsl:stylesheet>	
