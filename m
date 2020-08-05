Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.212.1596644106052070578
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 09:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=tU8SV1Ga;
 spf=pass (domain: burtonini.com, ip: 209.85.128.45, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f45.google.com with SMTP id k8so6928577wma.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 05 Aug 2020 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4L81UskiZD46eggn3ECaccGCK4VWMUxAezWrh1R+vaI=;
        b=tU8SV1GaolCjLVAiSAFyYu95xQpNzET9sv73FEIrgqlNUMK0GK2zPVKyfUHAy3Ht8U
         FbmPqORy6rKdTJAAFq6m83+zzJ1eSnAEQH+TeCIVqQxQjhyBM2mbJHrY8JIVOuH9X+Ms
         OtbC2YalJCKaNnJG6N+rkPsqtF16VYX3MI81MRdqAmO3hTakh59OGZeX1JwfdN+2e7+t
         E4XxoFZ67sYAdkUQY6ZxRrNfLYi6xpRNFcvdNqLK/6oPAXNkdXtBpNV3PxtERvHfNCWQ
         LceOMuXBX4dosjdWd/oFYNnTXYfYf4biiuz52/chepFJbbX4XQUnQxcXWdgxNNtZIzXW
         Knrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4L81UskiZD46eggn3ECaccGCK4VWMUxAezWrh1R+vaI=;
        b=l4W8IT6OD1Tt8ahTLTvg/8DgSH+eCyrVxhiTWSAO4qIDwXzS2HEwdPwVbjEPebJGdG
         hvtJ647ilbDRD+rKRf2MrdKjuZBhBEzszDd0WojGB6XEc+Itd45WxVl6AZWqqhNbII4L
         h8wSwD7Lyo29FQrYEwk0LIt8S6znPNnCE0P/cpJhcDSykmm3q2jLhU28x65aeIYEP9f/
         GC9vMxVgN+xCetILAS1icNfsKFCSce981MkhLV86XvwFmwMfkF0XpEHfR3vetMIjp7hD
         k8AsVRQXHs09jlBXRCdye0gUA/WrCw3JTQMn4V1slIndkZd6NcG1r5UUV7X1Onut55oa
         +UYA==
X-Gm-Message-State: AOAM530pK+EcsHF6eRL/nV90sy258pclO0moOUjeb0ymWaK9TvafMra0
	RG0srE5RfQ0xfiIENAw6keTmSssR+PY=
X-Google-Smtp-Source: ABdhPJyJE+9FhYy9zE/UxvJesRgZuiyOIMYy6R2ul/XP7xWJ/twoQxWWbV2raV+EckKeDCqjsmbGew==
X-Received: by 2002:a1c:9d12:: with SMTP id g18mr3684344wme.80.1596644104387;
        Wed, 05 Aug 2020 09:15:04 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id c10sm3014468wrn.24.2020.08.05.09.15.03
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 09:15:03 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/2] arm/scp-firmware: don't set DEBUG_PREFIX_MAP
Date: Wed,  5 Aug 2020 17:14:56 +0100
Message-Id: <20200805161456.1558010-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805161456.1558010-1-ross@burtonini.com>
References: <20200805161456.1558010-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The current arm-none-eabi-gcc supports all the flags that oe-core uses,
so we can remove this.

Noticed because due to the override it wasn't actually being used.

Change-Id: I09aa8c5d427fa3877f9947a0508c36a4f060ae68
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
index a5a4c06..6abe4ae 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
@@ -34,13 +34,6 @@ COMPATIBLE_MACHINE ?= "invalid"
 
 LDFLAGS[unexport] = "1"
 
-# The gcc-arm-none-eabi version does not support -fmacro-prefix-max
-DEBUG_PREFIX_MAP_pn-scp = "\
-    -fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
-    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
-"
-
 # No configure
 do_configure[noexec] = "1"
 
-- 
2.26.2

