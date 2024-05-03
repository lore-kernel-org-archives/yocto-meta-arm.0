Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0301C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 17:25:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.324.1714757126312677561
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 May 2024 10:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0644143D
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 May 2024 10:25:50 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9908D3F793
	for <meta-arm@lists.yoctoproject.org>; Fri,  3 May 2024 10:25:25 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] README: add backporting process information
Date: Fri,  3 May 2024 13:25:24 -0400
Message-Id: <20240503172524.61421-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240503172524.61421-1-jon.mason@arm.com>
References: <20240503172524.61421-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 May 2024 17:25:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5697

Add entry for how to get patches backported.  Also, do some syntax
cleanups to make the README visualize better.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 README.md | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index e77e5acd9d10..c125368c5a0a 100644
--- a/README.md
+++ b/README.md
@@ -44,17 +44,24 @@ https://www.openembedded.org/wiki/How_to_submit_a_pat=
ch_to_OpenEmbedded
=20
 E-mail meta-arm@lists.yoctoproject.org with patches created using this p=
rocess. You can configure git-send-email to automatically use this addres=
s for the meta-arm repository with the following git command:
=20
-$ git config --local --add sendemail.to meta-arm@lists.yoctoproject.org
+`$ git config --local --add sendemail.to meta-arm@lists.yoctoproject.org=
`
=20
 Commits and patches added should follow the OpenEmbedded patch guideline=
s:
=20
 https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
=20
 The component being changed in the shortlog should be prefixed with the =
layer name (without the meta- prefix), for example:
+>  arm-bsp/trusted-firmware-a: decrease frobbing level
=20
-  arm-bsp/trusted-firmware-a: decrease frobbing level
+>  arm-toolchain/gcc: enable foobar v2
=20
-  arm-toolchain/gcc: enable foobar v2
+Backporting
+--------------
+Backporting patches to older releases may be done upon request, but only=
 after a version of the patch has been accepted into the master branch.  =
This is done by adding the branch name to email subject line.  This shoul=
d be between the square brackets (e.g., "[" and "]"), and before or after=
 the "PATCH".  For example,
+> [nanbield PATCH] arm/linux-yocto: backport patch to fix 6.5.13 network=
ing issues
+
+Automatic backporting will be done to all branches if the "Fixes: <SHA>"=
 wording is added to the patch commit message.  This is similar to how th=
e Linux kernel community does their LTS kernel backporting.  For more inf=
ormation see the "Fixes" portion of
+https://www.kernel.org/doc/html/latest/process/submitting-patches.html#s=
ubmittingpatches
=20
 Releases and Release Schedule
 --------------
--=20
2.39.3 (Apple Git-146)


