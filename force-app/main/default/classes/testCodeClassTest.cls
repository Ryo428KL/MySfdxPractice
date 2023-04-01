@isTest
public with sharing class testCodeClassTest {
  @isTest
  public static void testCodeMethod_test001(){
    Test.startTest();
    Integer res = testCodeClass.testCodeMethod();
    Test.stopTest();

    System.assertEquals(1, res);
  }
}