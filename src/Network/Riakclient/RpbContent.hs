module Network.Riakclient.RpbContent (RpbContent(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riakclient.RpbLink as Riakclient (RpbLink)
import qualified Network.Riakclient.RpbPair as Riakclient (RpbPair)
 
data RpbContent = RpbContent{value :: P'.ByteString, content_type :: P'.Maybe P'.ByteString, charset :: P'.Maybe P'.ByteString,
                             content_encoding :: P'.Maybe P'.ByteString, vtag :: P'.Maybe P'.ByteString,
                             links :: P'.Seq Riakclient.RpbLink, last_mod :: P'.Maybe P'.Word32,
                             last_mod_usecs :: P'.Maybe P'.Word32, usermeta :: P'.Seq Riakclient.RpbPair}
                deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbContent where
  mergeEmpty
   = RpbContent P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty P'.mergeEmpty
      P'.mergeEmpty
  mergeAppend (RpbContent x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9) (RpbContent y'1 y'2 y'3 y'4 y'5 y'6 y'7 y'8 y'9)
   = RpbContent (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2) (P'.mergeAppend x'3 y'3) (P'.mergeAppend x'4 y'4)
      (P'.mergeAppend x'5 y'5)
      (P'.mergeAppend x'6 y'6)
      (P'.mergeAppend x'7 y'7)
      (P'.mergeAppend x'8 y'8)
      (P'.mergeAppend x'9 y'9)
 
instance P'.Default RpbContent where
  defaultValue
   = RpbContent P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue P'.defaultValue
      P'.defaultValue
      P'.defaultValue
 
instance P'.Wire RpbContent where
  wireSize ft' self'@(RpbContent x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size
         = (P'.wireSizeReq 1 12 x'1 + P'.wireSizeOpt 1 12 x'2 + P'.wireSizeOpt 1 12 x'3 + P'.wireSizeOpt 1 12 x'4 +
             P'.wireSizeOpt 1 12 x'5
             + P'.wireSizeRep 1 11 x'6
             + P'.wireSizeOpt 1 13 x'7
             + P'.wireSizeOpt 1 13 x'8
             + P'.wireSizeRep 1 11 x'9)
  wirePut ft' self'@(RpbContent x'1 x'2 x'3 x'4 x'5 x'6 x'7 x'8 x'9)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutReq 10 12 x'1
             P'.wirePutOpt 18 12 x'2
             P'.wirePutOpt 26 12 x'3
             P'.wirePutOpt 34 12 x'4
             P'.wirePutOpt 42 12 x'5
             P'.wirePutRep 50 11 x'6
             P'.wirePutOpt 56 13 x'7
             P'.wirePutOpt 64 13 x'8
             P'.wirePutRep 74 11 x'9
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{value = new'Field}) (P'.wireGet 12)
             18 -> P'.fmap (\ new'Field -> old'Self{content_type = P'.Just new'Field}) (P'.wireGet 12)
             26 -> P'.fmap (\ new'Field -> old'Self{charset = P'.Just new'Field}) (P'.wireGet 12)
             34 -> P'.fmap (\ new'Field -> old'Self{content_encoding = P'.Just new'Field}) (P'.wireGet 12)
             42 -> P'.fmap (\ new'Field -> old'Self{vtag = P'.Just new'Field}) (P'.wireGet 12)
             50 -> P'.fmap (\ new'Field -> old'Self{links = P'.append (links old'Self) new'Field}) (P'.wireGet 11)
             56 -> P'.fmap (\ new'Field -> old'Self{last_mod = P'.Just new'Field}) (P'.wireGet 13)
             64 -> P'.fmap (\ new'Field -> old'Self{last_mod_usecs = P'.Just new'Field}) (P'.wireGet 13)
             74 -> P'.fmap (\ new'Field -> old'Self{usermeta = P'.append (usermeta old'Self) new'Field}) (P'.wireGet 11)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbContent) RpbContent where
  getVal m' f' = f' m'
 
instance P'.GPB RpbContent
 
instance P'.ReflectDescriptor RpbContent where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList [10]) (P'.fromDistinctAscList [10, 18, 26, 34, 42, 50, 56, 64, 74])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbContent\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbContent\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbContent.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.value\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"value\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = True, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.content_type\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"content_type\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.charset\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"charset\"}, fieldNumber = FieldId {getFieldId = 3}, wireTag = WireTag {getWireTag = 26}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.content_encoding\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"content_encoding\"}, fieldNumber = FieldId {getFieldId = 4}, wireTag = WireTag {getWireTag = 34}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.vtag\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"vtag\"}, fieldNumber = FieldId {getFieldId = 5}, wireTag = WireTag {getWireTag = 42}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.links\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"links\"}, fieldNumber = FieldId {getFieldId = 6}, wireTag = WireTag {getWireTag = 50}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Riakclient.RpbLink\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbLink\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.last_mod\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"last_mod\"}, fieldNumber = FieldId {getFieldId = 7}, wireTag = WireTag {getWireTag = 56}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.last_mod_usecs\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"last_mod_usecs\"}, fieldNumber = FieldId {getFieldId = 8}, wireTag = WireTag {getWireTag = 64}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 13}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbContent.usermeta\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbContent\"], baseName' = FName \"usermeta\"}, fieldNumber = FieldId {getFieldId = 9}, wireTag = WireTag {getWireTag = 74}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Riakclient.RpbPair\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbPair\"}), hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"