Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B5DC433EF
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:44:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12841.1636469086261921260
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 09 Nov 2021 06:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C1F3101E
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 981D43F800
	for <meta-arm@lists.yoctoproject.org>; Tue,  9 Nov 2021 06:44:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] atp/atp-native: don't pass -Werror
Date: Tue,  9 Nov 2021 14:44:39 +0000
Message-Id: <20211109144441.24512-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109144441.24512-1-ross.burton@arm.com>
References: <20211109144441.24512-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 09 Nov 2021 14:44:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2349

New compiler is now warning about ignored return values[1], so patch out
the use of -Werror, which is bad practise outside of development builds.

[1] https://github.com/ARM-software/ATP-Engine/issues/9

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/atp/atp-native_3.1.bb     |  3 ++-
 .../recipes-devtools/atp/files/no-werror.patch | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-atp/recipes-devtools/atp/files/no-werror.patch

diff --git a/meta-atp/recipes-devtools/atp/atp-native_3.1.bb b/meta-atp/r=
ecipes-devtools/atp/atp-native_3.1.bb
index bb519882..31b58bf9 100644
--- a/meta-atp/recipes-devtools/atp/atp-native_3.1.bb
+++ b/meta-atp/recipes-devtools/atp/atp-native_3.1.bb
@@ -4,7 +4,8 @@ inherit pkgconfig native
 SUMMARY =3D "AMBA ATP Engine: synthetic traffic interface modelling fram=
ework"
=20
 S =3D "${WORKDIR}/git"
-SRC_URI =3D "${ATP_SRC}"
+SRC_URI =3D "${ATP_SRC} \
+           file://no-werror.patch"
=20
 EXTRA_OEMAKE +=3D "EXTRA_CXX_FLAGS=3D'${CXXFLAGS}' EXTRA_LD_FLAGS=3D'${L=
DFLAGS}'"
=20
diff --git a/meta-atp/recipes-devtools/atp/files/no-werror.patch b/meta-a=
tp/recipes-devtools/atp/files/no-werror.patch
new file mode 100644
index 00000000..4be143af
--- /dev/null
+++ b/meta-atp/recipes-devtools/atp/files/no-werror.patch
@@ -0,0 +1,18 @@
+Don't pass -Werror, as new compilers introduce new warnings.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/Makefile b/Makefile
+index c01b120..1d3c30a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,7 +18,7 @@ PROTOBUF_C_FLAGS:=3D $(shell pkg-config --cflags proto=
buf)
+ CPPUNIT_C_FLAGS :=3D $(shell pkg-config --cflags cppunit)
+ PROTOBUF_L_FLAGS:=3D $(shell pkg-config --libs protobuf)
+ CPPUNIT_L_FLAGS	:=3D $(shell pkg-config --libs cppunit)
+-CXX_FLAGS       :=3D $(PROTOBUF_C_FLAGS) -std=3Dc++11 -Wall -Werror -We=
xtra -Wno-unused-parameter -Wno-unused-variable $(CPPUNIT_C_FLAGS) -fPIC =
$(EXTRA_CXX_FLAGS)
++CXX_FLAGS       :=3D $(PROTOBUF_C_FLAGS) -std=3Dc++11 -Wall -Wextra -Wn=
o-unused-parameter -Wno-unused-variable $(CPPUNIT_C_FLAGS) -fPIC $(EXTRA_=
CXX_FLAGS)
+ LD_FLAGS        :=3D $(PROTOBUF_L_FLAGS) $(CPPUNIT_L_FLAGS) $(EXTRA_LD_=
FLAGS)
+ PROTO_SRC_DIR   :=3D ./proto/
+ PROTO_SRC       :=3D $(wildcard $(PROTO_SRC_DIR)tp*.proto)
--=20
2.25.1


