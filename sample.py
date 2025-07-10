from google.cloud import bigquery

client = bigquery.Client()

query = """
    SELECT corpus AS title, COUNT(word) AS unique_words
    FROM `bigquery-public-data.samples.shakespeare`
    GROUP BY title
    ORDER BY unique_words
    DESC LIMIT 10
"""
results = client.query(query)

for row in results:
    title = row['title']
    unique_words = row['unique_words']
    print(f'{title:<20} | {unique_words}')





def preprocess_xsl_elements(xml_data, remove_xsl_elements=True):
    if remove_xsl_elements:
        # Define a regular expression to match elements and attributes with the "xsl" namespace prefix
        xsl_regex = r"""<xsl:.*?>|</xsl:.*?>|xsl:.*?=".*?"|<xsl:.*?/>"""

        # Remove or replace elements and attributes with the "xsl" namespace prefix
        xml_data = re.sub(xsl_regex, '''', xml_data)

    return xml_data

def escape_special_characters(match):
    # Escape ''<'' and ''>'' characters within attribute values
    return match.group(0).replace("<", "&lt;").replace(">", "&gt;")

class ABC:
    def process(self, file_data, hierarchy, file_id, file_name, file_load_date, job_run_id):
        # Preprocess the XML data
        file_data = preprocess_xsl_elements(file_data)
        regex = """=\\s*("[^"]*"|\\''[^\\'']*\\'')"""
        file_data = re.sub(regex, escape_special_characters, file_data)

        try:
            element = etree.fromstring(file_data)
        except Exception as e:
            error_id = str(uuid4())
            error_message = str(e)
            return [(None, None, None, None, None, file_id, file_name, file_load_date, job_run_id, error_id, error_message)]

        results = []
        ns_index = 0
        for ns_name, ns_value in element.nsmap.items():
            ns_name = f"xmlns:{ns_name}" if ns_name else "xmlns"
            ns_hierarchy = hierarchy + "." + str(ns_index + 1)
            results.append((ns_hierarchy, "", None, ns_name, ns_value, file_id, file_name, file_load_date, job_run_id, None, None))
            ns_index += 1

        stack = [(element, hierarchy)]
        while stack:
            element, hierarchy = stack.pop()
            index = 0
            children = element.xpath("./*")  # Filter out comments
            for child in children:
                local_name = QName(child).localname
                new_hierarchy = hierarchy + "." + str(index)
                results.append((new_hierarchy, local_name, str(child.text), None, None,file_id,file_name, file_load_date,  job_run_id, None, None))

                # Process attributes
                attr_index = len(child.xpath("./*"))  # Start at the next available index
                for attr_name, attr_value in child.attrib.items():
                    attr_hierarchy = new_hierarchy + "." + str(attr_index)
                    results.append((attr_hierarchy, local_name, None, attr_name, attr_value, file_id, file_name, file_load_date,  job_run_id, None, None))
                    attr_index += 1

                stack.append((child, new_hierarchy))
                index += 1

        return results
';
