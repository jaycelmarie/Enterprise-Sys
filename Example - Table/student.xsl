<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/class">
    <html>
        <body>
            <h2> Student List </h2>

            <!-- Start of Table -->
            <table border="1">
                <tr>
                    <th>First Name</th>
                    <th>Surname</th>
                    <th>Course</th>
                </tr>
                <xsl:for-each select="student">
                    <tr>
                        <td><xsl:value-of select="firstname"/></td>
                        <td><xsl:value-of select="surname"/></td>
                        <td><xsl:value-of select="course"/></td>
                    </tr>

                </xsl:for-each>

            </table>

        </body>

    </html>

</xsl:template>
</xsl:stylesheet>