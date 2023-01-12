Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCFDC61DB3
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52239.1673521380660833717
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 782DAFEC;
	Thu, 12 Jan 2023 03:03:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6D613F67D;
	Thu, 12 Jan 2023 03:02:59 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 02/10] arm: Add addpylib declaration
Date: Thu, 12 Jan 2023 11:02:49 +0000
Message-Id: <20230112110257.2070363-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4265

From: Peter Hoyes <Peter.Hoyes@arm.com>

OE-core 4901c9d471cab99d52876842980222ce271b66e4 "base: Switch to use
addpylib directive and BB_GLOBAL_PYMODULES" means that ${LAYERDIR}/lib
is no longer searched by default when loading test controllers.

meta-arm defines some custom test controllers for testing FVPs, so add
an addpylib directive to meta-arm/conf/layer.conf to fix testimage on
FVPs.

testimage.bbclass still has its own test case loading logic based on
BBLAYERS, so other layers that only define test cases (not controllers
or other Python libraries) need no further changes.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I7fab638b4a1610d30efad2dae214378d096e0fc4
---
 meta-arm/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index be8201c7..2b354375 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -17,3 +17,5 @@ LAYERSERIES_COMPAT_meta-arm =3D "mickledore"
=20
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL +=3D "telnet"
+
+addpylib ${LAYERDIR}/lib oeqa
--=20
2.34.1


