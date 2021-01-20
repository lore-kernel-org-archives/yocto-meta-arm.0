Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27336.1611148652368930099
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 05:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: nathan.dunne@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE90E1063;
	Wed, 20 Jan 2021 05:17:31 -0800 (PST)
Received: from e120809.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35D1D3F66E;
	Wed, 20 Jan 2021 05:17:31 -0800 (PST)
From: "Nathan Dunne" <Nathan.Dunne@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: [PATCH 3/3] arm-autonomy/arm-autonomy-host-image-minimal: Use REQUIRED_DISTRO_FEATURES
Date: Wed, 20 Jan 2021 13:17:16 +0000
Message-Id: <20210120131716.30428-3-nathan.dunne@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120131716.30428-1-nathan.dunne@arm.com>
References: <20210120131716.30428-1-nathan.dunne@arm.com>

From: Nathan Dunne <Nathan.Dunne@arm.com>

Make use of REQUIRED_DISTRO_FEATURES rather than anonymous python for
determining that both arm-autonomy-host and xen are present in
DISTRO_FEATURES

Issue-Id: SCM-1862
Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
Change-Id: Id21086ac4f4c45a89fa8fa8a2da28f04919f6b26
---
 .../images/arm-autonomy-host-image-minimal.bb          | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
index 8245e9a..7960a35 100644
--- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
+++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Arm Autonomy stack host minimal image"
 # and install the alternate kernel
 inherit ${@bb.utils.filter('DISTRO_FEATURES', 'alternate-kernel', d)}
 
-inherit core-image
+inherit core-image features_check
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
@@ -80,6 +80,8 @@ DO_IMAGE_MCDEPENDS := "${@ '${MC_DOIMAGE_MCDEPENDS}' if d.getVar('BBMULTICONFIG'
 # Apply mc dependency. Empty string if multiconfig not enabled
 do_image[mcdepends] += "${DO_IMAGE_MCDEPENDS}"
 
+REQUIRED_DISTRO_FEATURES += 'arm-autonomy-host'
+REQUIRED_DISTRO_FEATURES += 'xen'
 
 python __anonymous() {
     import re
@@ -87,12 +89,6 @@ python __anonymous() {
     guestname_pattern = re.compile(r";guestname=([^;]+);?")
     guestcount_pattern = re.compile(r";guestcount=(\d+);?")
 
-    if bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', False, True, d):
-        raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'arm-autonomy-host'")
-
-    if bb.utils.contains('DISTRO_FEATURES', 'xen', False, True, d):
-        raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'xen'")
-
     # Check in ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS for extra guests and add them
     # to SRC_URI with xenguest parameter if not set
     guestlist = d.getVar('ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS')
-- 
2.17.1

