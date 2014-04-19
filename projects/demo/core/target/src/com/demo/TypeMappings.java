package com.demo;

/**
 * Stores the java mapping to schema type mappings.
 *
 * @author Chad Brandon
 */
class TypeMappings
{
    private static final java.util.Map<Class, String> mappings = new java.util.HashMap<Class, String>();
    static
    {
        mappings.put(java.lang.Boolean.class, "boolean");
        mappings.put(java.lang.Byte.class, "byte");
        mappings.put(byte[].class, "base64Binary");
        mappings.put(java.net.URI.class, "string");
        mappings.put(java.net.URL.class, "string");
        mappings.put(char[].class, "string");
        mappings.put(Character[].class, "string");
        mappings.put(java.lang.String.class, "string");
        mappings.put(java.util.Calendar.class, "dateTime");
        mappings.put(java.util.Date.class, "dateTime");
        mappings.put(java.util.Calendar.class, "dateTime");
        mappings.put(java.sql.Date.class, "dateTime");
        mappings.put(java.sql.Timestamp.class, "dateTime");
        mappings.put(char.class, "int");
        mappings.put(java.math.BigInteger.class, "integer");
        mappings.put(java.lang.Float.class, "decimal");
        mappings.put(java.lang.Double.class, "double");
        mappings.put(java.lang.Float.class, "float");
        mappings.put(java.lang.Short.class, "short");
        mappings.put(java.lang.Object.class, "anyType");
    }

    /**
     * Gets the appropriate schema type from the given <code>javaType</code>.
     *
     * @param javaType the java type from which to get the schema type.
     * @return the schema type mapping.
     */
    static String getSchemaType(final Class javaType)
    {
        return mappings.get(javaType);
    }
}