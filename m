Return-Path: <gowtham.sureshkumar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E960C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 10:42:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12153.1676457774102706875
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 02:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: gowtham.sureshkumar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 570C21042;
	Wed, 15 Feb 2023 02:43:36 -0800 (PST)
Received: from e126345.arm.com (unknown [10.57.46.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F94D3F663;
	Wed, 15 Feb 2023 02:42:52 -0800 (PST)
From: gowtham.sureshkumar@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
Subject: [PATCH 1/2] arm/edk2-basetools: Convert edk2 basetools recipes to native only
Date: Wed, 15 Feb 2023 10:42:35 +0000
Message-Id: <20230215104236.24484-2-gowtham.sureshkumar@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230215104236.24484-1-gowtham.sureshkumar@arm.com>
References: <20230215104236.24484-1-gowtham.sureshkumar@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Feb 2023 10:42:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4390

From: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>

The BBCLASSEXTEND configuration can generate native sdk and target
recipes as well. The cp command used in do_install will
create host contamination issues for these recipes, so this patch
makes the recipe native only.

Signed-off-by: Gowtham Suresh Kumar <gowtham.sureshkumar@arm.com>
---
 ...-basetools_202211.bb => edk2-basetools-native_202211.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-arm/recipes-devtools/edk2-basetools/{edk2-basetools_202211.bb => edk2-basetools-native_202211.bb} (92%)

diff --git a/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools-native_202211.bb
similarity index 92%
rename from meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
rename to meta-arm/recipes-devtools/edk2-basetools/edk2-basetools-native_202211.bb
index c80fdae2..6a59c22c 100644
--- a/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools_202211.bb
+++ b/meta-arm/recipes-devtools/edk2-basetools/edk2-basetools-native_202211.bb
@@ -3,7 +3,7 @@
 # generating UEFI capsules as it only depends on some python scripts. Other
 # tools need to be built first before adding to sysroot.
 
-DESCRIPTION = "EDK2 Base Tools"
+SUMMARY = "EDK2 Base Tools"
 LICENSE = "BSD-2-Clause-Patent"
 
 # EDK2
@@ -14,11 +14,11 @@ SRCREV = "fff6d81270b57ee786ea18ad74f43149b9f03494"
 
 S = "${WORKDIR}/git"
 
+inherit native
+
 RDEPENDS:${PN} += "python3-core"
 
 do_install () {
     mkdir -p ${D}${bindir}/edk2-BaseTools
     cp -r ${WORKDIR}/git/BaseTools/* ${D}${bindir}/edk2-BaseTools/
 }
-
-BBCLASSEXTEND = "native"
-- 
2.17.1


