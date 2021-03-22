Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.364.1616439597271558291
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Mar 2021 11:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80C81113E
	for <meta-arm@lists.yoctoproject.org>; Mon, 22 Mar 2021 11:59:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A7083F718
	for <meta-arm@lists.yoctoproject.org>; Mon, 22 Mar 2021 11:59:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/hafnium: refuse to build on non-x86-64 hosts
Date: Mon, 22 Mar 2021 18:59:51 +0000
Message-Id: <20210322185951.2151143-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

For reasons, hafnium doesn't use host binaries for stuff like GN, Ninja,
Clang, GCC, or Qemu. Instead it ships binaries that it uses during the
build, but these binaries are only available for x86-64.

Attempts to use external tools (so the recipe can just DEPENDS as usual)
were not successful (clang being the problem) so just forcible stop the
recipe building on anything but x86-64 for now.

Change-Id: I144309d15fa1265b2b105981cd2bfcd376aab7ad
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.4.bb
index 3a52599..361d6db 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.4.bb
@@ -72,3 +72,9 @@ do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
 }
 addtask deploy after do_install
+
+python() {
+    # https://developer.trustedfirmware.org/T898
+    if d.getVar("BUILD_ARCH") !=3D "x86_64":
+        raise bb.parse.SkipRecipe("Cannot be built on non-x86-64 hosts")
+}
--=20
2.25.1

