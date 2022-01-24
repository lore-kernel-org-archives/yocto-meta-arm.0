Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EC1C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 17:40:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.95.1643046016019783137
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 09:40:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F28AAD6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 09:40:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C86B3F766
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 09:40:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: update for meta-zephyr changes
Date: Mon, 24 Jan 2022 17:40:11 +0000
Message-Id: <20220124174012.3916927-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 17:40:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2902

As of meta-zephyr dde88ba the layer is structured different, split into
meta-zephyr-core and meta-zephyr-bsp.

As we define our own machines for use with Zephyr, we can just use
meta-zephyr-core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ci/meta-zephyr.yml    | 3 ++-
 ci/qemu-cortex-m3.yml | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index 2f23f2bc..20d54649 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -6,4 +6,5 @@ header:
 repos:
   meta-zephyr:
     url: https://git.yoctoproject.org/git/meta-zephyr
-    refspec: master
+    layers:
+      meta-zephyr-core:
diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
index ab6d5c73..d9b197cb 100644
--- a/ci/qemu-cortex-m3.yml
+++ b/ci/qemu-cortex-m3.yml
@@ -4,6 +4,11 @@ header:
     - ci/base.yml
     - ci/meta-zephyr.yml
=20
+repos:
+  meta-zephyr:
+    layers:
+      meta-zephyr-bsp:
+
 local_conf_header:
   tclibc: |
     TCLIBC =3D "newlib"
--=20
2.25.1


