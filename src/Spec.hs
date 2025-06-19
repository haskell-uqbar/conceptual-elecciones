module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de ejemplo" $ do
    it "El pdepreludat se instaló correctamente" $ do
      doble 1 `shouldBe` 2


runTests = hspec $ do
  describe "mayoresQueNAlAplicar" $ do
     it "a" $ do
       mayoresQueNAlAplicar 4 (\x -> x) [1,2,3,4,5,6,7]  `shouldBe` [5, 6, 7]
     it "b" $ do
       mayoresQueNAlAplicar 3 (+1) [1,2,3,4,5]  `shouldBe` [3, 4, 5]
     it "c" $ do
       mayoresQueNAlAplicar 4 negate [4,5,6,6000]  `shouldBe` []
