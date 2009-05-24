package com.jamescookie.maps;

import java.util.Map;
import java.util.HashMap;

public class GoogleApiKey {
    private static final Map<String,String> mapping = new HashMap<String, String>();
    private static final String WWW = "www.";

    static {
        mapping.put("jamesandjack.co.uk", "ABQIAAAAbZ4Jaxje4fqwUIzdlhU7jhSttjUt-WcjNZ5sCy4XiTMzc8KefhQk7G3bVdsWAmkPZ0f9WTYriGu-9g");
        mapping.put("192.168.0.12", "ABQIAAAAbZ4Jaxje4fqwUIzdlhU7jhQmmh7jkltN7NYTqYxJVNaBksHrshSslRoCrlRXQtxVhSlM0B1oxafpAQ");
        mapping.put("jamescookie.com", "ABQIAAAAbZ4Jaxje4fqwUIzdlhU7jhS746Z0JIdejkzocDyQ_2hnWIfSeBSdho-FRRwP2YcYtt9eNGhFVxmU9A");
        mapping.put("jamescookie.co.uk", "ABQIAAAAbZ4Jaxje4fqwUIzdlhU7jhS746Z0JIdejkzocDyQ_2hnWIfSeBSdho-FRRwP2YcYtt9eNGhFVxmU9A");
        mapping.put("localhost", "ABQIAAAAbZ4Jaxje4fqwUIzdlhU7jhT2yXp_ZAY8_ufC3CFXhHIE1NvwkxRWd5oskdsXeZvVz2_Xwc_Ue8Gofw");
    }

    private GoogleApiKey() {}

    public static String getKey(String host) {
        if (host.startsWith(WWW)) {
            host = host.substring(WWW.length(), host.length());
        }
        return mapping.get(host);
    }
}
