Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.20081.1594139105850807679
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jul 2020 09:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=HK54acXR;
 spf=pass (domain: burtonini.com, ip: 209.85.128.66, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f66.google.com with SMTP id f18so47200503wml.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 07 Jul 2020 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=MLJaot7Mt25J/SlLkIDsJFRJV7pAAlUZdHPHHBuEeZY=;
        b=HK54acXRL99I6/zFtvHsRxSpuy0bbHTpDN3evBfBAPxdul4gbUc0HF0w1vPX/5jqe7
         fVGEXt8mmxx+2wIr7OSOUA/szHDvUuY7+CsS3qrZj7IOk9rNSXsie3EaHCQHsfU951GX
         kidNh1lj84hJPNNTs95vJ5qB4k8dwRiulgbVrzTOGWYWtSY2c1K6gMY9RVb1Swm5zeyi
         SO4AP5tz1nfLWHlmG9+UcyghGvLeioLCTN7ElpLmjC7BnCH9Ume2/S3XwXXu3kYFzFEs
         iMD5l1Lh2Ugnxo0YC+F6kXkQIh1GwN31S0f+jRemKclpmZyKEQK/sHuUF5mbrSoPm4fJ
         fifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLJaot7Mt25J/SlLkIDsJFRJV7pAAlUZdHPHHBuEeZY=;
        b=OTSZuXfkTmUuBdRt0l1iA4zF2qBrNU/ChJzpPZx/kASpUGpaNe8V3aLRJXdEi+BW5C
         wzDiPbYQzRHwagKcsIAgbmLx0/qhkdUfVxLgv5QbN7wV2xFKhYIoB7BathxRav3OorNe
         MDX7hloKPyu1akwACsKHh8JncTY9FlEz4AaRCr1c6gtXfcy3Cq1yFlql0XPGxjuI6xMF
         rS/hFbDrmtsvmBrRXWmlSdSJBnifPKbRqXTuu5C7PQTUXvliXKVAKkSRXVaPNlHSTQ7p
         bX8yBbLWzH3y8Y617Rtjt0gFjuXc83h46MQl/otXp3FAZKyfTtEL2X8tChwM2SBIEd+y
         ezSw==
X-Gm-Message-State: AOAM530OEgbDfWl9X65npo24eCqvzHLonnNECy7/7DpzJwVWplyiVw9v
	9YKIWGLT2vENU5iVaezZeo0nSurxsrhE9Q==
X-Google-Smtp-Source: ABdhPJyNMzC1SWa3NObL97BaxSOoCHrVdERZ6fKqYzhsBvb30IxURbsWG70tkg19/UYpikqxogJ28A==
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr4899241wmg.70.1594139103819;
        Tue, 07 Jul 2020 09:25:03 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id p4sm1715838wrx.63.2020.07.07.09.25.03
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 09:25:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-a: consolidate FILESEXTRAPATHS
Date: Tue,  7 Jul 2020 17:24:59 +0100
Message-Id: <20200707162459.131391-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200707162459.131391-1-ross@burtonini.com>
References: <20200707162459.131391-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

There's no need to set FILESEXTRAPATHS to "${THISDIR}/files/n1sdp:" when
n1sdp is the name of the current MACHINE as bitbake will search for
override-named directories automatically.

Instead just add ${THISDIR}/files and let bitbake do it's thing.

Change-Id: I0f58933ff9e56ee41a8fdd55f467d263c4e1b1e7
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc | 1 -
 .../trusted-firmware-a/trusted-firmware-a_2.%.bbappend          | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
index ad4af5a..ef71ae5 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-n1sdp.inc
@@ -7,7 +7,6 @@ TFA_DEBUG          = "1"
 TFA_MBEDTLS        = "0"
 TFA_UBOOT          = "0"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/files/n1sdp:"
 SRC_URI_append = " \
     file://0001-n1sdp-arm-tf-disable-workaround-for-N1-Erratum-13157.patch \
     "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
index 4791538..2ce14b8 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.%.bbappend
@@ -1,3 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/files/:"
+
 # Machine specific TFAs
 
 MACHINE_TFA_REQUIRE ?= ""
-- 
2.26.2

