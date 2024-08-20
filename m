Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDECCC531DF
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 13:43:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19660.1724161399696781904
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 20 Aug 2024 06:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 383AEDA7
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Aug 2024 06:43:45 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D97B23F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 20 Aug 2024 06:43:18 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/qemu-efi-disk: add rootwait to bootargs
Date: Tue, 20 Aug 2024 09:43:16 -0400
Message-Id: <20240820134317.3438-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 20 Aug 2024 13:43:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5981

Adding "rootwait" to bootargs for uniformity with the other wic files,
and this _could_ resolve Yocto Bugzilla Bug 15562 (as the intermittent
inability to find the root disk could be because of a race between
needing the disk and it not being mounted yet).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/wic/qemu-efi-disk.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/wic/qemu-efi-disk.wks.in b/meta-arm/wic/qemu-efi-di=
sk.wks.in
index 4f898efa5140..100d0edbd6a4 100644
--- a/meta-arm/wic/qemu-efi-disk.wks.in
+++ b/meta-arm/wic/qemu-efi-disk.wks.in
@@ -8,4 +8,4 @@ part / --source rootfs --fstype=3Dext4 --label root --ali=
gn 1024 --use-uuid
=20
 part swap --size 44 --label swap --fstype=3Dswap --use-uuid
=20
-bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 ip=3D=
dhcp"
+bootloader --ptable gpt --timeout=3D5 --append=3D"rootwait rootfstype=3D=
ext4 ip=3Ddhcp"
--=20
2.39.3 (Apple Git-146)


