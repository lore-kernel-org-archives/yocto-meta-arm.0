Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9021CC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 11:45:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6229.1644579931191101949
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 03:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDA8212FC
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:30 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FDE33F73B
	for <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 03:45:30 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] gem5/gem-aarch64-native: remove duplicate --command-line
Date: Fri, 11 Feb 2022 11:45:25 +0000
Message-Id: <20220211114527.4157075-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211114527.4157075-1-ross.burton@arm.com>
References: <20220211114527.4157075-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 11:45:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2988

The contents of GEM5_RUN_CMDLINE is passed via --command-line, so there
is no need to include --command-line in it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc b/me=
ta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
index 0a8e34c1..2fd5206e 100644
--- a/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
+++ b/meta-gem5/recipes-devtools/gem5/gem5-aarch64-native.inc
@@ -21,8 +21,7 @@ GEM5_RUN_DISK ?=3D "*-${MACHINE}.ext4"
 GEM5_RUN_DTB ?=3D "${@os.path.basename(d.getVar('KERNEL_DEVICETREE'))}"
=20
 # Linux command line to pass
-GEM5_RUN_CMDLINE ?=3D "--command-line=3D'earlyprintk=3Dpl011,0x1c090000 =
\
-        console=3DttyAMA0 rw mem=3D512MB root=3D/dev/sda rootwait'"
+GEM5_RUN_CMDLINE ?=3D "earlyprintk=3Dpl011,0x1c090000 console=3DttyAMA0 =
rw mem=3D512MB root=3D/dev/sda rootwait"
=20
 # Extra arguments to pass to gem5
 GEM5_RUN_EXTRA ?=3D "--mem-size=3D512MB -n 4 --machine-type=3DVExpress_G=
EM5_V2"
--=20
2.25.1


