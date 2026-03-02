Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54293EA4E3A
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:09:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.164314.1772467745255364567
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 08:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80D6D14BF;
	Mon,  2 Mar 2026 08:08:58 -0800 (PST)
Received: from MGC575JXM4.emea.arm.com (MGC575JXM4.nice.arm.com [10.34.128.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320133F694;
	Mon,  2 Mar 2026 08:09:04 -0800 (PST)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [PATCH] arm/classes: fix quilt-native dependency
Date: Mon,  2 Mar 2026 17:08:52 +0100
Message-ID: <20260302160852.30229-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 02 Mar 2026 16:09:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6931

quilt-native is required by do_apply_local_src_patches task.

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 meta-arm/classes/apply_local_src_patches.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/apply_local_src_patches.bbclass b/meta-arm/=
classes/apply_local_src_patches.bbclass
index 64ed19e5..6db58977 100644
--- a/meta-arm/classes/apply_local_src_patches.bbclass
+++ b/meta-arm/classes/apply_local_src_patches.bbclass
@@ -5,7 +5,7 @@
 # LOCAL_SRC_PATCHES_INPUT_DIR is the directory from where the patches ar=
e located
 # LOCAL_SRC_PATCHES_DEST_DIR is the directory where the patches will be =
applied
=20
-do_patch[depends] +=3D "quilt-native:do_populate_sysroot"
+do_apply_local_src_patches[depends] +=3D "quilt-native:do_populate_sysro=
ot"
=20
 LOCAL_SRC_PATCHES_INPUT_DIR ??=3D ""
 LOCAL_SRC_PATCHES_DEST_DIR ??=3D "${LOCAL_SRC_PATCHES_INPUT_DIR}"

