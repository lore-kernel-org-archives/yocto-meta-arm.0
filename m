Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF3CC25B5F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 12:32:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11342.1714566716090962899
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 May 2024 05:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE10B339
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:32:21 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8DD823F73F
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 May 2024 05:31:55 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/fvp-base-a-aem: disable version checking
Date: Wed,  1 May 2024 08:31:54 -0400
Message-Id: <20240501123154.62576-4-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240501123154.62576-1-jon.mason@arm.com>
References: <20240501123154.62576-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 May 2024 12:32:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5683

Recent changes to the FVP Base homepage have caused it to no longer be
searchable with the current Yocto tooling.  Disable it to prevent issues
with `devtool check-upgrade-status`.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb b/m=
eta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
index 4dd254a21f2e..eab2255f6f3c 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
+++ b/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.25.15.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM =3D "file://license_terms/license_agreem=
ent.txt;md5=3D1a33828e132ba
 SRC_URI[fvp-aarch64.sha256sum] =3D "22096fc2267ad776abe0ff32d0d3b870c9fa=
e10036d9c16f4f0fe4a64487a11e"
 SRC_URI[fvp-x86_64.sha256sum] =3D "5f33707a1bdaa96a933b89949f28643110ad8=
0ac9835a75f139c200b64a394dc"
=20
+# The CSS used in the FVP homepage make it too difficult to query with t=
he tooling currently in Yocto
+UPSTREAM_VERSION_UNKNOWN =3D "1"
+
 MODEL_CODE =3D "FVP_Base_RevC-2xAEMvA"
=20
 COMPATIBLE_HOST =3D "(aarch64|x86_64).*-linux"
--=20
2.39.3 (Apple Git-146)


