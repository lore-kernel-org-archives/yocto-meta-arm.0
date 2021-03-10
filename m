Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.604.1615397607355827269
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Mar 2021 09:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F02B1FB;
	Wed, 10 Mar 2021 09:33:26 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 049A23F800;
	Wed, 10 Mar 2021 09:33:25 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 3/4] arm-autonomy/host-image-minimal: use XENGUEST_MANAGER_GUEST_DIR in image recipe
Date: Wed, 10 Mar 2021 17:32:54 +0000
Message-Id: <20210310173255.15222-3-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310173255.15222-1-nathan.dunne@arm.com>
References: <20210310173255.15222-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Created conf/xenguest.conf which defines XENGUEST_MANAGER_GUEST_DIR for both
arm-autonomy-host-image-minimal and xenguest-manager to ensure the value is
aligned.

Issue-Id: SCM-2168
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: I9cd5a351b5910bb122b275f47d542798b2df7b1f
---
 meta-arm-autonomy/conf/xenguest.conf                         | 5 +++++
 .../recipes-core/images/arm-autonomy-host-image-minimal.bb   | 5 ++++-
 .../recipes-extended/xenguest/xenguest-manager.bb            | 4 +++-
 3 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-autonomy/conf/xenguest.conf

diff --git a/meta-arm-autonomy/conf/xenguest.conf b/meta-arm-autonomy/conf/xenguest.conf
new file mode 100644
index 0000000..3c18cc5
--- /dev/null
+++ b/meta-arm-autonomy/conf/xenguest.conf
@@ -0,0 +1,5 @@
+# This file will be required by different xenguest recipes to provide
+# common variables, which can be configured in local.conf
+
+# Xenguest image file install location
+XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 7960a35..ea5d889 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -83,6 +83,9 @@ do_image[mcdepends] += "${DO_IMAGE_MCDEPENDS}"
 REQUIRED_DISTRO_FEATURES += 'arm-autonomy-host'
 REQUIRED_DISTRO_FEATURES += 'xen'
 
+# Configurable guest variables
+require conf/xenguest.conf
+
 python __anonymous() {
     import re
     guestfile_pattern = re.compile(r"^([^;]+);")
@@ -133,7 +136,7 @@ python __anonymous() {
 
 python add_extern_guests () {
     # Destination directory on the rootfs
-    guestdir = d.getVar('IMAGE_ROOTFS') + d.getVar('datadir') + '/guests'
+    guestdir = d.getVar('IMAGE_ROOTFS') + d.getVar('XENGUEST_MANAGER_GUEST_DIR')
 
     # Parse SRC_URI for files with ;guestname= parameter
     src_uri = d.getVar('SRC_URI')
diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
index d7b256f..e7034ca 100644
--- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
+++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
@@ -29,8 +29,10 @@ S = "${WORKDIR}"
 # parameters
 XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda2"
 XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen-$(basename ${XENGUEST_MANAGER_VOLUME_DEVICE})"
-XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
 XENGUEST_MANAGER_LOG_LEVEL ?= "ERROR"
+#XENGUEST_MANAGER_GUEST_DIR set in xenguest.conf
+
+require conf/xenguest.conf
 
 # We add an init script to create and start guests automatically
 # run start script after xen-tools and run stop script before xen-tools
-- 
2.17.1

