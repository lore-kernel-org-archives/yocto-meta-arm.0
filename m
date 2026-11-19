Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.408.1795109857623473487
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 09:37:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=MZU73tFW;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 116081575
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2026 09:37:34 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 936BD3F673
	for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2026 09:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795109857; bh=tgjixMHiZeNDxbj3esufzupR66uFe0FXYr6BqcsqOVY=;
	h=From:To:Subject:Date:From;
	b=MZU73tFWTDLE8q5ZETu2bBjHcR3GFy3/qmpHBCoj2CKWPUOoIuIOrWDlW0oqoyHj5
	 Hu+76ODhdW3pb86FOK6S6JhCclTvjGeCEHlB3h0xope5glcN30xocP9vYeeay69a2K
	 z5sGvcIWal+NhUMtOcmJdvsOiGkbX8gQTD/GiM4U=
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/oeqa/fvp_devices: use http: instead of https: in network test
Date: Thu, 19 Nov 2026 17:37:34 +0000
Message-ID: <20261119173734.3314029-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Thu, 19 Nov 2026 17:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7221
Content-Type: text/plain; charset="utf-8"

The network connectivity test currently does a wget on a https: URL, but
in minimal images where wget is actually provided by busybox this will
pipe the sockets through openssl, which might not be installed.

Instead, use http://www.example.com/. This doesn't redirect to the https:
site and can be fetched with just busybox wget.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/lib/oeqa/runtime/cases/fvp_devices.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py b/meta-arm/li=
b/oeqa/runtime/cases/fvp_devices.py
index c9d08c03448..7dd50bde403 100644
--- a/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py
+++ b/meta-arm/lib/oeqa/runtime/cases/fvp_devices.py
@@ -129,7 +129,7 @@ class FvpDevicesTest(OERuntimeTestCase):
         self.check_devices("net", 2, ["virtio_net", "vif"])
=20
         # Check that outbound network connections work
-        self.run_cmd('wget -O /dev/null "https://www.arm.com"')
+        self.run_cmd('wget -O /dev/null "http://www.example.com"')
=20
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @skipIfNotInDataVar('TEST_FVP_DEVICES', 'virtiorng',
--=20
2.43.0

