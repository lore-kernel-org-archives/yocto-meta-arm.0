Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8671.1608024047669428521
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 01:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07EB931B
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:37 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9509D3F66E
	for <meta-arm@lists.yoctoproject.org>; Tue, 15 Dec 2020 01:20:36 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/7] arm/optee-test: add comment
Date: Tue, 15 Dec 2020 09:20:25 +0000
Message-Id: <20201215092030.2723188-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215092030.2723188-1-ross.burton@arm.com>
References: <20201215092030.2723188-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Upstream has potentially fixed the musl issues, so leave a comment to rem=
ind
whoever does the upgrade.

Change-Id: I24d9b23e492b29b6690c0843c3f2c950791f93e5
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-security/optee/optee-test.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-test.inc b/meta-arm/re=
cipes-security/optee/optee-test.inc
index eb11a12..969d5e2 100644
--- a/meta-arm/recipes-security/optee/optee-test.inc
+++ b/meta-arm/recipes-security/optee/optee-test.inc
@@ -10,6 +10,7 @@ require optee.inc
=20
 # Linking fails on musl due to C++/threads
 # https://github.com/OP-TEE/optee_test/issues/458#issuecomment-720540834
+# When upgraded we should be able to remove this limitation
 COMPATIBLE_HOST_libc-musl =3D 'null'
=20
 DEPENDS =3D "optee-client optee-os python3-pycryptodomex-native"
--=20
2.25.1

