Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.12814.1590674864785260914
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 28 May 2020 07:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QWV21rdY;
 spf=pass (domain: linaro.org, ip: 209.85.219.68, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f68.google.com with SMTP id g7so2422207qvx.11
        for <meta-arm@lists.yoctoproject.org>; Thu, 28 May 2020 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5uQp+tTQCCCn6DWbv3vDjXyFoSZPcPd+YT4PBVsi/pU=;
        b=QWV21rdYOA50Ol2M869iZqZsLfn4g2m6BPK68ZuKjwK4pec3rNyA+V4cKkbrbaFlOm
         0uw9KP79TfhMD5T96aKR2pab3M/tJ5TTBO6yLsd+kKkTHUU40YGFpw13kONNKtqiH8aP
         AhE6xjyVPXUVIf47CeQrrqLr8dIZ31p2L+LKCswrA/mXsFMGzFm+davPN14x0lLDhSAT
         He/LFDNGQ8Xq+C9fjfTwV2XtcbB7OW4+r2sEx9uM94KpeoYKalpPwqxOJHKKZCdBSVSP
         9uAZI5TqHgRCrkvWpsQh6ZtTDO579DJ0LTMu/7muzD0IMyqL84uVzAVqveFgy4X1kHMz
         qvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5uQp+tTQCCCn6DWbv3vDjXyFoSZPcPd+YT4PBVsi/pU=;
        b=bOV0e1EHATjqFi24nOQj7k309ty8at2R1x2oJZxYBkU2VpiC5PnkM7gynnpvhyzZjX
         2SaxNgePrCAH8U4Pd95iXWtFVn7+HIUfpbhyKm5O47US0c8vGU+D5PMBXIX82oHOtJ5M
         oBE5wcV/Z8eG/i9DTkXZN9oAdyOpeCxgDdN+LheOAt4P2Qun39Osq5k2JmQ3ESOsvaAr
         ZXuFmTGVmyd2R8UWndoECbsCb+CNgRsNPzFjMvtW3WE1WgFoRm56Dx7v+dzlsO1/yAQ5
         y5cJokYHj+nQmKXpiozVxOBbiVOE2GCSWMnvs2/9kzYp5aVGg2oULl7od5zoQYeJh2t/
         x1OA==
X-Gm-Message-State: AOAM531QRMiqipDJUdUi3KjgLxglYnzulDtxH3XvFC1bGXxR3Gfb4gtT
	3KQwFQ1pMtsJ3O3Yen/c4RRzwmItqoU=
X-Google-Smtp-Source: ABdhPJwBcaTXVy/hnwCq+84EGuJrNRX7vqsJDDSAn1Hk1i+yl6RUz+bCRB1grc60jGde865iAs2p8g==
X-Received: by 2002:a05:6214:118e:: with SMTP id t14mr3168867qvv.201.1590674863431;
        Thu, 28 May 2020 07:07:43 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id a1sm5296512qtj.65.2020.05.28.07.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 07:07:42 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] arm-toolchain: set CVE_VERSION to fix cve-check warnings
Date: Thu, 28 May 2020 10:07:37 -0400
Message-Id: <20200528140737.23411-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.17.1

Yocto cve-check currently produces numerous warnings like:
    WARNING: gcc-cross-arm-arm-8.3-r2019.03 do_cve_check: gcc:
    Failed to compare arm-8.3 < 10.0 for CVE-2019-15847
In turn this means that some potential CVEs are not reported.

This occurs because PV has been prefixed with "arm-", to allow for
multiple gcc implementations.

Fix this by setting CVE_VERSION to the non-prefixed version.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
This patch is against master, but should also be applied to dunfell.

 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc | 1 +
 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc | 1 +
 meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
index c47c320..65fbeff 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.2.inc
@@ -2,6 +2,7 @@ require recipes-devtools/gcc/gcc-common.inc
 
 BASEPV = "8.2"
 PV = "arm-${BASEPV}"
+CVE_VERSION = "${BASEPV}"
 
 MMYY = "19.01"
 RELEASE = "20${MMYY}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
index 65eb0df..3fb87bb 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-8.3.inc
@@ -2,6 +2,7 @@ require recipes-devtools/gcc/gcc-common.inc
 
 BASEPV = "8.3"
 PV = "arm-${BASEPV}"
+CVE_VERSION = "${BASEPV}"
 
 MMYY = "19.03"
 RELEASE = "20${MMYY}"
diff --git a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
index 08e8f7f..08ad796 100644
--- a/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
+++ b/meta-arm-toolchain/recipes-devtools/gcc/gcc-arm-9.2.inc
@@ -3,6 +3,7 @@ require recipes-devtools/gcc/gcc-common.inc
 # Third digit in PV should be incremented after a minor release
 
 PV = "arm-9.2"
+CVE_VERSION = "9.2"
 
 # BINV should be incremented to a revision after a minor gcc release
 
-- 
2.17.1

