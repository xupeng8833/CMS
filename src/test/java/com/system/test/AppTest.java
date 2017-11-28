package com.system.test;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.codec.Hex;

import junit.framework.Assert;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    /**
     * Rigourous Test :-)
     */
    public void testApp()
    {
        assertTrue( true );
    }
    
        public void test(){  
            String str1 = "hello";  
            //base64进行编码  
            String base64Encoded = Base64.encodeToString(str1.getBytes()); 
            
            System.out.println("base64Encoded================="+base64Encoded);
            
            //base64进行解码  
            String str2 = Base64.decodeToString(base64Encoded);  
            
            System.out.println("str2================="+str2);
            //16进制编码  
            String hexEncoded = Hex.encodeToString(str1.getBytes());  
            //16进制解码  
            String str3 = new String(Hex.decode(hexEncoded.getBytes()));  
            Assert.assertEquals(str1,str2);  
            Assert.assertEquals(str1, str3);  
    } 
}
