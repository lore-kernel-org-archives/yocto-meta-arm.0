Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE16C433F5
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 06:22:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.6960.1651213320477950756
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:22:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=e/3vN9Jc;
 spf=pass (domain: linaro.org, ip: 209.85.214.169,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pl1-f169.google.com with SMTP id d11so472921plg.10
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 23:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0qfGGOZnL7RQG1F2/mrM898lBF/Wg+OOhUOPOM3hFE=;
        b=e/3vN9JcBUhZAvQRp2drul6skeCGXp8taEgBQKCYMh5vJyNG2hRT5I1m9KuRNbUfv3
         VoSf0YCe4SKRwmQRWaciYyGVw7GGT1JllIyXgtFGUULANaCUhTcKnv6cR9ng5ZqJQzS3
         VQQJuP8mW4f0Ed1vzz6qC0b/rrhVWQsaaKpzwDbuLv8B9FisIhhuUl1d6+5FAWC5e8BZ
         tf3UJInqTOk+SDe9T+ee95QeCr6BMJBrQpzdPm8AM9d+cWGMilKBEpApeoIUcOctYpC+
         HDtUUkTqvOzogkZ05b30OBg3sNFJqp1OMjXK28uVxFESfZQ1s9aNbdUd7c0AkH47LNoQ
         s5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0qfGGOZnL7RQG1F2/mrM898lBF/Wg+OOhUOPOM3hFE=;
        b=JHvu0se3rtyyOOcYNPK0rWODW5mBZ3WtZRHziUT9MKjkhoZRI9kWNTDSFCpPieHOvq
         KrNDY2c9fB2kbPhXfdHEa7fHmHKkOXWDNvjMuFQZukbPePx1MRHrUWoyz3Q0xABdXZB1
         lIRvY78muhwAURVpqgfFJ0s8XCvU+j0zRsHDFo0+LjPSu92a7E9BGlBc7uQvBXxI7eO1
         WlLNyX+O5xITFxl3zpgQ07inIbWF698h6oheXI6qhLihZoBunA/ZQVBVLG6gVBEfQcmw
         jpvnmptjUlBWEKdLtiuHuO4bs8eO/8bILap5kvkTOSUVvfjHZ487LbTDpdEI9MKXoG97
         YdbQ==
X-Gm-Message-State: AOAM532RVsNuXTWIGaEClUV+XDvCIxK5qPF8RymQ9O7fEYMsNgFKQV6F
	JLN4Y/1MbBFib3mI6j332eDKFMnQAW8DoA==
X-Google-Smtp-Source: 
 ABdhPJzi3A0r7DUTb0absg4p+Rho7g+lAthWBzYY88ZhFM+GVrwGQaQ3cSZSsXBh3v3bLdq+CvNmRQ==
X-Received: by 2002:a17:902:ba91:b0:15a:42f3:73ef with SMTP id
 k17-20020a170902ba9100b0015a42f373efmr36879946pls.162.1651213319820;
        Thu, 28 Apr 2022 23:21:59 -0700 (PDT)
Received: from localhost.localdomain ([223.177.214.13])
        by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a150200b001cd4989ff3fsm8901739pja.6.2022.04.28.23.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 23:21:58 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denis@denix.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 1/2] external-arm-toolchain-versions: Use ldd to get libc
 version
Date: Fri, 29 Apr 2022 11:51:41 +0530
Message-Id: <20220429062142.11206-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 29 Apr 2022 06:22:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3329

Arm GCC 11.2 binary release has moved away from keeping libc library
versioning info as libc-{EAT_VER_LIBC}.so. So rather switch to
retrieving libc version by parsing output from "$ ldd --version".

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---

Changes in v2:
- Directly invoke interpreter (/bin/sh) rather than sed-in-place ldd
  executable which can lead to permissions issue.

 .../external-arm-toolchain-versions.inc       | 41 +++++++------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index a89f2f0..244de26 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -50,37 +50,26 @@ def eat_get_gcc_version(d):
 
 def eat_get_libc_version(d):
     import os,bb
+    import subprocess
+
     syspath = bb.data.expand('${EXTERNAL_TOOLCHAIN}/${EAT_TARGET_SYS}', d)
     if not syspath:
         return 'UNKNOWN'
 
-    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
-
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
-
-    libpath = syspath + '/libc/' + bb.data.expand('${EAT_LIBDIR}/', d)
-
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
-
-    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/${EAT_TARGET_SYS}/', d)
-
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
-
-    libpath = syspath + '/libc/usr/' + bb.data.expand('${EAT_LIBDIR}/', d)
+    topdir = d.getVar('TOPDIR', True)
+    lddpath = syspath + '/libc/usr/bin/ldd'
+
+    if os.path.exists(lddpath):
+        cmd = '/bin/sh ' + lddpath + ' --version'
+        try:
+            stdout, stderr = bb.process.run(cmd, cwd=topdir, stderr=subprocess.PIPE)
+        except bb.process.CmdError as exc:
+            bb.error('Failed to obtain external Arm libc version: %s' % exc)
+            return 'UNKNOWN'
+        else:
+            first_line = stdout.splitlines()[0]
+            return first_line.split()[2]
 
-    if os.path.exists(libpath):
-        for file in os.listdir(libpath):
-            if file.find('libc-') == 0:
-                return file[5:-3]
     return 'UNKNOWN'
 
 def eat_get_kernel_version(d):
-- 
2.25.1


