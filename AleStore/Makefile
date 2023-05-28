init:
	pod init
	make versionPod
	make install

# If contain python in your ambient, else: brew install python and brew install python-tk@3.11 and echo 
# "alias python=/usr/bin/python3" >> ~/.zshrc 
# or
# M1 : export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"
versionPod:
	python versionPods.py

kill_pod_open:
	killall Xcode
	pod install
	open AleStore.xcworkspace

install:
# For error: Analyzing dependencies [!] Unable to determine the platform for the `AleStore` target.
# in command line, please, past: "platform :ios, '16.0'", in seconde line to Podfile.
	pod install
	open AleStore.xcworkspace

clean:
	rm Podfile
	rm Podfile.lock
	rm -R AleStore.xcworkspace
	rm -R Pods

ambientM1:
	# install Brew, python