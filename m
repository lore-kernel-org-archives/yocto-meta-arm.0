Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3737.1617179169198182502
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 01:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE96FD6E;
	Wed, 31 Mar 2021 01:26:07 -0700 (PDT)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C9953F792;
	Wed, 31 Mar 2021 01:26:06 -0700 (PDT)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH] autonomy/docs: Documentation updates and fixes
Date: Wed, 31 Mar 2021 09:25:56 +0100
Message-Id: <20210331082556.6883-1-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1

From: Nathan Dunne <Nathan.Dunne@arm.com>

Issue-Id: SCM-2038
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Ida94958b63c78097be6402be019d65a80260f297
---
 meta-arm-autonomy/README.md                   |  35 +++---
 .../documentation/arm-autonomy-multiconfig.md |  79 +++++++++-----
 .../documentation/arm-autonomy-quickstart.md  | 101 ++++++++++++------
 .../n1sdp-image-customization.md              |   2 +-
 .../documentation/xen-devicetree.md           |   3 +-
 .../documentation/xenguest-manager.md         |  40 ++++---
 .../documentation/xenguest-mkimage.md         |  14 +--
 .../import-docker-containers.bb               |   4 +
 .../images/arm-autonomy-host-image-minimal.bb |   2 +-
 .../xen-devicetree/xen-devicetree.bb          |  10 +-
 .../xenguest/xenguest-base-image.bb           |   6 +-
 .../xenguest/xenguest-extern-guests.bb        |  41 +------
 .../xenguest/xenguest-manager.bb              |  17 +--
 .../xenguest/xenguest-mkimage.bb              |   7 +-
 .../xenguest/xenguest-network.bb              |   2 +-
 15 files changed, 204 insertions(+), 159 deletions(-)

diff --git a/meta-arm-autonomy/README.md b/meta-arm-autonomy/README.md
index f882b7c..b6b8538 100644
--- a/meta-arm-autonomy/README.md
+++ b/meta-arm-autonomy/README.md
@@ -4,8 +4,8 @@ meta-arm-autonomy Yocto Layer
 Introduction
 ------------
 This layer provides an hypervisor based solution (currently based on Xen) for
-autonomous system. It contains recipes and classes to build host and guests
-systems.
+autonomous system. It contains recipes and classes to build host and guest
+images.
 
 To start using this layer, please check the
 [Quick Start Guide](documentation/arm-autonomy-quickstart.md).
@@ -16,13 +16,14 @@ This layer depends on several other Yocto layers:
 * meta-openembedded (https://git.openembedded.org/meta-openembedded)
 * poky (https://git.yoctoproject.org/poky)
 * meta-virtualization (https://git.yoctoproject.org/meta-virtualization)
+* meta-networking (git://git.openembedded.org/meta-openembedded)
 
 Distribution Features
 ---------------------
-This layer is adding the following Yocto DISTRO_FEATURES:
+This layer adds the following Yocto DISTRO_FEATURES:
 
 * arm-autonomy-host: this feature activates functionalities required to build
-  an autonomy host system. It is doing the following:
+  an autonomy host system. It has the following effects:
   - add 'xen' and 'ipv4' to DISTRO_FEATURES.
   - add xen backend drivers to linux kernel configuration.
   - To reduce the root filesystem image size the kernel image is not installed.
@@ -43,40 +44,40 @@ its documentation.
 Those documentation files should be checked for variables:
 - [xen-devicetree](documentation/xen-devicetree.md)
 - [xenguest-manager](documentation/xenguest-manager.md)
-- [xenguest-network-bridge](documentation/xenguest-network-bridge.md)
+- [xenguest-network](documentation/xenguest-network.md)
 
 BSPs
 ----
-This layer is adding the following machines:
+This layer adds the following machine:
 
-* arm64-autonomy-guest: this machines creates a minimal BSP suitable to be used
+* arm64-autonomy-guest: This machine creates a minimal BSP suitable to be used
   as an autonomy guest. It is in fact only activating ARM64 architecture and
   SMP in the linux kernel and is enabling the DISTRO_FEATURE
-  arm-autonomy-guest.
+  'arm-autonomy-guest'.
 
 Images
 ------
 This layer is adding the following images:
 
-* arm-autonomy-host-image-minimal: this image includes all elements required
-  to create a minimal arm-autonomy-host system. This includes xen and tools to
-  manage xen guests. This image depends on 'arm-autonomy-host' distribution
-  feature.
+* arm-autonomy-host-image-minimal: This image includes all elements required
+  to create a minimal arm-autonomy-host system. This includes xen, and tools to
+  manage xen guests and xenguest images. This image depends on
+ 'arm-autonomy-host' distribution feature.
 
 Recipes and classes
 -------------------
-This layer is adding the following recipes and classes:
+This layer adds the following recipes and classes:
 
-* [xen-devicetree](documentation/xen-devicetree.md): this is a recipe to modify
+* [xen-devicetree](documentation/xen-devicetree.md): This is a recipe to modify
   a device tree blob to add information required to boot xen and a Dom0 linux.
 
-* [xenguest-mkimage](documentation/xenguest-mkimage.md): this is a tool to
+* [xenguest-mkimage](documentation/xenguest-mkimage.md): This is a tool used to
   create and modify images to be used as Xen guests.
 
-* [xenguest-manager](documentation/xenguest-manager.md): this is a tool to
+* [xenguest-manager](documentation/xenguest-manager.md): This is a tool used to
   create/remove/start/stop xen guest generated using xenguest-mkimage.
 
-* [xenguest-network-bridge](documentation/xenguest-network-bridge.md): this
+* [xenguest-network](documentation/xenguest-network.md): This
   recipe add tools and init scripts to create a bridge connected to the
   external network on the host and allow guests to be connected to it.
 
diff --git a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
index e6f90b5..046c149 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
@@ -32,16 +32,16 @@ Ensure it has all the required layers in bblayers.conf as listed in
 Add multiconfig
 ----------------
 
-Here are the steps required to make the project build both the host and any
-number of guests as required.
+The steps required to make the project build both the host and any
+number of guests as required are:
 
 1. Create a new directory under `conf/` named `multiconfig/`
 
 2. Create two new files in this directory:
 `multiconfig/host.conf`
 `multiconfig/guest.conf`
-These files will contain any configurations that a specific to either the
-host or the guest
+These files will contain any configurations that are specific to either the
+host or the guest. The resulting directory tree should be:
 
 ```
 -- conf
@@ -73,7 +73,7 @@ MC_GUEST_INITRAMFS_IMAGE ?= ""
 #MC_GUEST_INITRAMFS_IMAGE_BUNDLE = "1"
 #MC_GUEST_INITRAMFS_IMAGE = "${MC_GUEST_IMAGERECIPE}"
 
-# These variables are set automatically, don't edit them!
+# These variables are set automatically, don't override them!
 MC_GUEST_FILENAME_PREFIX = "${@ 'Image-initramfs' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_IMAGERECIPE}' }"
 
 MC_GUEST_FILENAME = "${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.xenguest"
@@ -114,9 +114,10 @@ IMAGE_FSTYPES += "${@ 'cpio' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDLE',d) el
 # ANY OTHER GUEST CONFIG
 ```
 
-This contents shouldn't be changed directly, rather change the equivalent
-config in local.conf. You can append any other config desired for the
-guest at this point, for example `XENGUEST_IMAGE_DISK_SIZE`
+To modify the MACHINE or INITRAMFS variables change the equivalent
+config in local.conf rather than modifying this file directly. You can also
+append any other config desired for the guest after "ANY OTHER GUEST CONFIG",
+for example `XENGUEST_IMAGE_DISK_SIZE`.
 
 Make sure not to change `${DEPLOY_DIR_IMAGE}` to anything other than
 `${TMPDIR}/deploy/images`, as this is assumed by local.conf.
@@ -127,6 +128,8 @@ Make sure not to change `${DEPLOY_DIR_IMAGE}` to anything other than
 TMPDIR = "${TOPDIR}/${MC_HOST}"
 
 DISTRO_FEATURES += " arm-autonomy-host"
+
+# ANY OTHER HOST CONFIG
 ```
 
 Building the image
@@ -137,31 +140,56 @@ To build the multiconfig image the command is:
 bitbake mc:host:arm-autonomy-host-image-minimal
 ```
 
-You should see that this triggers guest tasks to be built in
-parallel. Once the build completes the guest will already be in the
-rootfs of the host thanks to `ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUEST`
+The first time this is run you may see a warning related to the SRC_URI:
+```
+Unable to get checksum for xenguest-extern-guests SRC_URI entry foo.xenguest: file could not be found
+```
+
+This is expected, and only indicates that the guest image has not yet been
+generated when the host parses the SRC_URI. By the time it is needed by the
+host recipe fetch task it will be present.
+
+During the build you should see that guest tasks are also being executed in
+parallel. Once the build completes the guest will already be in the rootfs of
+the host thanks to `ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUEST`
 
-The deployed image including the guest will be in `host/deploy/images/`
+The final host image including the guests will be deployed in
+`host/deploy/images/`
 
 
 Multiple Guests
 ----------------
 
 To have multiple guests with the same config the line which appends to
-`ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUEST` just needs to be duplicated with
-a different guestname.
+`ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS` just needs to pass the argument
+'guestcount=#' to install symlink copies of the xenguest file on the host.
+Documentation for the guestcount parameter can be found in
+documentation/arm-autonomy-quickstart.md in the section titled
+'Include guests directly in the host image'. This will ensure that the guest
+is still only built once, despite resulting in multiple copies on the target.
 
-To have different config for each guest, each will need its own config
-file similar to guest.conf, ensuring TMPDIR is set to a different path,
-and everything between `---Guest Config Start---` and
-`---Guest Config End---` will need to be duplicated. Ensure that the name
-of the multiconfig conf file does not contain any hyphens (-), since this
-will create errors when it becomes part of a function name.
+If guests are required to have different configurations, each will need its own
+config file, e.g. 'netguest.conf'. Ensure that the name of the conf file does
+not contain any hyphens, as this will create errors when it becomes part of a
+function name. In this file the values of TMPDIR, MACHINE, DISTRO_FEATURES etc.
+should be the same as above, but with the prefix "MC_GUEST_*" modified to
+something different to avoid collisions (e.g. MC_GUEST_2_*).
 
-Any copies of variables that start `MC_GUEST` must be altered to avoid
-collisions (e.g. `MC_GUEST_2_*`), and the name of the conf file must also
-be added to BBMULTICONFIG.
+As before, your additional config for the guest type should
+follow "ANY OTHER GUEST CONFIG"
 
+In your local.conf, everything between `---Guest Config Start---` and
+`---Guest Config End---` will need to be duplicated for each desired guest type.
+All copies of variables that start `MC_GUEST` must be modified with the same
+prefix as in the new guest config file (e.g. `MC_GUEST_2_*`).
+
+Each chunk of guest config in local.conf has automatic guest variables
+(found after the line "These variables are set automatically...").
+These should all use the same prefix as their chunk in their values,
+for example:
+```
+MC_GUEST_2_FILENAME_PREFIX = "${@ 'Image-initramfs' if d.getVar('MC_GUEST_2_INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_2_IMAGERECIPE}' }"
+```
 
 Guest with provisioned disk
 ----------------
@@ -174,11 +202,12 @@ AUTONOMY_HOST_EXTRA_PARTITION = "part --label provisioned-guest --source rawcopy
 --sourceparams=file=${TOPDIR}/${MC_GUEST}/deploy/images/${MC_GUEST_MACHINE}/${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.ext4"
 ```
 
-inside host.conf file.
+inside your host.conf file.
 
 The rest of the configuration has to be appended to guest.conf file:
 
 ```
+# ANY OTHER GUEST CONFIG
 XENGUEST_IMAGE_DISK_SIZE = "0"
 XENGUEST_IMAGE_SRC_URI_XEN_CONFIG = "file://\${TOPDIR}/path/to/rootdisk.cfg"
 XENGUEST_IMAGE_DISK_DEVICE = "_GUEST_DISK_DEVICE_"
@@ -187,7 +216,7 @@ IMAGE_ROOTFS_SIZE = "102400"
 IMAGE_FSTYPES = "ext4"
 ```
 
-content of rootdisk.cfg"
+Example content of rootdisk.cfg:
 
 ```
 disk = ["phy:_GUEST_DISK_DEVICE_,xvda,w"]
diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index ab8e219..3760676 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -1,9 +1,9 @@
 arm-autonomy Quick Start
 ==================
 
-This documentation is explaining how to quickly start with arm-autonomy layer
+This documentation explains how to quickly start with the arm-autonomy layer,
 and the main features provided.
-You will find in the documentation directory some more detailed documentation
+In the documentation directory you will find some more detailed documentation
 for each of the functionalites provided by this layer.
 
 What to use this layer for?
@@ -110,7 +110,8 @@ The project will generate a Linux kernel, a root filesystem, a Xen binary and
 a DTB modified to include the required entries to boot Xen and Linux as Dom0
 (this DTB has the extension `-xen.dtb`).
 
-To boot the system using an u-boot base board you will need to:
+To boot the system using a u-boot base board for machines other than FVP-Base
+you will need to:
 - Load the kernel (by default at 0x80080000 unless you modify
   XEN_DEVICETREE_DOM0_ADDR value)
 - Load the xen device tree (for example at 0x83000000)
@@ -119,54 +120,88 @@ To boot the system using an u-boot base board you will need to:
 
 In this example the addresses might need to be adapted depending on your board.
 
-For arm-autonomy host on FVP-Base u-boot has been modified such that
+For arm-autonomy host on FVP-Base, u-boot has been modified such that
 `booti 0x84000000 - 0x83000000` is the default boot command. If FVP-Base is your
 MACHINE target there should be no need to interfere with u-boot.
 
 Guest project
 -------------
-The guest projects are not target specific and will use a Yocto MACHINE defined
-in meta-arm-autonomy to include only the Linux configuration required to run
-a xen guest.
+The guest projects are not target specific and will instead use a Yocto MACHINE
+defined in meta-arm-autonomy to include only the Linux configuration required to
+run a xen guest.
 
 To create a guest project:
 
 1. Follow the steps of "Create a project"
 
-2. Optionaly add layers required to build the image and features you need.
+2. Optionally add layers required to build the guest image, and any features you
+   need.
 
-3. edit conf/local.conf to add `arm-autonomy-guest` to the DISTRO_FEATURES and
+3. Edit conf/local.conf to add `arm-autonomy-guest` to the DISTRO_FEATURES and
    set MACHINE to `arm64-autonomy-guest`:
   ```
   MACHINE = "arm64-autonomy-guest"
   DISTRO_FEATURES += "arm-autonomy-guest"
   ```
 
-4. build the image you want.
+4. Build the image you want.
    For example `bitbake core-image-minimal`
 
 The build will create a ".xenguest" image that can be use on an host project
 with the xenguest-manager, as well as a file "xenguest.env" containing the
-variables used to configure the guest image.
+variables used to configure and generate the guest image.
 
 The guest can also be built as a 'multiconfig' sub project of the host, see
-`meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md` for more information
+`meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md` for more
+ information
 
 Include guests directly in the host image
 -----------------------------------------
-The layer provides a way to directly include in the host project one or several
-images generated by guest projects.
+The layer provides a way to directly include one or more images generated by
+guest projects in the host project.
 
 To use this feature, you must edit your host project `local.conf` file and
-add set ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS to the list of xenguest images
-you want to include in your host. Each xenguest image must be given using a
-full path to it.
+add set the value of 'ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS' to the list of
+paths to xenguest images you want to include in your host.
+
+There are 4 supported formats for ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS
+entries:
+
+- http/https url
+  - "https://[url]:[port]/foo.xenguest;md5sum=..."
+
+- file:// absolute local path from root
+  - "file:///xenguests/bar.xenguest"
+
+- file:// path relative to FILESEXTRAPATHS
+ - "file://relative/baz.xenguest"
+
+- plain absolute local path from root
+  - "/xenguests/absolute/xyzzy.xenguest"
+
+It is not recommended to use other bitbake URL types, as they may result in
+undefined behaviour.
+
+A semicolon seperated list of install arguments can follow each image path:
+- guestname  : the name that will be attached when the image is imported
+               (default: [filename, without extension])
+- guestcount : the number of copies of the guest to install, with
+               incrementing numbers appended to the name
+               (default: 1)
+
+Any other arguments, for example an md5sum, will be assumed to be fetch
+arguments, and will be appended to the path in the SRC_URI.
 For example:
 ```
-ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS = "/home/user/guest-project/tmp/deploy/images/arm64-autonomy-guest/core-image-minimal-arm64-autonomy-guest.xenguest;guestname=myguest"
+ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS = "\
+https://[url]:[port]/base.xenguest;md5sum=[checksum];guestname=http \
+file:///guests/base.xenguest;guestname=file_abs \
+file://foo/base.xenguest;guestname=file_rel;guestcount=2 \
+/guests/foo/bar/base.xenguest;guestname=no_fetcher \ "
 ```
-This will add the guest and name it `myguest` on the host project image and
-the xenguest-manager will automatically boot it during startup.
+
+Documentation for setting up a multiconfig build can be found in:
+meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
 
 Add support for your board
 --------------------------
@@ -187,7 +222,7 @@ started). You can find the complete list of the kernel configuration elements
 required in `recipes-kernel/linux/arm-autonomy-kmeta/features/arm-autonomy/xen-host.cfg`.
 
 ### Define the drive and partition to use for the LVM volume
-The xenguest-manager is creating disk hard drive using LVM on an empty
+The xenguest-manager creates guest storage drives using LVM on an empty
 partition. The default value is set to use /dev/sda2.
 You can change this for your board by setting XENGUEST_MANAGER_VOLUME_DEVICE.
 
@@ -196,37 +231,37 @@ Check `recipes-extended/xenguest/xenguest-manager.bbappend` for examples.
 Please also read xenguest-manager.md.
 
 ### Define the interface to add to xenguest network bridge
-xenguest-network bridge is creating a bridge on the host and adds network
-interfaces to it so that guest connected to it have access to external network.
+xenguest-network bridge creates a bridge on the host and adds network
+interfaces to it so that guests connected to it have access to external network.
 By default `eth0` is set as the list of interfaces to be added to the bridge.
 Depending on your board or use case you might want to use an other interface
 or use multiple interfaces.
 You can change this for your board by setting XENGUEST_NETWORK_BRIDGE_MEMBERS.
 
-Check `recipes-extended/xenguest/xenguest-network-bridge.bbappend` for
+Check `recipes-extended/xenguest/xenguest-network.bbappend` for
 exmaples.
 
 Please also read xenguest-network-bridge.md.
 
 ### Define the network configuration of the xenguest network bridge
-xenguest network bridge is putting the host network interfaces in a bridge
-and is configuring it by default to use dhcp.
+xenguest-network puts the host network interfaces in a bridge and configures it
+by default to use dhcp.
 If you need a different type of configuration you can set
-XENGUEST_NETWORK_BRIDGE_CONFIG in a xenguest-network-bridge.bbappend to use
+XENGUEST_NETWORK_BRIDGE_CONFIG in your xenguest-network-bridge.bbappend to use
 a different file.
-The recipe will look for the file in ${WORKDIR} so you will need to add it to
-SRC_URI in your bbappend.
+The recipe will look for the file in ${WORKDIR}, so you will need to add it to
+the SRC_URI in your bbappend.
 The recipe will also substitute `###BRIDGE_NAME###` with the bridge name
-configured in ${XENGUEST_NETWORK_BRIDGE_NAME}.
+configured in ${XENGUEST_NETWORK_BRIDGE_NAME} when the config file is installed.
 
 You can find an example configuration file in
 `recipes-extended/xenguest/files/xenguest-network-bridge-dhcp.cfg.in`.
 
-Please also read xenguest-network-bridge.md.
+Please also read xenguest-network.md.
 
 ### Customize Dom0 and Xen boot arguments for you board
-xen-devicetree is writting inside the generated DTB Xen and Linux boot
-arguments as long as the address where Dom0 Linux kernel can be found.
+xen-devicetree modifies the generated DTB Xen and Linux boot arguments,
+as long as the address where Dom0 Linux kernel can be found.
 You might need to have different values for your board or depending on your
 use case.
 
diff --git a/meta-arm-autonomy/documentation/n1sdp-image-customization.md b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
index 80c11cb..c67b626 100644
--- a/meta-arm-autonomy/documentation/n1sdp-image-customization.md
+++ b/meta-arm-autonomy/documentation/n1sdp-image-customization.md
@@ -28,7 +28,7 @@ perform a couple of customizations in the generated wic image:
 The `arm-autonomy-n1sdp-efidisk.wks.in` and `arm-autonomy-n1sdp-grub.cfg` files
 are located at `meta-arm-autonomy/dynamic-layers/meta-arm-bsp/wic`.
 
-Other variables can also be custmized to set what files need to be included
+Other variables can also be customized to set what files need to be included
 in the wic image boot partition. Please refer to
 `meta-arm-autonomy/dynamic-layers/meta-arm-bsp/conf/machine/n1sdp-extra-settings.inc`
 for more details.
diff --git a/meta-arm-autonomy/documentation/xen-devicetree.md b/meta-arm-autonomy/documentation/xen-devicetree.md
index 0b3f41b..efe72ec 100644
--- a/meta-arm-autonomy/documentation/xen-devicetree.md
+++ b/meta-arm-autonomy/documentation/xen-devicetree.md
@@ -56,7 +56,8 @@ The following parameters are available:
   the xen devicetrees are properly regenerated if the source DTBs are changed.
   This variable is set by default to "virtual/kernel:do_deploy" to use DTBs
   generated during the compilation of the Linux kernel. This must be changed
-  if the machine your are using is not using a DTB listed in KERNEL_DEVICETREE.
+  if the machine you are using is not using a DTB listed in
+  KERNEL_DEVICETREE.
 
 - XEN_DEVICETREE_DTBS: This should be set to the list of DTBs you want to be
   modified by xen-devicetree. Those must be files that xen-devicetree can find
diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md b/meta-arm-autonomy/documentation/xenguest-manager.md
index 11df2a1..7a83eee 100644
--- a/meta-arm-autonomy/documentation/xenguest-manager.md
+++ b/meta-arm-autonomy/documentation/xenguest-manager.md
@@ -7,7 +7,7 @@ Introduction
 xenguest-manager is a tool to manage Xenguest images generated by
 [xenguest-mkimage](xenguest-mkimage.md).
 
-On a Xen Dom0 system it will:
+On a Xen Dom0 system it can:
 - create a xen guest from a xenguest image: extract its components, create a
   disk for the guest using LVM volumes.
 - start/stop a xen guest (during init or using xenguest-manager directly).
@@ -48,6 +48,7 @@ Bitbake parameters
 
 Several parameters are available to configure the xenguest manager during Yocto
 project compilation (those can be set in your project local.conf, for example).
+This config will be written to a file xenguest-manager.conf in /etc/xenguest/.
 
 The following parameters are available:
 
@@ -68,13 +69,22 @@ The following parameters are available:
   name).
   This is set by default to "/usr/share/guests".
 
-- XENGUEST_MANAGER_LOG_LEVEL: Set the default log level for xenguest manager. Must
-  be one of ERROR, INFO, VERBOSE (default: ERROR). The extra will be
+- XENGUEST_MANAGER_LOG_LEVEL: Set the default log level for xenguest manager.
+  Must be one of ERROR, INFO, VERBOSE (default: ERROR). The logs will be
   written to /var/log/xenguest.
 
   If a verbosity argument (-v or -vv) is passed to xenguest-manager directly, it
   will override the setting in xenguest-manager.conf
 
+  Since /var/log is by default a volatile location, extra configuration is
+  required if logs are desired to be kept between reboots:
+    VOLATILE_LOG_DIR="no"
+
+  Read more here: https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#var-VOLATILE_LOG_DIR
+
+  When this is enabled, logrotate will monitor the file to ensure it does not
+  grow excessively large. See recipes-extended/xenguest/files/logrotate-xenguest
+
 Init scripts
 ------------
 
@@ -103,26 +113,30 @@ and variables from the parent file's scope, including:
                     Takes an optional log level and a message body
                     e.g. log ERROR "blah"
 
-                    Options for log level: ERROR, INFO, VERBOSE, and FATAL, which
-                    will call exit 1 immediately after logging the message
+                    Options for log level: ERROR, INFO, VERBOSE,
+                    and FATAL which will call exit 1 immediately after logging
+                    the message at level ERROR.
 
 - log_command()   : Used to call a shell command and log that it has been
                     called, as well as capturing both stdout and stderr.
 
-                    By default the command output is dumped to the logfile as an error
-                    if the command returns a status > 0, or as a verbose message if the
-                    whole script is running in verbose mode. An optional log level can
-                    be passed to alter the level the log should be if the command returns
-                    a status >0,
+                    By default the command output is dumped to the logfile as an
+                    error if the command returns a status > 0, or as a verbose
+                    message if the whole script is running in verbose mode.
+
+                    An optional log level can be passed to alter the level the
+                    log should be if the command returns a status >0, which may
+                    be useful if the command is expected to return a non-zero
+                    result.
                     e.g. log_command INFO "ls -lh ~"
 
                     Options for log level: ERROR, INFO, and VERBOSE
 
-Attempting to call any other functions from xenguest_manager in an init script may
-result in a fatal error, from which cleanup is not guarenteed.
+Attempting to call any other functions from xenguest_manager in an init script
+may result in a fatal error, from which cleanup is not guarenteed.
 
 
-Sourcing also allows the script to access params.cfg.
+Init scripts also have access to config variables defined in params.cfg.
 
 An example of how to create the directory and install an init shell script can
 be found in:
diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
index fd142b7..e1e2a8a 100644
--- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
+++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
@@ -4,9 +4,9 @@ Xenguest mkimage
 Introduction
 ------------
 
-xenguest-mkimage is a tool to create and modify images to be used as Guest with
-Xen. It defines a format to store completely defined guests as a file or as
-a directory and provides options to create and modify those images.
+xenguest-mkimage is a tool to create and modify images to be used as a Guest
+with Xen. It defines a format to store completely defined guests as a file or as
+a directory, and provides options to create and modify those images.
 
 A xenguest image contains all elements required to create a xen guest.
 This is the base elements like a Xen configuration and a Linux kernel binary
@@ -15,8 +15,8 @@ but also some more advanced elements like init scripts or a disk definition.
 The format is made to be deployable easily by storing everything in a single
 file and provide tools to easily manipulate the images. It can also easily be
 extended to have features like encryption or signature of images, updates or
-complex configurations by providing features to have init script that will be
-executed on the host embedded inside the image.
+complex configurations by providing the ability to have init scripts embedded
+inside the image that will be executed on the host when the guest is started.
 
 Xenguest images content
 -----------------------
@@ -35,7 +35,7 @@ before starting the guest.
 
 ### files
 This directory contains files that can be used by the xen configuration, for
-example the binary of the kernel referenced in xen configuration).
+example the kernel image referenced in xen configuration.
 This is where the kernel binary, the dtb or a ramdisk will be stored.
 
 ### init.pre, init.d and init.post
@@ -47,7 +47,7 @@ contains scripts called at a different time:
      generate part of the xen configuration dynamically.
  - init.d: scripts executed when the guest has been created but before it is
      started. This can be used to do some xenstore operations or configure the
-     guest behaviour using xl, for example.
+     guest behaviour, using xl for example.
  - init.post: scripts executed just after starting the guest. This can be
      used to configure things created by xen for the guest like network
      network interfaces.
diff --git a/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb b/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb
index 8a3f45d..3fea508 100644
--- a/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb
+++ b/meta-arm-autonomy/recipes-containers/import-docker-containers/import-docker-containers.bb
@@ -6,6 +6,10 @@
 # the columns:   archive   name   tag   keep
 # for each container. This file is read by the import_containers
 # script to determine the parameters of the import
+#
+# Since the script needs knowledge of the values of $CONTAINERS_INSTALL_DIR
+# and $CONTAINERS_MANIFEST these are substituted for placeholder strings when
+# the script is installed.
 
 DESCRIPTION = "Add init script to import docker images at boot"
 LICENSE = "MIT"
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index cce632f..71ab5c2 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -1,4 +1,4 @@
-# Recipe to create a minimal Arm Autonomy stack host image
+# Recipe to create a minimal Arm Autonomy reference stack host image
 
 DESCRIPTION = "Arm Autonomy stack host minimal image"
 
diff --git a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
index db955e1..61fb624 100644
--- a/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
+++ b/meta-arm-autonomy/recipes-extended/xen-devicetree/xen-devicetree.bb
@@ -12,9 +12,9 @@ S = "${WORKDIR}"
 
 DESCRIPTION = "Add entries in DTB for Xen and Dom0"
 
-# Please refer to documentation/xen-devicetree.md for documentation on those
-# parameters
-# kernel size is passed to xen via xen.dtb so wee need to add
+# Please refer to documentation/xen-devicetree.md for documentation on these
+# customizable parameters
+# kernel size is passed to xen via xen.dtb so we need to add
 # 'virtual/kernel:do_deploy' as a dependency
 XEN_DEVICETREE_DEPEND_append = " virtual/kernel:do_deploy"
 XEN_DEVICETREE_DTBS ?= "${KERNEL_DEVICETREE}"
@@ -25,8 +25,8 @@ XEN_DEVICETREE_DOM0_ADDR ?= "0x80080000"
 XEN_DEVICETREE_DOM0_SIZE ?= "0x01000000"
 XEN_DEVICETREE_DTSI_MERGE ?= "xen.dtsi"
 
-# Our package does not generate any package for the rootfs but contributes to
-# deploy
+# Our package does not generate any packages for the rootfs, but instead
+# contributes to deploy
 inherit nopackages deploy
 
 DEPENDS += "dtc-native"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
index d4b748e..73278e5 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
@@ -2,10 +2,10 @@
 #
 # This recipe creates a base image that is then extended by other recipes
 # through xenguest_image class.
-# xenguest image type is using this as base to add a kernel and a disk image
-# to create a guest
+# xenguest image type uses this recipe as a base to add a kernel and a disk
+# image to create a guest
 #
-# The recipe is also adding files in those directories to the xenguest image:
+# The recipe also adds files in those directories to the xenguest image:
 # - ${WORKDIR}/extend/disk-files: all files in this directory will be added to
 #   the guest disk files (using --disk-add-file)
 # - ${WORKDIR}/extend/files: all files in this directory will be added to the
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb
index 9310cbc..fff6f6c 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-extern-guests.bb
@@ -5,44 +5,11 @@
 # to the directory XENGUEST_MANAGER_GUEST_DIR
 #
 # src_uri_parse_var.bbclass is used to parse
-# ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS
+# ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS and add the guest paths to the SRC_URI
+# to be fetched and unpacked to ${WORKDIR}/${SRC_URI_FROM_VAR_UNPACK_DIR}
 #
-# There are 4 supported formats for ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS
-# entries:
-#
-# - http/https url
-#   - "https://[url]:[port]/foo.xenguest;md5sum=..."
-#
-# - file:// absolute local path from root
-#   - "file:///xenguests/bar.xenguest"
-#
-# - file:// path relative to FILESEXTRAPATHS
-#  - "file://relative/baz.xenguest"
-#
-# - plain absolute local path from root
-#   - "/xenguests/absolute/xyzzy.xenguest"
-#
-# It is not recommended to use other yocto URL types, as they may result in
-# undefined behaviour.
-#
-# A semicolon seperated list of install arguments can follow each image path:
-# - guestname  : the name that will be attached when the image is imported
-#                (default: [filename, without extension])
-# - guestcount : the number of copies of the guest to install, with
-#                incrementing numbers appended to the name
-#                (default: 1)
-#
-# Any other arguments, for example an md5sum, will be assumed to be fetch
-# arguments, and will be kept when the path is added to the SRC_URI
-#
-# e.g.  ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS = "\
-# https://[url]:[port]/base.xenguest;md5sum=[checksum];guestname=http \
-# file:///guests/base.xenguest;guestname=file_abs \
-# file://foo/base.xenguest;guestname=file_rel;guestcount=2 \
-# /guests/foo/bar/base.xenguest;guestname=no_fetcher \ "
-#
-# Documentation for setting up a multiconfig build can be found in:
-# meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
+# Further documentation can be found in documentation/arm-autonomy-quickstart.md,
+# in the section named "Include guests directly in the host image"
 
 DESCRIPTION = "Xenguest Extern Guests"
 LICENSE = "MIT"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index e7034ca..aaf6cde 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -1,17 +1,10 @@
 # Xenguest manager recipe
 #
-# xenguest-manager is a tool to control xen guest (e.g. create, start, stop)
+# xenguest-manager is a tool to control xen guests (e.g. create, start, stop)
 #
-# By default xenguest-manager logs to /var/log when in verbose mode, which is a
-# Volatile directory. To persist logs across reboots the following needs to be
-# added to either local.conf or distro.conf
-#
-#   VOLATILE_LOG_DIR="no"
-#
-# Read more here: https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#var-VOLATILE_LOG_DIR
-#
-# When this is enabled, logrotate will monitor the file to ensure it does not grow
-# excessively large. See files/logrotate-xenguest
+# Usage documentation for the xenguest-manager tool can be found in
+# meta-arm-autonomy/documentation/xenguest-manager.md including the
+# customizable bitbake variables.
 
 DESCRIPTION = "Xen Guest Manager"
 LICENSE = "MIT"
@@ -25,8 +18,6 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 S = "${WORKDIR}"
 
-# Please refer to documentation/xenguest-manager.md for documentation on those
-# parameters
 XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda2"
 XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen-$(basename ${XENGUEST_MANAGER_VOLUME_DEVICE})"
 XENGUEST_MANAGER_LOG_LEVEL ?= "ERROR"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
index 047ca9f..548e7c3 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-mkimage.bb
@@ -2,8 +2,11 @@
 #
 # xenguest-mkimage is a tool to create/modify images to be used as xen guests
 # Produced images contains a xen configuration and several optional components
-# (kernel, device-tree, disk definition and files, init scripts) which all
-# together fully define a full xen guest
+# (kernel, device-tree, disk definition and files, and init scripts) which all
+# together fully define a xen guest image
+#
+# Usage documentation for the xenguest-mkimage tool can be found in
+# meta-arm-autonomy/documentation/xenguest-mkimage.md
 
 DESCRIPTION = "Xenguest mkimage tool"
 LICENSE = "MIT"
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
index 5f18659..65ab8aa 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-network.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 S = "${WORKDIR}"
 
 # Please refer to documentation/xenguest-network-bridge.md for documentation on
-# those parameters
+# the parameters available for customization
 XENGUEST_NETWORK_BRIDGE_NAME ?= "xenbr0"
 
 # The XENGUEST_NETWORK_BRIDGE_MEMBERS should be set in a machine.conf
-- 
2.17.1

