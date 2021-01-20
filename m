Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.27634.1611148651388723617
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 05:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02ECF101E;
	Wed, 20 Jan 2021 05:17:31 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E3963F66E;
	Wed, 20 Jan 2021 05:17:30 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 2/3] arm-autonomy/documentation: Remove references to meta-kernel
Date: Wed, 20 Jan 2021 13:17:15 +0000
Message-Id: <20210120131716.30428-2-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120131716.30428-1-nathan.dunne@arm.com>
References: <20210120131716.30428-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Since meta-arm-bsp doesn't depend on meta-kernel anymore
it has been removed from the appropriate documentation.

Issue-Id: SCM-2005
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: If3548b84c4cffc5cc105a1fc07a656dc814699f3
---
 meta-arm-autonomy/documentation/arm-autonomy-quickstart.md | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
index 2aa42d3..1b72917 100644
--- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
+++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
@@ -26,7 +26,6 @@ First you must download the Yocto layers needed:
  - [poky](https://git.yoctoproject.org/poky)
  - [meta-virtualization](https://git.yoctoproject.org/meta-virtualization)
  - [meta-arm](https://git.yoctoproject.org/meta-arm)
- - [meta-kernel](https://gitlab.com/openembedded/community/meta-kernel.git)
  - all other layers you might want to use
 
 For each of the downloaded layer make sure you checkout the release of Yocto
@@ -57,7 +56,6 @@ Here are the main steps to create an arm-autonomy project:
   bitbake-layers add-layer $LAYERDIR_BASE/meta-poky $LAYERDIR_BASE/meta-yocto-bsp \
    $LAYERDIR_BASE/meta-openembedded/meta-oe $LAYERDIR_BASE/meta-openembedded/meta-python \
    $LAYERDIR_BASE/meta-openembedded/meta-filesystems $LAYERDIR_BASE/meta-openembedded/meta-networking \
-   $LAYERDIR_BASE/meta-virtualization $LAYERDIR_BASE/meta-kernel \
    $LAYERDIR_BASE/meta-arm/meta-arm $LAYERDIR_BASE/meta-arm/meta-arm-toolchain \
    $LAYERDIR_BASE/meta-arm/meta-arm-bsp $LAYERDIR_BASE/meta-arm/meta-arm-autonomy \
   ```
@@ -73,7 +71,6 @@ Here are the main steps to create an arm-autonomy project:
     /home/user/arm-autonomy/meta-openembedded/meta-filesystems \
     /home/user/arm-autonomy/meta-openembedded/meta-networking \
     /home/user/arm-autonomy/meta-virtualization \
-    /home/user/arm-autonomy/meta-kernel \
     /home/user/arm-autonomy/meta-arm/meta-arm \
     /home/user/arm-autonomy/meta-arm/meta-arm-toolchain \
     /home/user/arm-autonomy/meta-arm/meta-arm-bsp \
@@ -212,7 +209,7 @@ and is configuring it by default to use dhcp.
 If you need a different type of configuration you can set
 XENGUEST_NETWORK_BRIDGE_CONFIG in a xenguest-network-bridge.bbappend to use
 a different file.
-The recipe will look for the file in ${WORKDIR} so you will need to add it to 
+The recipe will look for the file in ${WORKDIR} so you will need to add it to
 SRC_URI in your bbappend.
 The recipe will also substitute `###BRIDGE_NAME###` with the bridge name
 configured in ${XENGUEST_NETWORK_BRIDGE_NAME}.
-- 
2.17.1

