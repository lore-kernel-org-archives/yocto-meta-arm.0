Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FE3ED111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 08:27:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16673.1764577667010908322
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 00:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 345DE497;
	Mon,  1 Dec 2025 00:27:39 -0800 (PST)
Received: from MGC575JXM4.emea.arm.com (unknown [10.34.128.245])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2BD93F59E;
	Mon,  1 Dec 2025 00:27:45 -0800 (PST)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [PATCH] arm/classes: add apply_local_src_patches task
Date: Mon,  1 Dec 2025 09:27:30 +0100
Message-Id: <20251201082730.89308-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Dec 2025 08:27:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6778

When a recipe uses the externalsrc class, the do_patch task is
skipped entirely as specified in SRCTREECOVEREDTASKS.
Since do_apply_local_src_patches function is registered as a postfuncs,
it would never run in that specific case.

This cause recipes relying on do_apply_local_src_patches to miss the
local source patching when built from external source tree.

To address the issue, schedule a new task after the do_patch and before
the do_configure, ensuring the local patching executes regardless of
whether do_patch was skipped by externalsrc.

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 meta-arm/classes/apply_local_src_patches.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/apply_local_src_patches.bbclass b/meta-arm/=
classes/apply_local_src_patches.bbclass
index 0897b51b..64ed19e5 100644
--- a/meta-arm/classes/apply_local_src_patches.bbclass
+++ b/meta-arm/classes/apply_local_src_patches.bbclass
@@ -50,4 +50,4 @@ apply_local_src_patches() {
 do_apply_local_src_patches() {
     apply_local_src_patches "${LOCAL_SRC_PATCHES_INPUT_DIR}" "${LOCAL_SR=
C_PATCHES_DEST_DIR}"
 }
-do_patch[postfuncs] +=3D "do_apply_local_src_patches"
+addtask apply_local_src_patches after do_patch before do_configure
--=20
2.43.0


