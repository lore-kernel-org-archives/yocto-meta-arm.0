Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895D6C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 23:22:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.146037.1680736950399145103
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 16:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3FE8C40C61
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_ropo_00BV3 for <meta-arm@lists.yoctoproject.org>;
	Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E12040C3E
	for <meta-arm@lists.yoctoproject.org>; Wed,  5 Apr 2023 23:22:29 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id AF93D1637F9;
	Wed,  5 Apr 2023 19:21:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arm@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/5] optee-os-tadevkit: add 3.20.0 version
Date: Wed,  5 Apr 2023 23:22:15 +0000
Message-Id: <20230405232218.1563477-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405232218.1563477-1-denis@denix.org>
References: <20230405232218.1563477-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Apr 2023 23:22:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4555

https://github.com/OP-TEE/optee_os/releases/tag/3.20.0

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../optee/optee-os-tadevkit_3.20.0.bb         | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-os-tadevkit_3.2=
0.0.bb

diff --git a/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb =
b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
new file mode 100644
index 00000000..202caa54
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee-os-tadevkit_3.20.0.bb
@@ -0,0 +1,24 @@
+require optee-os_3.20.0.bb
+
+SUMMARY =3D "OP-TEE Trusted OS TA devkit"
+DESCRIPTION =3D "OP-TEE TA devkit for build TAs"
+HOMEPAGE =3D "https://www.op-tee.org/"
+
+DEPENDS +=3D "python3-pycryptodome-native"
+
+do_install() {
+    #install TA devkit
+    install -d ${D}${includedir}/optee/export-user_ta/
+    for f in ${B}/export-ta_${OPTEE_ARCH}/* ; do
+        cp -aR $f ${D}${includedir}/optee/export-user_ta/
+    done
+}
+
+do_deploy() {
+	echo "Do not inherit do_deploy from optee-os."
+}
+
+FILES:${PN} =3D "${includedir}/optee/"
+
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dev +=3D "buildpaths"
--=20
2.25.1


