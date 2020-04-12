Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web11.7282.1586670335067153900
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 11 Apr 2020 22:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ThJV3Xyp;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id k15so3074291pfh.6
        for <meta-arm@lists.yoctoproject.org>; Sat, 11 Apr 2020 22:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lxoRkbDBpadUc3g/dbidasmqmTKL+F9To9kJl1/AdQg=;
        b=ThJV3XypI2cfdv1vfSB6C2fKG0Uk2JEZPo++yv6BnUN0b+i4/LYUv2Af1T0x5MEenJ
         Mtrl++Frc+DeEuIL+cIhEFwb5mI6clmi/TBuBvzK2LM9nin+eq21FS7WgSJiwOPn5qVw
         iYj9LTOtq6qXtynZKIEX5OLsnWrDSVTGxCash8IP9G/MBZsu0ToHDycjdeO15bakpwJ5
         EVZKWzPjrjWvRk0Rqd2VK/QjrLmItxpYsTzuJxfLAGuB5hamHAiQKKT2QBZPzQ0sjTd6
         CbXNRWD9goGeXqTBSaJ2r5pWkk0BYMGIL+gKcsOD7b1EmbkUpwEj/kgfw7t8/ZGwhq/w
         XRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lxoRkbDBpadUc3g/dbidasmqmTKL+F9To9kJl1/AdQg=;
        b=X9krvpK5Ia7RUC862fODlBlS+9IfF0QuPGeBAwN9n8XEo17hGTVjJ2b6ZwwkvlSkBg
         7S45d9WSUlC7RhDJv8gpV/uTS0ezIWkTL7Ev76PNWh3MUdgMKoLBLDTUOs4Y+jpWlsTy
         qxIsoLckb4G+q0g864v8uADSMyPl0Kg72mrapUd+G+LAHSaqwl3+KDPXw/fbEmaO3VqH
         Haq2ieerR5m2dogRfdfncwWqMUMvb1D8aKHLGWP+y7XRdajICrF6B7vSqsLLTk7cV1a4
         WlNQ2lH0sXI3KboURu05gdWmpkplVbd+030e54K7nCSdCoZZ+WkXW6zqnmJWCgYbuZyR
         jKdw==
X-Gm-Message-State: AGi0PuYudW4Yr13WD/52zn47BR82gV3dN9rB222nNkPQCSCRLudsg4ay
	MlaitaSPSXzlCZOZHKTBdZ4=
X-Google-Smtp-Source: APiQypKoYzxLUIANDJfl17v5OJUwLtzPjWIoM1bCntb6i0LFH14ltaZO+97T4Dhuje16aI7ouRHTdw==
X-Received: by 2002:a63:f411:: with SMTP id g17mr11449564pgi.440.1586670334197;
        Sat, 11 Apr 2020 22:45:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::58e0])
        by smtp.gmail.com with ESMTPSA id 6sm2548406pfj.123.2020.04.11.22.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 22:45:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: jon.mason@arm.com,
	meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-arm][PATCH] optee-os: Mark recipes dormant by default
Date: Sat, 11 Apr 2020 22:45:31 -0700
Message-Id: <20200412054531.1804159-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

all arm SOCs may not support optee and there are non-arm machines too
this makes this recipe fit into mutli-BSP environments, platforms which
support optee should be specifically called out via COMPATIBLE_MACHINE,
for general case it remains 'null'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee/optee-client_git.bb   | 2 ++
 meta-arm/recipes-security/optee/optee-examples_git.bb | 2 ++
 meta-arm/recipes-security/optee/optee-os_git.bb       | 1 +
 meta-arm/recipes-security/optee/optee-test_git.bb     | 1 +
 meta-arm/recipes-security/optee/optee.inc             | 2 ++
 5 files changed, 8 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee.inc

diff --git a/meta-arm/recipes-security/optee/optee-client_git.bb b/meta-arm/recipes-security/optee/optee-client_git.bb
index a25d343..bae7b20 100644
--- a/meta-arm/recipes-security/optee/optee-client_git.bb
+++ b/meta-arm/recipes-security/optee/optee-client_git.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=69663ab153298557a59c67a60a743e5b"
 
 PV = "3.8.0+git${SRCPV}"
 
+require optee.inc
+
 inherit python3native systemd
 
 SRCREV = "be4fa2e36f717f03ca46e574aa66f697a897d090"
diff --git a/meta-arm/recipes-security/optee/optee-examples_git.bb b/meta-arm/recipes-security/optee/optee-examples_git.bb
index 768a55b..996e2cd 100644
--- a/meta-arm/recipes-security/optee/optee-examples_git.bb
+++ b/meta-arm/recipes-security/optee/optee-examples_git.bb
@@ -11,6 +11,8 @@ DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
 inherit python3native
 
+require optee.inc
+
 SRC_URI = "git://github.com/linaro-swg/optee_examples.git"
 SRCREV = "559b2141c16bf0f57ccd72f60e4deb84fc2a05b0"
 
diff --git a/meta-arm/recipes-security/optee/optee-os_git.bb b/meta-arm/recipes-security/optee/optee-os_git.bb
index 47ced12..5c420b7 100644
--- a/meta-arm/recipes-security/optee/optee-os_git.bb
+++ b/meta-arm/recipes-security/optee/optee-os_git.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=c1f21c4f72f372ef38a5a4aee55ec173"
 PV = "3.8.0+git${SRCPV}"
 
 inherit deploy python3native
+require optee.inc
 
 DEPENDS = "python3-pycrypto-native python3-pyelftools-native python3-pycryptodomex-native"
 
diff --git a/meta-arm/recipes-security/optee/optee-test_git.bb b/meta-arm/recipes-security/optee/optee-test_git.bb
index 752d75d..ee73a2c 100644
--- a/meta-arm/recipes-security/optee/optee-test_git.bb
+++ b/meta-arm/recipes-security/optee/optee-test_git.bb
@@ -6,6 +6,7 @@ LICENSE = "BSD & GPLv2"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE.md;md5=daa2bcccc666345ab8940aab1315a4fa"
 
 inherit python3native
+require optee.inc
 
 DEPENDS = "optee-client optee-os python3-pycryptodomex-native"
 
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
new file mode 100644
index 0000000..a12521d
--- /dev/null
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -0,0 +1,2 @@
+COMPATIBLE_MACHINE = "null"
+# Please add supported machines below
-- 
2.26.0

