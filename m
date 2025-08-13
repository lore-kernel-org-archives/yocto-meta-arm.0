Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304BBCA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 08:04:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.95496.1755072261704099430
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 01:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F9CB113E
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Aug 2025 01:04:12 -0700 (PDT)
Received: from e133390.cambridge.arm.com (unknown [10.1.198.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C85F3F5A1
	for <meta-arm@lists.yoctoproject.org>; Wed, 13 Aug 2025 01:04:20 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/classes: Fix IMAGE_POSTPROCESS_COMMAND in fvpboot
Date: Wed, 13 Aug 2025 09:02:35 +0100
Message-ID: <20250813080235.3376-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Aug 2025 08:04:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6663

Since OE-core 6fd8af0d, the semicolon delimeter in bb.build_exec_func
variables is not needed. The commit silently removes any stray ';' but
failed to handle ';' when assigning to vardeps.

In meta-arm, this has the effect of changes to FVP_* variables not being
picked up when rebuilding the image recipe since mickledore.

This is ancient history now, so just remove the semicolon to fix the
variable dependency issue when using fvpboot in meta-arm.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-arm/classes/fvpboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index e5ffbac6..71f0b8f7 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -31,7 +31,7 @@ EXTRA_IMAGEDEPENDS +=3D "${FVP_PROVIDER}"
=20
 IMAGE_CLASSES +=3D "image-artifact-names"
=20
-IMAGE_POSTPROCESS_COMMAND +=3D "do_write_fvpboot_conf;"
+IMAGE_POSTPROCESS_COMMAND +=3D "do_write_fvpboot_conf"
 python do_write_fvpboot_conf() {
     # Note that currently this JSON file is in development and the forma=
t may
     # change at any point, so it should always be used with a matching r=
unfvp.
--=20
2.43.0


