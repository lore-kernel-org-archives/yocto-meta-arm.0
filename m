Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AC9C43219
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.403.1649347769006305065
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 09:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 557A41596
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:30 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 034833F73B
	for <meta-arm@lists.yoctoproject.org>; Thu,  7 Apr 2022 09:09:29 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] qemuarm64-secureboot: don't set append in extlinux.conf
Date: Thu,  7 Apr 2022 17:09:24 +0100
Message-Id: <20220407160925.3809765-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407160925.3809765-1-ross.burton@arm.com>
References: <20220407160925.3809765-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3260

There's no need to set append in the extlinux.conf, as the kernel will
pull the settings passed from runqemu via the DeviceTree.

By explicitly setting append here the kernel doesn't look in the DT, and
the extlinux.conf hardcoded a TAP network configuration which meant that
networking fails for runqemu using slirp.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/wic/qemuarm64.cfg | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm/wic/qemuarm64.cfg b/meta-arm/wic/qemuarm64.cfg
index 580244fe..b9c9da6e 100644
--- a/meta-arm/wic/qemuarm64.cfg
+++ b/meta-arm/wic/qemuarm64.cfg
@@ -1,4 +1,3 @@
 default Yocto
 label Yocto
     kernel /Image
-append root=3D/dev/vda2 rw console=3DttyS0 mem=3D1024M ip=3D192.168.7.2:=
:192.168.7.1:255.255.255.0 console=3DttyAMA0
--=20
2.25.1


