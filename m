Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AFFC54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 07:19:31 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.19231.1709191169311577246
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 28 Feb 2024 23:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=qDNNjAXD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-456497-202402290719259456a3d676e5077c68-vevlld@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202402290719259456a3d676e5077c68
        for <meta-arm@lists.yoctoproject.org>;
        Thu, 29 Feb 2024 08:19:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=u0u8YuZMICakuGYfBRL/AYp+eOX/qewuVcqiDo3Gfps=;
 b=qDNNjAXDlQk/xFLZM7KoX7caA9+CVlqWqqjBcLptObEZx7gKsXm/arzSahWDGMvuRmy1P/
 SGKdyxVIOtxEviCveO3b9fr1vmpnbRZLODGsCXcW1e3NOl6I0wQYak8A3WOvXZTNi/WL+bVC
 PF7JMWZRULGzjzfRmNINZxUvgKFcE=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: meta-arm@lists.yoctoproject.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Jon Mason <jon.mason@arm.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH v2] optee-ftpm: fix EARLY_TA_PATHS passed to optee-os
Date: Thu, 29 Feb 2024 08:19:16 +0100
Message-ID: <20240229071922.76043-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Feb 2024 07:19:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5403

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Fix the build with DISTRO_FEATURES containing "usrmerge":
make: *** No rule to make target '/.../optee-os/4.1.0/recipe-sysroot/lib/optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.stripped.elf', needed by '/.../optee-os/4.1.0/build/core/early_ta_bc50d971-d4c9-42c4-82cb-343fb7f37896.c'.  Stop.

Fixes: 6a105f47b920 ("optee-ftpm: Install artifacts into nonarch_base_libdir")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changes in v2:
base_libdir -> nonarch_base_libdir

 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 40423615..4829bc10 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -10,6 +10,6 @@ DEPENDS:append = "\
 EXTRA_OEMAKE:append = "\
                        ${@bb.utils.contains('MACHINE_FEATURES', \
                       'optee-ftpm', \
-                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/lib/optee_armtz/${FTPM_UUID}.stripped.elf"', \
+                      'CFG_EARLY_TA=y EARLY_TA_PATHS="${STAGING_DIR_TARGET}/${nonarch_base_libdir}/optee_armtz/${FTPM_UUID}.stripped.elf"', \
                       '', \
                       d)} "
-- 
2.43.2


