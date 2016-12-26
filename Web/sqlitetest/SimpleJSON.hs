module SimpleJSON 
    (JValue(..),
     getString,
     getInt,
     getDouble,
     getBool,
     getObject,
     getArray,
     isNull) where 

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
              deriving (Eq, Ord, Show)

getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _           = Nothing

getInt :: JValue -> Maybe Int
getInt (JNumber n) = Just (truncate n)
getInt _           = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JNumber d) = Just d
getDouble _           = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b) = Just b
getBool _         = Nothing

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObject kvps) = Just kvps
getObject _              = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray ary) = Just ary
getArray _            = Nothing

isNull :: JValue -> Bool
isNull JNull = True
isNull _     = False