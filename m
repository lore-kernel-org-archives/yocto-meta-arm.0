Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5D1CD11DF
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 20:12:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1897.1711656728369439483
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Mar 2024 13:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D8E15A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 13:12:41 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BF1873F694
	for <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 13:12:07 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm: use UPSTREAM_CHECK_COMMITS for git versioned recipes
Date: Thu, 28 Mar 2024 16:12:06 -0400
Message-Id: <20240328201206.14812-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240328201206.14812-1-jon.mason@arm.com>
References: <20240328201206.14812-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Mar 2024 20:12:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5501

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm/recipes-devtools/gn/gn_git.bb                 | 2 ++
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 3 ++-
 scripts/machine-summary.py                             | 2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/gn/gn_git.bb b/meta-arm/recipes-de=
vtools/gn/gn_git.bb
index 5a6f19dbab02..7ec340c9d1b8 100644
--- a/meta-arm/recipes-devtools/gn/gn_git.bb
+++ b/meta-arm/recipes-devtools/gn/gn_git.bb
@@ -4,6 +4,8 @@ DEPENDS +=3D "ninja-native"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fca02217a5d49a14dfe2d11837bb=
34d"
=20
+UPSTREAM_CHECK_COMMITS =3D "1"
+
 SRC_URI =3D "git://gn.googlesource.com/gn;protocol=3Dhttps;branch=3Dmain=
 \
            file://0001-Replace-lstat64-stat64-functions-on-linux.patch"
 SRCREV =3D "4bd1a77e67958fb7f6739bd4542641646f264e5d"
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/met=
a-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index df1f3bddc8df..7996e9b36c3f 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -22,9 +22,10 @@ FTPM_UUID=3D"bc50d971-d4c9-42c4-82cb-343fb7f37896"
=20
 SRC_URI =3D "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=3Dmain;pr=
otocol=3Dhttps \
            file://0001-add-enum-to-ta-flags.patch"
-
 SRCREV =3D "d638536d0fe01acd5e39ffa1bd100b3da82d92c7"
=20
+UPSTREAM_CHECK_COMMITS =3D "1"
+
 S =3D "${WORKDIR}/git"
=20
 OPTEE_CLIENT_EXPORT =3D "${STAGING_DIR_HOST}${prefix}"
diff --git a/scripts/machine-summary.py b/scripts/machine-summary.py
index 477bdfc709ef..455a5176fe5d 100755
--- a/scripts/machine-summary.py
+++ b/scripts/machine-summary.py
@@ -146,9 +146,11 @@ recipes =3D ("virtual/kernel",
            "edk2-firmware",
            "u-boot",
            "optee-os",
+           "optee-ftpm",
            "hafnium",
            "boot-wrapper-aarch64",
            "gator-daemon",
+           "gn",
            "opencsd",
            "gcc-aarch64-none-elf-native",
            "gcc-arm-none-eabi-native")
--=20
2.39.3 (Apple Git-146)


