Return-Path: <sumit.garg@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FF3C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 12:29:07 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web08.9437.1651148939447349988
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 05:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HavXAHtp;
 spf=pass (domain: linaro.org, ip: 209.85.215.174,
 mailfrom: sumit.garg@linaro.org)
Received: by mail-pg1-f174.google.com with SMTP id k29so3836377pgm.12
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V1xu9K2F9tdu7KcYNncTlXu8zemr9w8lIKOwao0I/Vk=;
        b=HavXAHtpVakRZF4i7QZT0yg/bH6q7svVZfik/gELyfIOEbxLj+D1YzAiotSf8e/VKc
         tQxNC4wnsSXgy16XEU7LIg9qXIProkO5mLI+3ldSwvA9sUXPNa/jUNdcLQM+EA3Mkm0O
         YREcxWVIy5pUjzSMmsqgAH4UcG5HqSrJ8MIHy655BO4ehhUwsAP2+CBPyjkAfjfEKabn
         OO01BVAgjoLsjZ8ctBRik+Vp/A8XtL0EfYgRBQTqyljNjXVuaNqTFRQ1eo3Wy7z6ya+i
         wCoUj4SfzGhkRkEm6vsmX3+uf1aoXTsCBeBanBkx0Ljw5snSHC2j/9CMWWER8KflVxsx
         uPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V1xu9K2F9tdu7KcYNncTlXu8zemr9w8lIKOwao0I/Vk=;
        b=hcsbCODUlda7g1VU1nbYcVeyyAo39aIx0+FoBuc4YglbgBQkDK7ZT9zgqXt7JAkBiI
         sEcD/7+8egzkDCzpaWzX5yyssxgLcSeqr6ekGaBjzEcivS57rn1JOg3tAzV4ce+QAh2N
         KgBN/Nv9mccjOQAJzA8wg0JW9K6KnMGJWV5Rxapzhq1p23Wy/XM0QWoeuI3AcwbeK6QZ
         8i4NuWpgw0FUgYnLdKdqseZkQnQpiZt2cSbtif03y1rqQ0bPMWP3HqFR+dPXjbI1q8PK
         8lSVOet075CXl1HriGrqKRZk/q5iGUN3ciYDtmT4Xp8560TMLkFNmI++g3moyaw+fBf8
         ehQg==
X-Gm-Message-State: AOAM5333KBhU9g8XXbxKbp6FI3UoYRGjxFMWjwuiatNmwyjqdDBbx15F
	dk5lM5UdE7O27zZLX/LrciVkawLlyMdKBQ==
X-Google-Smtp-Source: 
 ABdhPJwBkG4RtjZ1NkAW5NVzJ/SIFxnkyW/lMOIeedZ4Ou7dw2zEDOHgD1R92bD/B2ZiiTUVl2U5kg==
X-Received: by 2002:a05:6a00:198c:b0:505:c18b:3184 with SMTP id
 d12-20020a056a00198c00b00505c18b3184mr34289696pfl.82.1651148938693;
        Thu, 28 Apr 2022 05:28:58 -0700 (PDT)
Received: from localhost.localdomain ([223.177.214.13])
        by smtp.gmail.com with ESMTPSA id
 n25-20020a056a00213900b0050d299f086asm17478558pfj.155.2022.04.28.05.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 05:28:58 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: jon.mason@arm.com,
	ross.burton@arm.com,
	denis@denix.org,
	daniel.thompson@linaro.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH 1/2] external-arm-toolchain-versions: Use ldd to get libc
 version
Date: Thu, 28 Apr 2022 17:58:47 +0530
Message-Id: <20220428122848.3941460-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 28 Apr 2022 12:29:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3322

Arm GCC 11.2 binary release has moved away from keeping libc library
versioning info as libc-{EAT_VER_LIBC}.so. So rather switch to
retrieving libc version by parsing output from "$ ldd --version".

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 .../external-arm-toolchain-versions.inc       | 43 ++++++++-----------
 1 file changed, 17 insertions(+), 26 deletions(-)

diff --git a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
index a89f2f0..388987a 100644
--- a/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
+++ b/meta-arm-toolchain/conf/distro/include/external-arm-toolchain-versions.inc
@@ -50,37 +50,28 @@ def eat_get_gcc_version(d):
 
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
+        cmd1 = 'sed -i -e \'s#/usr/bin/bash#/bin/bash#\' ' + lddpath
+        cmd2 = lddpath + ' --version'
+        try:
+            stdout, stderr = bb.process.run(cmd1, cwd=topdir, stderr=subprocess.PIPE)
+            stdout, stderr = bb.process.run(cmd2, cwd=topdir, stderr=subprocess.PIPE)
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
2.17.1


