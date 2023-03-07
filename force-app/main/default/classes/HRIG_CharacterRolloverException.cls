/*************************************************************************
 * Copyright (C) 2015
 * USAA
 * All Rights Reserved 
 *
 * APEX Class: HRIG_CharacterRolloverException
 *************************************************************************
 * Change Log
 * Date          Name                Description
 * ==========    ============        ==================
 * 10/24/2015    Zachary Guinn       New 
 ***********************************************************************/
/***********************************************************************
 * Description: This class is used for the scheduling of bulk ids.
 * 
 ***********************************************************************/
public class HRIG_CharacterRolloverException extends Exception
{
    
    private String nextCharacter = '';
     /**
     * HRIG_CharacterRolloverException()
     * 
     * @param String e, v
     * @Constructor
     */
    public HRIG_CharacterRolloverException(String e, String v)
    {
       nextCharacter = v;
    }
     /**
     * nextCharacter()
     * 
     * @Return String representing next char
     */
    public String nextCharacter()
    {
        return nextCharacter;
    }
}