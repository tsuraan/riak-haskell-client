module Network.Riakclient.RpbPutResp (RpbPutResp(..)) where
import Prelude ((+))
import qualified Prelude as P'
import qualified Text.ProtocolBuffers.Header as P'
import qualified Network.Riakclient.RpbContent as Riakclient (RpbContent)
 
data RpbPutResp = RpbPutResp{content :: P'.Seq Riakclient.RpbContent, vclock :: P'.Maybe P'.ByteString}
                deriving (P'.Show, P'.Eq, P'.Ord, P'.Typeable)
 
instance P'.Mergeable RpbPutResp where
  mergeEmpty = RpbPutResp P'.mergeEmpty P'.mergeEmpty
  mergeAppend (RpbPutResp x'1 x'2) (RpbPutResp y'1 y'2) = RpbPutResp (P'.mergeAppend x'1 y'1) (P'.mergeAppend x'2 y'2)
 
instance P'.Default RpbPutResp where
  defaultValue = RpbPutResp P'.defaultValue P'.defaultValue
 
instance P'.Wire RpbPutResp where
  wireSize ft' self'@(RpbPutResp x'1 x'2)
   = case ft' of
       10 -> calc'Size
       11 -> P'.prependMessageSize calc'Size
       _ -> P'.wireSizeErr ft' self'
    where
        calc'Size = (P'.wireSizeRep 1 11 x'1 + P'.wireSizeOpt 1 12 x'2)
  wirePut ft' self'@(RpbPutResp x'1 x'2)
   = case ft' of
       10 -> put'Fields
       11 -> do
               P'.putSize (P'.wireSize 10 self')
               put'Fields
       _ -> P'.wirePutErr ft' self'
    where
        put'Fields
         = do
             P'.wirePutRep 10 11 x'1
             P'.wirePutOpt 18 12 x'2
  wireGet ft'
   = case ft' of
       10 -> P'.getBareMessageWith update'Self
       11 -> P'.getMessageWith update'Self
       _ -> P'.wireGetErr ft'
    where
        update'Self wire'Tag old'Self
         = case wire'Tag of
             10 -> P'.fmap (\ new'Field -> old'Self{content = P'.append (content old'Self) new'Field}) (P'.wireGet 11)
             18 -> P'.fmap (\ new'Field -> old'Self{vclock = P'.Just new'Field}) (P'.wireGet 12)
             _ -> let (field'Number, wire'Type) = P'.splitWireTag wire'Tag in P'.unknown field'Number wire'Type old'Self
 
instance P'.MessageAPI msg' (msg' -> RpbPutResp) RpbPutResp where
  getVal m' f' = f' m'
 
instance P'.GPB RpbPutResp
 
instance P'.ReflectDescriptor RpbPutResp where
  getMessageInfo _ = P'.GetMessageInfo (P'.fromDistinctAscList []) (P'.fromDistinctAscList [10, 18])
  reflectDescriptorInfo _
   = P'.read
      "DescriptorInfo {descName = ProtoName {protobufName = FIName \".Riakclient.RpbPutResp\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbPutResp\"}, descFilePath = [\"Network\",\"Riakclient\",\"RpbPutResp.hs\"], isGroup = False, fields = fromList [FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbPutResp.content\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbPutResp\"], baseName' = FName \"content\"}, fieldNumber = FieldId {getFieldId = 1}, wireTag = WireTag {getWireTag = 10}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = True, mightPack = False, typeCode = FieldType {getFieldType = 11}, typeName = Just (ProtoName {protobufName = FIName \".Riakclient.RpbContent\", haskellPrefix = [MName \"Network\"], parentModule = [MName \"Riakclient\"], baseName = MName \"RpbContent\"}), hsRawDefault = Nothing, hsDefault = Nothing},FieldInfo {fieldName = ProtoFName {protobufName' = FIName \".Riakclient.RpbPutResp.vclock\", haskellPrefix' = [MName \"Network\"], parentModule' = [MName \"Riakclient\",MName \"RpbPutResp\"], baseName' = FName \"vclock\"}, fieldNumber = FieldId {getFieldId = 2}, wireTag = WireTag {getWireTag = 18}, packedTag = Nothing, wireTagLength = 1, isPacked = False, isRequired = False, canRepeat = False, mightPack = False, typeCode = FieldType {getFieldType = 12}, typeName = Nothing, hsRawDefault = Nothing, hsDefault = Nothing}], keys = fromList [], extRanges = [], knownKeys = fromList [], storeUnknown = False}"