Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06128CD11BF
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 18:56:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3607.1711133761541371762
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Mar 2024 11:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CA23FEC
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 11:56:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0263F3F67D
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 11:56:00 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-toolchain: correct UPSTREAM_CHECK
Date: Fri, 22 Mar 2024 14:56:00 -0400
Message-Id: <20240322185600.11647-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240322185600.11647-1-jon.mason@arm.com>
References: <20240322185600.11647-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Mar 2024 18:56:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5484

When the URL and names of the toolchain tarballs changed, the
UPSTREAM_CHECKs were not modified with the proper values.  This causes
the tooling to not show when new versions are available.  Modify to get
it working again.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../external-arm-toolchain/gcc-aarch64-none-elf_13.2.Rel1.bb  | 4 ++--
 .../external-arm-toolchain/gcc-arm-none-eabi_13.2.Rel1.bb     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-aarch64-none-elf_13.2.Rel1.bb b/meta-arm-toolchain/recipes-devtools/ex=
ternal-arm-toolchain/gcc-aarch64-none-elf_13.2.Rel1.bb
index 890efa7d0f5a..6262e76caed9 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.2.Rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarc=
h64-none-elf_13.2.Rel1.bb
@@ -17,5 +17,5 @@ SRC_URI[gcc-x86_64.sha256sum] =3D "7fe7b8548258f079d6ce=
9be9144d2a10bd2bf93b551dafb
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
-UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/gnu-a/downloads"
-UPSTREAM_CHECK_REGEX =3D "gcc-arm-(?P<pver>.+)-${HOST_ARCH}-${BINNAME}\.=
tar\.\w+"
+UPSTREAM_CHECK_URI =3D "https://developer.arm.com/downloads/-/arm-gnu-to=
olchain-downloads"
+UPSTREAM_CHECK_REGEX =3D "arm-gnu-toolchain-(?P<pver>\d+\.\d*\.[A-z]*\d*=
).*-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/g=
cc-arm-none-eabi_13.2.Rel1.bb b/meta-arm-toolchain/recipes-devtools/exter=
nal-arm-toolchain/gcc-arm-none-eabi_13.2.Rel1.bb
index 00390b587574..6569911df312 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.2.Rel1.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-=
none-eabi_13.2.Rel1.bb
@@ -17,5 +17,5 @@ SRC_URI[gcc-x86_64.sha256sum] =3D "6cd1bbc1d9ae57312bcd=
169ae283153a9572bd6a8e4eeae
=20
 S =3D "${WORKDIR}/arm-gnu-toolchain-${PV}-${HOST_ARCH}-${BINNAME}"
=20
-UPSTREAM_CHECK_URI =3D "https://developer.arm.com/tools-and-software/ope=
n-source-software/developer-tools/gnu-toolchain/downloads"
-UPSTREAM_CHECK_REGEX =3D "${BPN}-(?P<pver>.+)-${HOST_ARCH}-linux\.tar\.\=
w+"
+UPSTREAM_CHECK_URI =3D "https://developer.arm.com/downloads/-/arm-gnu-to=
olchain-downloads"
+UPSTREAM_CHECK_REGEX =3D "arm-gnu-toolchain-(?P<pver>\d+\.\d*\.[A-z]*\d*=
).*-${HOST_ARCH}-${BINNAME}\.tar\.\w+"
--=20
2.39.3 (Apple Git-146)


