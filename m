Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.13262.1618408084959357235
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 06:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Kb/wMioV;
 spf=pass (domain: blade-group.com, ip: 209.85.128.48, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f48.google.com with SMTP id o9-20020a1c41090000b029012c8dac9d47so3294884wma.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Emiobk/7mgXx5piUPwVbhuncWNGKCKQmgy+NT1IIKmE=;
        b=Kb/wMioVMaDaQZcO2vqwB50dbnOJVxswZd8YxtsYu6Y6ToWH3By+dKDtQ0Lik85YqC
         UbIBKJjeB6iJSAPm33pNBtBv5IRMj7zQ+bAzJzI9XAk8i9H+sgF3YSLvkYjH462p+eRi
         D7XNOMEe+C01QZlLIhCz0isfjjHVpnstsfB39p12pPY3V3t/qiQ2KfJkZh5TQmRB+9hk
         zaOxkl1gAUQj0IBn4/nQ1d5sFqO9GjwSKGRb9tzq3fiQbjZHg4EBPz5S4dRlJwOnVS7K
         xka06vJKGQmV8qbh6tGkI5HWxO4DFxXckgoDv6hjaqwu9A/pFDLwgPtfJbwd93LDxWtJ
         Hg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Emiobk/7mgXx5piUPwVbhuncWNGKCKQmgy+NT1IIKmE=;
        b=so44OnmC2LWhAAB6ZRJIHSnA7atY6qlQLhMoyvCeCICV/UYF3ZKK6s9aHUEHx7fEII
         yaSRNQGtnWlU+rzBCdSNXvk1yBzxgG2jjDgwmNIqlvgeHh62VV3c75iHY70u5WyoOJex
         c1C1aaK4EAvdbdxGn0XSGBGSSSWplwZq+aDXDh7uOhgdMRqe8g/YT2Aid5IG5b2vfbbV
         4i1R2iGWMRHy9c9RXWKzi54VmQSkNNjN4lZzNbSc+Jpnoe4jaFtU86QYoyPgnkm1Szm/
         3f6dqVzf8hwfMVEbwplgLVh8dzIB+bYNm+f4//bjXRmCV/DkRE0bLdK8wM+kYiEVZn5w
         PqOA==
X-Gm-Message-State: AOAM5322fTqagZRe6BkVUHOlvZVB5gjYy/f9q4QzsKGN6jD31daRU+mW
	ycLyjIYjP8ftH9BkoCW3IWnOSi/Z1pSn1w==
X-Google-Smtp-Source: ABdhPJzqjS67qzjtLpgNQOYMPMeCoGVoKC0ysy2kZXD7BRLoaZUNJR81itwr9JpThzUFaiO9iGLsrg==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr3103796wmb.15.1618408083639;
        Wed, 14 Apr 2021 06:48:03 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q20sm5517551wmq.2.2021.04.14.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:48:03 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 6/6] RFC: optee-os: provide a "debug" PACKAGECONFIG flag
Date: Wed, 14 Apr 2021 15:47:26 +0200
Message-Id: <20210414134726.4125294-7-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414134726.4125294-1-yann@blade-group.com>
References: <20210414134726.4125294-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This provides a simple way to enable verbose logs to check whether OP-TEE
is indeed started or not.

Note I don't include here CFG_TEE_TA_LOG_LEVEL=3, which does not have any
apparent effect, the default value of 1 not preventing TA debug messages
to be printed.

This may be a bit too low-level for this usage, though, and CORE_LOG_LEVEL=2
would be enough for the intended usage, letting the following appear on
console log to show OP-TEE starting up:

  I/TC:
  I/TC: No non-secure external DT
  I/TC: OP-TEE version: 3.11.0-dev (gcc version 10.2.0 (GCC)) #1 Fri 16 Oct 2020 02:33:06 PM UTC aarch64
  I/TC: Primary CPU initializing
  I/TC: Primary CPU switching to normal world boot

... but then "debug" would be a bad choice for a name.

It could even make sense to have CORE_LOG_LEVEL=2 be the default, if
everyone is happy that deviating from upstream on this would be good, maybe
with a PACKAGECONFIG option of "quite" which could be set at CORE_LOG_LEVEL=1
and TA_LOG_LEVEL=0 to match today's behaviour ?
---
 meta-arm/recipes-security/optee/optee-os.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index ca6e01b..9928129 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -29,6 +29,9 @@ EXTRA_OEMAKE += " \
     O=${B} \
 "
 
+PACKAGECONFIG[debug] = "CFG_TEE_CORE_LOG_LEVEL=3"
+EXTRA_OEMAKE_append = " ${PACKAGECONFIG_CONFARGS}"
+
 CFLAGS[unexport] = "1"
 LDFLAGS[unexport] = "1"
 CPPFLAGS[unexport] = "1"
-- 
2.30.2

