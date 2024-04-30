Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90D4C25B5C
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:37:58 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.14257.1714480675044631694
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=IoUG1gN2;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51c66cc680aso4314520e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714480673; x=1715085473; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WL9ZbnKK+8amjopV3yuYBxmkg4UQKVD6wcu1MzeUMOM=;
        b=IoUG1gN2E2giz5uuyVWjO8bjZsppOK2GpevRS8srg+kqT555ap4OlZpp4UKaw7x6rb
         i/MpbXhdnF4AzR0VlXj8om3D1AjAICa5kAgQIVMjQv8e+hHiiINnfQq9VajP1ufUrP+F
         rai5+gp3L4/P8zslfXL4UTnV1E1GBzRFAUgWwbYjltfqPh4ml5bkpXUhiSIo53oS5U5a
         WoWesgIJHWmdwzS1F3ntUoMo0kJkfp4mJVUac9QAtCTsPj3HacrfVV679uMiRfgFjqOJ
         aYE3Pu+AvjsNVJvarQ5vRi1FfJhkpkSB+5R9ynqYcMYJmjn33xlueWkSEt2tr5WbeogC
         zaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714480673; x=1715085473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WL9ZbnKK+8amjopV3yuYBxmkg4UQKVD6wcu1MzeUMOM=;
        b=DyZBLEVTh63HcJUly7miAZjscFzUo94qNWrewEl8qBSzjo/qcwGGa+vp4uSHFkwCwd
         aQMIrlDgX5z3D+zjCSLi4ToIqlKGa0aB/2jUYywT2KVuUriBB3vFK9eEym9D9Hrdvo5Z
         Y+aM+jMsr6omnwmJcWNKFLWtyQcGEv2HpIz5Dj2SdrIJej4D7k55vvGXwAhe9nxodDt8
         Rx+jy9w77gaevL8eMS8pdBPyfeuP8xdYn1Rf7jSIX4OsIoZA8ORSzVXh16CeAOw9hsKa
         kAQwTzyArC/jEh/H0/sflDBH+Fa0XDLfIHpH0FZasZ0A2+xkaAqvk452qPNGXy21VIAJ
         V+Kg==
X-Gm-Message-State: AOJu0Ywy6kAUgCvlr1AYJrO2WVZlO+Hu9pzGNrmBAx7IOfA2o62Ry2Am
	jDdpqYBgCpmg9KJdG+1IRRK7PxttUHakNelAhOSv1/k2fOuHY+FFfP/A3Z3/0mCkGlhUZ4/uTAI
	/NPI=
X-Google-Smtp-Source: AGHT+IHe1OkC0GOydeXt2beOKf72eKAEMu8SQiGKPOIhrpVs0wWR3B3YcaYwSTP6nvmIiRvnepaf8w==
X-Received: by 2002:ac2:59d1:0:b0:51d:534d:cb6c with SMTP id x17-20020ac259d1000000b0051d534dcb6cmr759541lfn.0.1714480673241;
        Tue, 30 Apr 2024 05:37:53 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id cf12-20020a056512280c00b0051b41844048sm3011149lfb.285.2024.04.30.05.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:37:52 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 4/6] oeqa runtime: add ftpm.py test
Date: Tue, 30 Apr 2024 15:37:30 +0300
Message-Id: <20240430123732.534277-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240430123732.534277-1-mikko.rapeli@linaro.org>
References: <20240430123732.534277-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:37:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5645

Test checks that ftpm kernel driver interfaces are available.
If fTPM optee TA is missing or crashes, the kernel driver does not
show the interfaces. A more functional tests would be to use tpm2-tools
from meta-security/meta-tpm but those require additional layer
dependencies which are maybe too much for now. tpm2-tools also depend
on starting tpm2-abrmd before the tools work. The ftpm kernel driver
depends on fully running tee-supplicant in userspace and the optee
side ftpm TA which takes some time. When manually running the tests
some of them failed since ftpm was not yet initialized. The boot
was not complete in those cases so added a workaround for that.
Better would be for all of the tests to start only once boot is
complete, not when ssh is available. Also, the qemuarm64-secureboot
machine includes optee and ftpm TA but does u-boot is not configured
to use the TPM device so boot is not measured.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/lib/oeqa/runtime/cases/ftpm.py | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-arm/lib/oeqa/runtime/cases/ftpm.py

diff --git a/meta-arm/lib/oeqa/runtime/cases/ftpm.py b/meta-arm/lib/oeqa/runtime/cases/ftpm.py
new file mode 100644
index 00000000..1fd3cf88
--- /dev/null
+++ b/meta-arm/lib/oeqa/runtime/cases/ftpm.py
@@ -0,0 +1,41 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.oetimeout import OETimeout
+
+class FtpmTestSuite(OERuntimeTestCase):
+    """
+    Minimal test for optee-ftpm and ftpm kernel driver interfaces
+    """
+    @OETimeout(200)
+    def test_ftpm(self):
+        # device files, need tee-supplicant fully initialized which takes some time
+        # and tests seem to run before boot is complete
+        cmd = "ls -l /dev/tpm0 /dev/tpmrm0 || ( runlevel; sleep 10; ls -l /dev/tpm0 /dev/tpmrm0 )"
+        status, output = self.target.run(cmd, timeout=60)
+        self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
+
+        # tpm version
+        cmd = "cat /sys/class/tpm/tpm0/tpm_version_major"
+        status, output = self.target.run(cmd, timeout=60)
+        self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
+        self.assertEqual(output, "2", msg='\n'.join([cmd, output]))
+
+        # sha384 pcrs
+        cmd = 'for c in $(seq 0 23); do cat /sys/class/tpm/tpm0/pcr-sha384/"${c}"; done'
+        status, output = self.target.run(cmd, timeout=60)
+        self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
+
+        # sha256 pcrs
+        cmd = 'for c in $(seq 0 23); do cat /sys/class/tpm/tpm0/pcr-sha256/"${c}"; done'
+        status, output = self.target.run(cmd, timeout=60)
+        self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
+
+        # sha1 pcrs
+        cmd = 'for c in $(seq 0 23); do cat /sys/class/tpm/tpm0/pcr-sha1/"${c}"; done'
+        status, output = self.target.run(cmd, timeout=60)
+        self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
-- 
2.34.1


