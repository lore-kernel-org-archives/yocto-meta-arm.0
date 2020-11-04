Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7840.1604459784078578488
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 Nov 2020 19:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AEFEyjAi;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id 1so9612044ple.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 03 Nov 2020 19:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/V3zHX0FjoDfDa3O2Fsi/bLiHentzdM3ZZQefnWDZsA=;
        b=AEFEyjAikZ8ycWVdf5dKWqpOsKBgo7CXCQAG0iYELN7YHmK0M9galwY/4CFNIndEJn
         32tL2Oli1dnUfgj5jNui5tpx7dIzFW3uqLvbXYnZna+249DYchMSDwaHHZvJn+320o0z
         tSpJ6qFcpu91dNH6GSbYJvKrMpvKoAX0f+RyD6zoQjY+RiQj54qa5ch+ibXVFgtsw+m9
         VNK37EnqeudoMCwY+3n5oyFkcqjH5mgetnG4KreFBvVeO2b5tn6sYTScRlYKFaI3gU5J
         Rd74LdLDKaSyGeD5LSQOeMrIDXK3GGN0a1w8fLw/zwgtBRWJfLnHPzCZIkrZ3hQ8AYpj
         dwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/V3zHX0FjoDfDa3O2Fsi/bLiHentzdM3ZZQefnWDZsA=;
        b=kgxsw3rjtfK+JWNCi8/9s5OHrSYheI3smF8DjU9/jucoc4+psDawf8aiiIOXtuzn/o
         Thx8oZHzm5jW0rSzyNsfKkDbzxYUWkTY1ytiNWIA5XfRQAkXVG7/7/dlCX1WY9Q8tRo/
         zbdW/N6muWheVgYpJ+05jUM1r0N1BPpgUu62gZfxmg5KQfzoZmetauL7pcwrTJjgtYoB
         Bu3hcpUh5nukiKxU5RC3d5H/tMwnuVLxN/uQ6DhLi8SUKO+dl9AAVYLtGgreQWw+4D+o
         w/E2rc5gJFHwE4tJBrIIGRIBvX8dpmB6IWAuaZSURC21AoRrGXDwmqzKjbEn6UHzXHal
         PdWA==
X-Gm-Message-State: AOAM532KxrYzbdzXKDE2RwYV4nzCXIjj43ANyNtUufJfmKkqD1qeeHeZ
	tSZ1XWigoZ+Xn0x+Ur5CCbqAaMBMp1qQeA==
X-Google-Smtp-Source: ABdhPJwmFDp3/VvPH+sGm2Ug2RQ6/AOIkaEbaxBArZN+2ZZ3udzloGTxcnfEFRSA8PpQoxiLoq2w1A==
X-Received: by 2002:a17:902:7c14:b029:d4:d894:7eed with SMTP id x20-20020a1709027c14b02900d4d8947eedmr28113866pll.81.1604459783211;
        Tue, 03 Nov 2020 19:16:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id r6sm9075pfh.166.2020.11.03.19.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 19:16:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] optee-client: Disable Werror with clang
Date: Tue,  3 Nov 2020 19:16:17 -0800
Message-Id: <20201104031617.1770048-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Main flags are using gcc specific warning options e.g.
-Wunsafe-loop-optimizations which are unkown to clang so it reports then
under -Wunknown-warning-option as an error when -Werror is on

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-arm/recipes-security/optee/optee-client.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee/optee-client.inc b/meta-arm/recipes-security/optee/optee-client.inc
index 26f9724..88a9483 100644
--- a/meta-arm/recipes-security/optee/optee-client.inc
+++ b/meta-arm/recipes-security/optee/optee-client.inc
@@ -16,6 +16,7 @@ SRC_URI = " \
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
+EXTRA_OECMAKE_append_toolchain-clang = " -DCFG_WERROR=0"
 
 do_install_append() {
     install -D -p -m0644 ${WORKDIR}/tee-supplicant.service ${D}${systemd_system_unitdir}/tee-supplicant.service
-- 
2.29.2

