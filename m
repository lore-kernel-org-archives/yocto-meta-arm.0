Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web10.8986.1584506254150733146
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 21:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yAAHUF4J;
 spf=pass (domain: linaro.org, ip: 209.85.210.68, mailfrom: daniel.diaz@linaro.org)
Received: by mail-ot1-f68.google.com with SMTP id t28so21562551ott.5
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2020 21:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=En1DhJorHY3Ld85aNRuJGkiVk3vv/6gYnkQn0Zuw4I4=;
        b=yAAHUF4JOT81QkJMtFpow++PTiUFxaYQGvqE3+vIBvhi2w0y6AYNBfiCp7/CA/M9Fz
         U7RKuYuBswpgSYVr55lOafJbFQzw2vIdyIun8r6VppV11RKdNmV16HPvuB90WZaRuTZX
         wXCzLJ9Cu3LPTwwPqJjHddvo02ZRpvy8W7LkyBaFRYq6e1PEGXJngOGEA9EobpTJgr4C
         MQ0coKGM3P/t8DDNhmzTfQP7xkqtXwPetHEER9iKvfldKtb8MXRahFNiqceTGdHUDR8c
         xUK7s6Tc2yHGYs7PWrehjkQiE9zTRdQA/QGTFpxTwr9c+diGpVEMu2enMFHrbSnr8h3r
         /aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=En1DhJorHY3Ld85aNRuJGkiVk3vv/6gYnkQn0Zuw4I4=;
        b=AiskjcB0O+06UC3Jdq+eXdr5LizvGSiJ+/4/gJduoPKpevpIl7WCO7j2IwRtowSX7y
         Mtzqne7fF3EOXXb6CWngDNVWArOEFvAUG0/sNlTw6b4Xw+W4pkv0rMl47BVZ3cDAFC31
         d9cLf7bxgvzMCUPEUtVLgaeqkcUAs9/jr4/PlwyCfUevgIh0OcaZWBYc5JzYOT++O4ji
         UNM8XHLvz9/Wl9BuFu0y489PVNNmk17NBfvgsUZFVtGMQYZnosr0hs2uVoJBOPotXFI5
         gfbE1W405M+2Qr3pP8ddgD8P6Q48HED06BErS3ppvBInrmhtlnNKj7XfXdvnq+X5cxEg
         5PTQ==
X-Gm-Message-State: ANhLgQ2iQZOcRbmvAt6bumRRuSw3SChBINIluTuzx48LRKEg2nmRRPzl
	5s6C4CDgMoPg6LKz1NAlJIlzGgjvoIQ=
X-Google-Smtp-Source: ADFU+vvdtAh04G2BdiQp/appaW+Dmvl2FkrbT+c9D+8CZcCfZTgRWCnZ5nne8gAAsYda3vo7EOtciw==
X-Received: by 2002:a9d:21b4:: with SMTP id s49mr2223253otb.294.1584506252875;
        Tue, 17 Mar 2020 21:37:32 -0700 (PDT)
Return-Path: <daniel.diaz@linaro.org>
Received: from alago.cortijodelrio.net (CableLink-189-219-74-147.Hosts.InterCable.net. [189.219.74.147])
        by smtp.googlemail.com with ESMTPSA id l19sm1742667otj.69.2020.03.17.21.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 21:37:32 -0700 (PDT)
From: "Daniel D?az" <daniel.diaz@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: [PATCH v2] conf/machine: Make preferred virtual/kernel overridable
Date: Tue, 17 Mar 2020 22:37:13 -0600
Message-Id: <20200318043713.2355-1-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A user of the BSP layer may decide to use the machine
configuration but a different kernel.

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Apply the change to all existing configs

 meta-arm-bsp/conf/machine/a5ds.conf          | 2 +-
 meta-arm-bsp/conf/machine/fvp-common/fvp.inc | 2 +-
 meta-arm-bsp/conf/machine/gem5-arm64.conf    | 2 +-
 meta-arm-bsp/conf/machine/juno.conf          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/a5ds.conf b/meta-arm-bsp/conf/machine/a5ds.conf
index d220423..136105b 100644
--- a/meta-arm-bsp/conf/machine/a5ds.conf
+++ b/meta-arm-bsp/conf/machine/a5ds.conf
@@ -6,7 +6,7 @@
 
 require conf/machine/include/tune-cortexa5.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-upstream-arm"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-upstream-arm"
 PREFERRED_VERSION_linux-upstream-arm ?= "5.3%"
 KBUILD_DEFCONFIG = "multi_v7_defconfig"
 
diff --git a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
index 6bf33f3..a02890d 100644
--- a/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common/fvp.inc
@@ -34,7 +34,7 @@ DISK_IMG_PARTITION3_CONTENT = ""
 
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "4.19%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
diff --git a/meta-arm-bsp/conf/machine/gem5-arm64.conf b/meta-arm-bsp/conf/machine/gem5-arm64.conf
index 4775940..e2f58ad 100644
--- a/meta-arm-bsp/conf/machine/gem5-arm64.conf
+++ b/meta-arm-bsp/conf/machine/gem5-arm64.conf
@@ -19,7 +19,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 
 EXTRA_IMAGEDEPENDS += "virtual/gem5-bootloader"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "4.19%"
 
 
diff --git a/meta-arm-bsp/conf/machine/juno.conf b/meta-arm-bsp/conf/machine/juno.conf
index a728d0a..3b16e6f 100644
--- a/meta-arm-bsp/conf/machine/juno.conf
+++ b/meta-arm-bsp/conf/machine/juno.conf
@@ -18,7 +18,7 @@ IMAGE_FSTYPES += "tar.bz2 ext4"
 SERIAL_CONSOLES = "115200;ttyAMA0"
 
 # Use kernel provided by linaro (Contains support for SCMi or HDMI)
-PREFERRED_PROVIDER_virtual/kernel = "linux-linaro-arm"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-linaro-arm"
 PREFERRED_VERSION_linux-linaro-arm ?= "4.19%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
-- 
2.20.1

