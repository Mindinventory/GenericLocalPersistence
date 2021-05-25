# GenericLocalPersistence

GenericLocalPersistence is a clean and easy-to-use code which is useful for integrating local storages like UserDefaults, plist and Keychain.

## Installation

From CocoaPods
First, add the following line to your Podfile 

```bash
pod install 'iOSGenricPods', '~> 1.0.0’

pod 'iOSGenricPods', :git => 'https://cocoapods.org/pods/iOSGenricPods'


```

## Usage

```python
import iOSGenricPods


## User differnt methods for different storages like default, plist or keychain 

defaultManager().saveValueInDefault.saveValueInDefault(value: "TestValue", using: "TestKey")

# The same way you can get the value by using the object manager

let valueFetch:String = manager.getValue("TestKey")


## Define type data Type in which you want to fetch the value and that’s way you can get the stored value.


## FOLLOW THE SAME STEPS TO ACCESS  THE METHODS FOR STORING AND RETRIEVING DATA FROM THE KEYCHAIN AND PLIST

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
