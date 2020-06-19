Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.677.1592526947758000550
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2020 17:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0FAEC40BFD;
	Fri, 19 Jun 2020 00:35:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPAnId8uORxJ; Fri, 19 Jun 2020 00:35:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB8D240BEF;
	Fri, 19 Jun 2020 00:35:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8962E1734D9;
	Thu, 18 Jun 2020 20:35:43 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v3 5/5] tcmode-external-arm: fixup headers location in external toolchain SDK
Date: Thu, 18 Jun 2020 20:35:37 -0400
Message-Id: <1592526937-38479-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592526937-38479-1-git-send-email-denis@denix.org>
References: <1592526937-38479-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

External toolchain compiler searches for some headers relative to the binary
and regardless of the --sysroot value. Since headers are installed inside
SDKTARGETSYSROOT, but the binary is inside SDKPATHNATIVE, symlink include
directories between those two.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/tcmode-external-arm.inc               | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
index 7d5aecc..2f101fc 100644
--- a/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
+++ b/meta-arm-toolchain/conf/distro/include/tcmode-external-arm.inc
@@ -117,3 +117,14 @@ def populate_toolchain_links(d):
             bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
 
 require conf/distro/include/external-arm-toolchain-versions.inc
+
+SDK_POSTPROCESS_COMMAND_prepend = "external_arm_sdk_fixup; "
+
+external_arm_sdk_fixup () {
+	tcpath="${SDK_OUTPUT}/${SDKPATHNATIVE}${prefix_nativesdk}/${EAT_TARGET_SYS}"
+	if [ -d $tcpath ]; then
+		pushd $tcpath
+		ln -s ${SDKTARGETSYSROOT}/include include
+		popd
+	fi
+}
-- 
2.7.4

