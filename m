Return-Path: <huifeng.zhang@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5504CC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 08:20:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.23525.1639470014890462722
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Dec 2021 00:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: huifeng.zhang@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46BD91FB;
	Tue, 14 Dec 2021 00:20:13 -0800 (PST)
Received: from huifeng-optiplex7070.shanghai.arm.com
 (huifeng-optiplex7070.shanghai.arm.com [10.169.190.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5F253F5A1;
	Tue, 14 Dec 2021 00:20:10 -0800 (PST)
From: Huifeng Zhang <Huifeng.Zhang@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	wei.chen@arm.com,
	robbie.cao@arm.com,
	jaxson.han@arm.com,
	qi.feng@arm.com,
	Huifeng Zhang <Huifeng.Zhang@arm.com>
Subject: [PATCH] arm/fvpboot: change the execution order of
 do_write_fvpboot_conf
Date: Tue, 14 Dec 2021 16:19:48 +0800
Message-Id: <20211214081948.128217-1-Huifeng.Zhang@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 08:20:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2677

add the do_write_fvpboot_conf function into IMAGE_POSTPROCESS_COMMAND
so that this function can be called after the build system created the
final image output files.

It's possible that bitbake doesn't run start from the do_rootfs task but
run start from do_image_<type> at the stage of image generation.

For example, there are multiple partitions in the wic file and the
grub.cfg file is placed to the first partition and the rootfs is placed
to the second partition. At this time, if we change the content of
the grub.cfg file resided in the related recipe's directory and build,
the do_rootfs task won't be run by bitbake but a new wic file will be
generated. In this situation, the fvpconf file also won't be updated and
the 'bp.virtioblockdevice.image_path' is still pointing to a old image
file.

Issue-Id: SCM-3724
Signed-off-by: Huifeng Zhang <Huifeng.Zhang@arm.com>
Change-Id: I7a41afa1d7471d09b60d118c4a6c99c57a6b548c
---
 meta-arm/classes/fvpboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/classes/fvpboot.bbclass b/meta-arm/classes/fvpboot.=
bbclass
index de66d7c..d02742d 100644
--- a/meta-arm/classes/fvpboot.bbclass
+++ b/meta-arm/classes/fvpboot.bbclass
@@ -25,7 +25,7 @@ EXTRA_IMAGEDEPENDS +=3D "${FVP_PROVIDER}"
=20
 inherit image-artifact-names
=20
-addtask do_write_fvpboot_conf after do_rootfs before do_image
+IMAGE_POSTPROCESS_COMMAND +=3D "do_write_fvpboot_conf;"
 python do_write_fvpboot_conf() {
     # Note that currently this JSON file is in development and the forma=
t may
     # change at any point, so it should always be used with a matching r=
unfvp.
--=20
2.34.1


