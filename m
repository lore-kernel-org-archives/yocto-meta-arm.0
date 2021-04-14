Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.13263.1618408083555397463
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 06:48:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=qfiGDPF7;
 spf=pass (domain: blade-group.com, ip: 209.85.128.51, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f51.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so724067wmq.4
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 06:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TATS9qwuIEjBKY/VsRaFNkzzD2j4GQHtMvT5Wz37HZw=;
        b=qfiGDPF7pqeNUUPmaulHu51gqSinE1zA7Jq9+UpV/mpeQBWw4J+HlebgcCzgBhk6Zp
         6ZY3gXUOyV57a4nn1MHQ6gmzdVmHYNRtJl2Y3GrEj1fyX60NXQlo6Sx70mhqb2meS/9k
         1szcUlJ0R4fNgulM1VT+uhruLf7UMGGReP1sTvVSEK0qNrGNIvs+IBGbU0zZuF7xqaEe
         W+QMWp1k2OYXculB/Atv40uxkQmRvHj3uURdy6VgdgX2MKNzzltLyCMOAw75069psT8a
         tZKC2Qqy5XiYqeLaVjbQpBhjLcIYKNehHwSrRHdUNpKynqfusfHP8sAF/EL0K/mKuX3v
         VrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TATS9qwuIEjBKY/VsRaFNkzzD2j4GQHtMvT5Wz37HZw=;
        b=IIG+Ib5LnGvvQd3t70azmlxYsMsPmMphsWlyQ5J7Yfz4ThUjLsz9aXyK9gSLTra2eY
         Es3ntIZkcETPz8WNL5nzeYzMqx3uRRcf39psQ4NuJ/s6bkMl0o2Vl+YDm0asBMPaw/V+
         SKzLflp/Pww0ftQ1F/IuTH/WqVRMWlHHAG8EwL9RnbTQp419VPX3shJ4cs5BTuoH025j
         3uxy3DpOJRWhnkmTclZZpx5ZT7u+m2Lzs7exxS7ROXPmPYhUOvh6FpRjgsilWI69dZ/i
         lT10lFMBwrXCv77qeJZCQeAzL06qOn2IdlkVqP3642Gfa6bGlzCgGmEsY82Vc+jt/0wa
         UCcQ==
X-Gm-Message-State: AOAM532RoydGcWD37aAyiv2HZ7YzdJlqqpXl0xsShNOF80PlUv1nOUKA
	LuY7BJrDBK6TWMB6hlPjicIN4xhkISXE5g==
X-Google-Smtp-Source: ABdhPJzznsLe8Qouw1kKXd5hr623ArLNSGeVyRCVGHd6BxAVfR1yzWhlHf0TU6XekoD+okeb0TEl8w==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr3147726wmc.138.1618408082197;
        Wed, 14 Apr 2021 06:48:02 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q20sm5517551wmq.2.2021.04.14.06.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:48:01 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>,
	Ricardo Salveti <ricardo@foundries.io>
Subject: [PATCH v2 4/6] optee-client: use /var/lib/tee instead of /data/tee for persistent storage
Date: Wed, 14 Apr 2021 15:47:24 +0200
Message-Id: <20210414134726.4125294-5-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414134726.4125294-1-yann@blade-group.com>
References: <20210414134726.4125294-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This is more FHS-conformant, and allows tee-supplicant to work on a
readonly rootfs setup (although then it uses volatile storage by
default, and it is still a matter of distro policy how to arrange for
that storage to be persistent in a readonly setup).

Signed-off-by: Yann Dirson <yann@blade-group.com>
Suggested-by: Ricardo Salveti <ricardo@foundries.io>
---
 meta-arm/recipes-security/optee/optee-client.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index f697386..65c9a44 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -17,7 +17,10 @@ UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
+EXTRA_OECMAKE = " \
+    -DBUILD_SHARED_LIBS=ON \
+    -DCFG_TEE_FS_PARENT_PATH='${localstatedir}/lib/tee' \
+"
 EXTRA_OECMAKE_append_toolchain-clang = " -DCFG_WERROR=0"
 
 do_install_append() {
-- 
2.30.2

