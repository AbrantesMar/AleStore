init:
	pod init
	make versionPod
	make install

versionPod:
	python versionPods.py

kill_pod_open:
	killall Xcode
	pod install
	open AleStore.xcworkspace

install:
	pod install
	open AleStore.xcworkspace

clean:
	killall Xcode
	rm Podfile.lock
	rm -R AleStore.xcworkspace
	rm -R Pods

ambientM1:
	# install Brew, python
