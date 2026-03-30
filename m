Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99383FB3D1B
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48192.1774868088881610982
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=jH4sxwsj;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FEAA1C2B;
	Mon, 30 Mar 2026 03:54:42 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AF243F915;
	Mon, 30 Mar 2026 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868088; bh=eJeZDqzGr1vAO5Gp18hldnSimq4asrF91gWrwRB+7Fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jH4sxwsjrHEzvCcS4G3CsCh51kPxtFLscKmjRo3LtvURs9jiQzvJqAYDCou1c1kol
	 JR3TXz5tT8XPjq9CYrx5zbOUs99CINKY11BQ/BkSHAYSPjnFwRlnwOyzNP2dpzhuiK
	 4krvcJarlSB38rMhHZR7c8jMTbvSRzrAOqi9Nefc=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>
Subject: [PATCH 5/7] arm-bsp/corstone1000-a320: Drop meta-ethos dependency
Date: Mon, 30 Mar 2026 11:43:15 +0100
Message-ID: <20260330105428.2580463-6-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330105428.2580463-1-michael.safwat@arm.com>
References: <20260330105428.2580463-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Mar 2026 10:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6986

Corstone1000 with Cortex A320 now uses the in-tree ethosu driver, so the
external meta-ethos layer (and its meta-sca dependency) is no longer need=
ed.

Remove meta-ethos and meta-sca from the Corstone-1000 A320 kas
config, drop the layer dependency on meta-ethos, and stop
installing arm-npu-ethosu. Update the Corstone-1000
change log to reflect the removed layers.

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
---
 kas/corstone1000-a320.yml                               | 8 --------
 meta-arm-bsp/conf/layer.conf                            | 1 -
 meta-arm-bsp/conf/machine/include/corstone1000-a320.inc | 2 --
 meta-arm-bsp/documentation/corstone1000/change-log.rst  | 4 ----
 4 files changed, 15 deletions(-)

diff --git a/kas/corstone1000-a320.yml b/kas/corstone1000-a320.yml
index 8a7739af..b11af510 100644
--- a/kas/corstone1000-a320.yml
+++ b/kas/corstone1000-a320.yml
@@ -7,11 +7,3 @@ local_conf_header:
   a320: |
     MACHINE_FEATURES +=3D "cortexa320"
     OVERRIDES .=3D ":cortexa320"
-
-repos:
-  meta-ethos:
-    url: https://gitlab.arm.com/iot/meta-ethos.git
-    branch: whinlatter
-  meta-sca:
-    url: https://github.com/priv-kweihmann/meta-sca.git
-    branch: master
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 0e54e3f4..eb795f23 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -14,7 +14,6 @@ LAYERSERIES_COMPAT_meta-arm-bsp =3D "wrynose"
 LAYERDEPENDS_meta-arm-bsp =3D "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
 LAYERDEPENDS_meta-arm-bsp:append:corstone1000 =3D " meta-python openembe=
dded-layer efi-secure-boot"
-LAYERDEPENDS_meta-arm-bsp:append:corstone1000:cortexa320 =3D " meta-etho=
s"
 LAYERDEPENDS_meta-arm-bsp:append:musca-b1 =3D " meta-python"
 LAYERDEPENDS_meta-arm-bsp:append:musca-s1 =3D " meta-python"
=20
diff --git a/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc b/me=
ta-arm-bsp/conf/machine/include/corstone1000-a320.inc
index c7ff2df7..69813000 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000-a320.inc
@@ -1,5 +1,3 @@
 ETHOSU_NUM_MACS ?=3D "256"
=20
 FVP_CONFIG[host.ethosu.num_macs] =3D "${ETHOSU_NUM_MACS}"
-
-IMAGE_INSTALL:append =3D " arm-npu-ethosu"
diff --git a/meta-arm-bsp/documentation/corstone1000/change-log.rst b/met=
a-arm-bsp/documentation/corstone1000/change-log.rst
index e42c5a41..7bab9e21 100644
--- a/meta-arm-bsp/documentation/corstone1000/change-log.rst
+++ b/meta-arm-bsp/documentation/corstone1000/change-log.rst
@@ -66,10 +66,6 @@ Yocto distribution components versions
 +-------------------------------------------+----------------+
 | meta-secure-core                          | 63209fb150     |
 +-------------------------------------------+----------------+
-| meta-ethos                                | aa2504a32f     |
-+-------------------------------------------+----------------+
-| meta-sca                                  | e68f1a9d17     |
-+-------------------------------------------+----------------+
 | busybox                                   | 1.37.0         |
 +-------------------------------------------+----------------+
 | musl                                      | 1.2.5          |

