Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.8516.1595604589072238478
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jul 2020 08:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ZlA9aDZA;
 spf=pass (domain: burtonini.com, ip: 209.85.221.52, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f52.google.com with SMTP id q5so8685061wru.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jul 2020 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vEGmNnj3WuuVuBFsrOGYEwQj1N8eCwzn6br8RLy/2I4=;
        b=ZlA9aDZAZp8C3T5MAT5X4dRJZJgfiiK1crpwM09mKST1hrjbdBRVtZc/S7/0Eq3jx0
         p+4ArHbVmg/t28gl0E6btP+qeh0UWenYJyN7/Kcu7GGVh6gwRIJTNKASWy893VV0svut
         QLiUKWTtQJ2pRslu5hCRrHslqRST7yLNaZ286VkDY0RLTuJIRBcVTNnJKLMsq4KdyNZ9
         deh5/sLrqJrixvl6kTZxhLQrAdO9EmTpqCH2QJ//1BsTH8Yc57WpAEvU2mMr4pCOL/cJ
         1HFOKgbi0Rx/F3H4I+ZhYi0oQEwuqCsjAjFdiKdiNNAnKn4htHXmI/IIfETDcc8Wu44I
         wszw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vEGmNnj3WuuVuBFsrOGYEwQj1N8eCwzn6br8RLy/2I4=;
        b=bz75pMhB7nAGkQhxeYwvk+SRHu6E8dpp2a/FSN8KTGx+7Po8YdHbWgvZ8ZNt/hNFv5
         yATmQ0H0Z8QLPKQPOe127YI51P91fmPTRzzBKEEtWrNY8uCmVYhfU9poQ+7YSsF+ewU2
         Z23P8ahmkVwW1QK3zsQJ7bGrZXwJXI8IHf+7FFaCqhS7bbRlQVNmQ9glSnP5ZlWc6FfK
         jbfV3hJqnmivV51QiQ144Jx8axH06TaA/3B+U7Zt8/egfMzAGvlb8yVy38Xxx2AOgbyo
         Q/gaYUx1AbZ4+LvhKQ4Z5VacGnbyl6kdR6VhEcKOG7I6bHDZFq1c8DrU23L8zeTrKZzX
         GTrA==
X-Gm-Message-State: AOAM5301INSmf122prz0hg2f1qfd98npXMGKk1QRBeNSz1616+1+Fyir
	dzSMwFDwIN7bdQ99Uwmc8IY4HJr2/3qlPQ==
X-Google-Smtp-Source: ABdhPJwSKDhPkJHxmsEqdP/7fvktfoNfxy8vbArmkJHI9jHRr+ucG7rj8DkYv+3ZHjuipxqxUpP2ww==
X-Received: by 2002:adf:df85:: with SMTP id z5mr8849623wrl.267.1595604587070;
        Fri, 24 Jul 2020 08:29:47 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id o3sm224086wru.64.2020.07.24.08.29.46
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 08:29:46 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp: recommend haveged, don't depend
Date: Fri, 24 Jul 2020 16:29:41 +0100
Message-Id: <20200724152942.453874-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Instead of explicitly adding haveged to IMAGE_INSTALL, add it to
MACHINE_EXTRA_RECOMMENDS.

This means people without haveged don't have failing builds, and tiny
images which don't need haveged are not forced to contain it.

Change-Id: Id30139f5b96fb0041eba8612776aaac07c7a3704
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm-bsp/conf/machine/foundation-armv8.conf | 2 +-
 meta-arm-bsp/conf/machine/fvp-base.conf         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp/conf/machine/foundation-armv8.conf
index c1b9f4d..0ff1060 100644
--- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
+++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
@@ -11,4 +11,4 @@ KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
 PACKAGE_EXCLUDE_append = " rng-tools"
-IMAGE_INSTALL_append = " haveged"
+MACHINE_EXTRA_RRECOMMENDS += "haveged"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index bd3c62d..321b5d5 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -11,4 +11,4 @@ KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
 # Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
 # rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
 PACKAGE_EXCLUDE_append = " rng-tools"
-IMAGE_INSTALL_append = " haveged"
+MACHINE_EXTRA_RRECOMMENDS += "haveged"
-- 
2.26.2

